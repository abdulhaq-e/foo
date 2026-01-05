import 'dart:async';
import 'package:foo/core.dart';
import 'package:test/test.dart';

/// Test double for the operation status query handler
class GetOperationStatusQueryHandlerTestDouble {
  Future<OperationStatus> Function(String operationId) handler;
  int callCount = 0;
  final List<String> calledWithOperationIds = [];

  GetOperationStatusQueryHandlerTestDouble({required this.handler});

  Future<OperationStatus> call(String operationId) async {
    callCount++;
    calledWithOperationIds.add(operationId);
    return handler(operationId);
  }
}

void main() {
  group('OperationPollingService', () {
    late GetOperationStatusQueryHandlerTestDouble queryHandler;
    late OperationPollingService pollingService;

    setUp(() {
      queryHandler = GetOperationStatusQueryHandlerTestDouble(
        handler: (operationId) async =>
            const OperationStatus(status: OperationStatusValue.success),
      );
      pollingService = OperationPollingService(
        getOperationStatusQueryHandler: queryHandler,
      );
    });

    tearDown(() {
      pollingService.dispose();
    });

    group('Basic Polling Flow', () {
      test('starts polling and makes immediate first request', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.pending),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );
        pollingService.startPolling(operationId: 'op-123');

        // Wait a bit to let first poll execute
        await Future.delayed(Duration(milliseconds: 50));

        expect(
          queryHandler.callCount,
          greaterThanOrEqualTo(1),
          reason: 'Should make immediate first poll',
        );

        pollingService.dispose();
      });

      test('polls at configured interval', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.pending),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final config = OperationPollingConfig(
          pollingInterval: Duration(milliseconds: 100),
          timeout: Duration(seconds: 10),
        );

        pollingService.startPolling(operationId: 'op-123', config: config);

        // Wait for ~3 polls
        await Future.delayed(Duration(milliseconds: 350));

        expect(
          queryHandler.callCount,
          greaterThanOrEqualTo(3),
          reason: 'Should poll multiple times at interval',
        );

        pollingService.dispose();
      });

      test(
        'returns existing stream if already polling same operationId',
        () async {
          queryHandler = GetOperationStatusQueryHandlerTestDouble(
            handler: (operationId) async =>
                const OperationStatus(status: OperationStatusValue.success),
          );

          pollingService = OperationPollingService(
            getOperationStatusQueryHandler: queryHandler,
          );

          final stream1 = pollingService.startPolling(operationId: 'op-123');
          final stream2 = pollingService.startPolling(operationId: 'op-123');

          // Broadcast streams allow multiple listeners on the same underlying stream
          expect(stream1.isBroadcast, isTrue);
          expect(stream2.isBroadcast, isTrue);

          // Both streams should emit the same event
          final events1 = <OperationCompletionEvent>[];
          final events2 = <OperationCompletionEvent>[];

          stream1.listen((event) => events1.add(event));
          stream2.listen((event) => events2.add(event));

          await Future.delayed(Duration(milliseconds: 100));

          // Both should receive the same completion event
          expect(events1.length, equals(1));
          expect(events2.length, equals(1));
          expect(events1.first, isA<OperationSucceeded>());
          expect(events2.first, isA<OperationSucceeded>());

          pollingService.dispose();
        },
      );

      test('completes on success status', () async {
        final resultData = {'userId': 'user-123'};

        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async => OperationStatus(
            status: OperationStatusValue.success,
            data: resultData,
          ),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final stream = pollingService.startPolling(operationId: 'op-123');
        final event = await stream.first;

        expect(event, isA<OperationSucceeded>());
        expect((event as OperationSucceeded).operationId, equals('op-123'));
        expect(event.data, equals(resultData));
        expect(
          pollingService.isPolling('op-123'),
          isFalse,
          reason: 'Should stop polling after success',
        );
      });

      test('completes on failed status', () async {
        final errorData = {'message': 'Validation failed'};

        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async => OperationStatus(
            status: OperationStatusValue.failed,
            error: errorData,
          ),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final stream = pollingService.startPolling(operationId: 'op-123');
        final event = await stream.first;

        expect(event, isA<OperationFailed>());
        expect((event as OperationFailed).operationId, equals('op-123'));
        expect(event.error, equals(errorData));
        expect(
          pollingService.isPolling('op-123'),
          isFalse,
          reason: 'Should stop polling after failure',
        );
      });

      test('continues polling while pending', () async {
        var callCount = 0;

        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async {
            callCount++;
            if (callCount < 3) {
              return const OperationStatus(
                status: OperationStatusValue.pending,
              );
            }
            return const OperationStatus(
              status: OperationStatusValue.success,
              data: {'completed': true},
            );
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final config = OperationPollingConfig(
          pollingInterval: Duration(milliseconds: 50),
        );

        final stream = pollingService.startPolling(
          operationId: 'op-123',
          config: config,
        );

        final event = await stream.first;

        expect(event, isA<OperationSucceeded>());
        expect(
          callCount,
          greaterThanOrEqualTo(3),
          reason: 'Should continue polling until success',
        );
      });

      test('times out after configured duration', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.pending),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final config = OperationPollingConfig(
          pollingInterval: Duration(milliseconds: 50),
          timeout: Duration(milliseconds: 200),
        );

        final stream = pollingService.startPolling(
          operationId: 'op-123',
          config: config,
        );

        final event = await stream.first;

        expect(event, isA<OperationTimedOut>());
        expect((event as OperationTimedOut).operationId, equals('op-123'));
        expect(
          pollingService.isPolling('op-123'),
          isFalse,
          reason: 'Should stop polling after timeout',
        );
      });

      test('handles multiple concurrent operations', () async {
        final completedOps = <String>[];

        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async {
            if (operationId == 'op-1') {
              return const OperationStatus(
                status: OperationStatusValue.success,
                data: {'op': '1'},
              );
            } else if (operationId == 'op-2') {
              return const OperationStatus(
                status: OperationStatusValue.success,
                data: {'op': '2'},
              );
            } else {
              return const OperationStatus(
                status: OperationStatusValue.success,
                data: {'op': '3'},
              );
            }
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final stream1 = pollingService.startPolling(operationId: 'op-1');
        final stream2 = pollingService.startPolling(operationId: 'op-2');
        final stream3 = pollingService.startPolling(operationId: 'op-3');

        stream1.listen((event) {
          if (event is OperationSucceeded) completedOps.add('op-1');
        });
        stream2.listen((event) {
          if (event is OperationSucceeded) completedOps.add('op-2');
        });
        stream3.listen((event) {
          if (event is OperationSucceeded) completedOps.add('op-3');
        });

        // Wait for all to complete
        await Future.delayed(Duration(milliseconds: 100));

        expect(completedOps, containsAll(['op-1', 'op-2', 'op-3']));
        expect(pollingService.activeOperationCount, equals(0));
      });
    });

    group('Error Handling', () {
      test('handles query handler errors gracefully', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async {
            throw Exception('Network error');
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final stream = pollingService.startPolling(operationId: 'op-123');
        final event = await stream.first;

        expect(event, isA<OperationFailed>());
        expect((event as OperationFailed).error, isNotNull);
        expect(event.error!['message'], contains('Network error'));
      });

      test('treats query handler exceptions as operation failures', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async {
            throw Exception('HTTP 500: Internal Server Error');
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final stream = pollingService.startPolling(operationId: 'op-123');
        final event = await stream.first;

        expect(event, isA<OperationFailed>());
      });
    });

    group('Resource Management', () {
      test('cancels timer on completion', () async {
        var pollCount = 0;

        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async {
            pollCount++;
            return const OperationStatus(status: OperationStatusValue.success);
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final config = OperationPollingConfig(
          pollingInterval: Duration(milliseconds: 50),
        );

        pollingService.startPolling(operationId: 'op-123', config: config);

        // Wait for completion
        await Future.delayed(Duration(milliseconds: 100));

        final pollCountAfterCompletion = pollCount;

        // Wait more and verify no additional polls
        await Future.delayed(Duration(milliseconds: 200));

        expect(
          pollCount,
          equals(pollCountAfterCompletion),
          reason: 'Should not poll after completion',
        );
      });

      test('closes stream on completion', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.success),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final stream = pollingService.startPolling(operationId: 'op-123');

        var eventCount = 0;
        var isDone = false;

        stream.listen((event) => eventCount++, onDone: () => isDone = true);

        await Future.delayed(Duration(milliseconds: 100));

        expect(eventCount, equals(1), reason: 'Should emit exactly one event');
        expect(isDone, isTrue, reason: 'Stream should close after event');
      });

      test('cleanup on dispose', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.pending),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        pollingService.startPolling(operationId: 'op-1');
        pollingService.startPolling(operationId: 'op-2');

        expect(pollingService.activeOperationCount, equals(2));

        pollingService.dispose();

        expect(pollingService.activeOperationCount, equals(0));
      });

      test('cancelPolling stops timer and closes stream', () async {
        var pollCount = 0;

        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async {
            pollCount++;
            return const OperationStatus(status: OperationStatusValue.pending);
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final config = OperationPollingConfig(
          pollingInterval: Duration(milliseconds: 50),
        );

        final stream = pollingService.startPolling(
          operationId: 'op-123',
          config: config,
        );

        var isDone = false;
        stream.listen((event) {}, onDone: () => isDone = true);

        await Future.delayed(Duration(milliseconds: 100));

        pollingService.cancelPolling('op-123');

        final pollCountAfterCancel = pollCount;

        await Future.delayed(Duration(milliseconds: 200));

        expect(
          pollCount,
          equals(pollCountAfterCancel),
          reason: 'Should stop polling after cancel',
        );
        expect(isDone, isTrue, reason: 'Stream should close after cancel');
        expect(pollingService.isPolling('op-123'), isFalse);
      });

      test('no memory leaks with multiple operations', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.success),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        // Start and complete many operations
        for (var i = 0; i < 20; i++) {
          pollingService.startPolling(operationId: 'op-$i');
        }

        await Future.delayed(Duration(milliseconds: 100));

        expect(
          pollingService.activeOperationCount,
          equals(0),
          reason: 'All completed operations should be cleaned up',
        );
      });
    });

    group('Edge Cases', () {
      test('operation completes before first poll', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.success),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final stream = pollingService.startPolling(operationId: 'op-123');
        final event = await stream.first;

        expect(event, isA<OperationSucceeded>());
      });

      test('multiple subscribers to same operation stream', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.success),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final stream = pollingService.startPolling(operationId: 'op-123');

        var subscriber1Received = false;
        var subscriber2Received = false;

        stream.listen((event) => subscriber1Received = true);
        stream.listen((event) => subscriber2Received = true);

        await Future.delayed(Duration(milliseconds: 100));

        expect(subscriber1Received, isTrue);
        expect(subscriber2Received, isTrue);
      });

      test('polling cancelled then restarted', () async {
        var callCount = 0;

        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async {
            callCount++;
            return callCount < 5
                ? const OperationStatus(status: OperationStatusValue.pending)
                : const OperationStatus(status: OperationStatusValue.success);
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final config = OperationPollingConfig(
          pollingInterval: Duration(milliseconds: 50),
        );

        // Start first polling
        pollingService.startPolling(operationId: 'op-123', config: config);

        await Future.delayed(Duration(milliseconds: 100));

        // Cancel it
        pollingService.cancelPolling('op-123');

        // Restart
        final stream = pollingService.startPolling(
          operationId: 'op-123',
          config: config,
        );

        final event = await stream.first;

        expect(event, isA<OperationSucceeded>());
      });

      test('very short timeout completes immediately', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.pending),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final config = OperationPollingConfig(
          pollingInterval: Duration(milliseconds: 50),
          timeout: Duration(milliseconds: 1),
        );

        final stream = pollingService.startPolling(
          operationId: 'op-123',
          config: config,
        );

        final event = await stream.first.timeout(Duration(seconds: 1));

        expect(event, isA<OperationTimedOut>());
      });

      test('invalid operationId format still works', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.success),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final stream = pollingService.startPolling(
          operationId: 'invalid@#\$%^&*()',
        );

        final event = await stream.first;

        expect(event, isA<OperationSucceeded>());
      });
    });

    group('Monitoring', () {
      test('activeOperationCount is accurate', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.pending),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        expect(pollingService.activeOperationCount, equals(0));

        pollingService.startPolling(operationId: 'op-1');
        expect(pollingService.activeOperationCount, equals(1));

        pollingService.startPolling(operationId: 'op-2');
        expect(pollingService.activeOperationCount, equals(2));

        pollingService.cancelPolling('op-1');
        expect(pollingService.activeOperationCount, equals(1));

        pollingService.dispose();
      });

      test('isPolling returns correct state', () async {
        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async =>
              const OperationStatus(status: OperationStatusValue.pending),
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        expect(pollingService.isPolling('op-123'), isFalse);

        pollingService.startPolling(operationId: 'op-123');

        expect(pollingService.isPolling('op-123'), isTrue);
        expect(pollingService.isPolling('op-999'), isFalse);

        pollingService.dispose();
      });

      test('state tracking across lifecycle', () async {
        var callCount = 0;

        queryHandler = GetOperationStatusQueryHandlerTestDouble(
          handler: (operationId) async {
            callCount++;
            if (callCount < 3) {
              return const OperationStatus(
                status: OperationStatusValue.pending,
              );
            }
            return const OperationStatus(status: OperationStatusValue.success);
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler: queryHandler,
        );

        final config = OperationPollingConfig(
          pollingInterval: Duration(milliseconds: 50),
        );

        pollingService.startPolling(operationId: 'op-123', config: config);

        expect(pollingService.isPolling('op-123'), isTrue);

        // Wait for completion
        await Future.delayed(Duration(milliseconds: 300));

        expect(pollingService.isPolling('op-123'), isFalse);
        expect(pollingService.activeOperationCount, equals(0));
      });
    });
  });
}
