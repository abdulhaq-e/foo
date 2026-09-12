import 'dart:async';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';
import 'package:test/test.dart';

// Test command
class TestCommand {
  final String name;
  const TestCommand(this.name);
}

// Test response (phantom type for the stream controller only)
class TestResponse {
  final String result;
  const TestResponse(this.result);
}

// Test double for command handler
class CommandHandlerTestDouble<Command> {
  final Future<AsyncCommandResponse> Function(Command command) handler;
  int callCount = 0;
  Command? lastCommand;

  CommandHandlerTestDouble({required this.handler});

  Future<AsyncCommandResponse> call(Command command) async {
    callCount++;
    lastCommand = command;
    return handler(command);
  }
}

// Test double for OperationPollingService
class OperationPollingServiceTestDouble implements OperationPollingService {
  final Map<String, StreamController<OperationCompletionEvent>> _controllers =
      {};
  final List<String> startedOperations = [];
  final List<OperationPollingConfig> usedConfigs = [];

  @override
  Stream<OperationCompletionEvent> startPolling({
    required String operationId,
    OperationPollingConfig config = OperationPollingConfig.defaultConfig,
  }) {
    startedOperations.add(operationId);
    usedConfigs.add(config);

    if (!_controllers.containsKey(operationId)) {
      _controllers[operationId] =
          StreamController<OperationCompletionEvent>.broadcast();
    }

    return _controllers[operationId]!.stream;
  }

  void emitSuccess(String operationId, [Map<String, dynamic>? data]) {
    _controllers[operationId]?.add(OperationSucceeded(operationId, data));
  }

  void emitFailure(String operationId, [Map<String, dynamic>? error]) {
    _controllers[operationId]?.add(OperationFailed(operationId, error));
  }

  void emitTimeout(String operationId) {
    _controllers[operationId]?.add(OperationTimedOut(operationId));
  }

  @override
  int get activeOperationCount => _controllers.length;

  @override
  bool isPolling(String operationId) => _controllers.containsKey(operationId);

  @override
  void cancelPolling(String operationId) {
    _controllers[operationId]?.close();
    _controllers.remove(operationId);
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.close();
    }
    _controllers.clear();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('CommandHandlerAsyncPollingDecorator', () {
    late CommandHandlerTestDouble<TestCommand> commandHandler;
    late OperationPollingServiceTestDouble pollingService;
    late StreamController<CommandExecutionResult<TestResponse>>
    streamController;

    setUp(() {
      commandHandler = CommandHandlerTestDouble(
        handler: (command) async =>
            AsyncCommandResponse(operationId: 'op-123'),
      );
      pollingService = OperationPollingServiceTestDouble();
      streamController =
          StreamController<CommandExecutionResult<TestResponse>>();
    });

    tearDown(() {
      streamController.close();
      pollingService.dispose();
    });

    test('calls onSubmitted before execution', () async {
      var onSubmittedCalled = false;

      final decorator =
          CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
            commandHandler: commandHandler,
            pollingService: pollingService,
            onSubmitted: (command) => onSubmittedCalled = true,
          );

      await decorator(TestCommand('test'));

      expect(onSubmittedCalled, isTrue);
    });

    test('calls onPollingStarted with operationId', () async {
      var pollingCommand;
      var pollingOperationId;

      final decorator =
          CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
            commandHandler: commandHandler,
            pollingService: pollingService,
            onPollingStarted: (command, operationId) {
              pollingCommand = command;
              pollingOperationId = operationId;
            },
          );

      final command = TestCommand('test');
      await decorator(command);

      expect(pollingCommand, equals(command));
      expect(pollingOperationId, equals('op-123'));
    });

    test('starts polling via OperationPollingService', () async {
      final decorator =
          CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
            commandHandler: commandHandler,
            pollingService: pollingService,
          );

      await decorator(TestCommand('test'));

      expect(pollingService.startedOperations, contains('op-123'));
    });

    test('returns the operation id immediately, without waiting for polling', () async {
      final decorator =
          CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
            commandHandler: commandHandler,
            pollingService: pollingService,
          );

      final result = await decorator(TestCommand('test'));

      expect(result.operationId, equals('op-123'));
    });

    test('calls onSuccess when operation succeeds', () async {
      var successCommand;
      var successData;

      final decorator =
          CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
            commandHandler: commandHandler,
            pollingService: pollingService,
            onSuccess: (command, data) {
              successCommand = command;
              successData = data;
            },
          );

      final command = TestCommand('test');
      await decorator(command);

      final resultData = {'userId': 'user-123'};
      pollingService.emitSuccess('op-123', resultData);

      await Future.delayed(Duration(milliseconds: 50));

      expect(successCommand, equals(command));
      expect(successData, equals(resultData));
    });

    test('calls onFailure when operation fails', () async {
      var failureCommand;
      var failureError;

      final decorator =
          CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
            commandHandler: commandHandler,
            pollingService: pollingService,
            onFailure: (command, error) {
              failureCommand = command;
              failureError = error;
            },
          );

      final command = TestCommand('test');
      await decorator(command);

      final errorData = {'message': 'Validation failed'};
      pollingService.emitFailure('op-123', errorData);

      await Future.delayed(Duration(milliseconds: 50));

      expect(failureCommand, equals(command));
      expect(failureError, equals(errorData));
    });

    test('calls onFailure on timeout', () async {
      var failureCommand;
      var failureError;

      final decorator =
          CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
            commandHandler: commandHandler,
            pollingService: pollingService,
            onFailure: (command, error) {
              failureCommand = command;
              failureError = error;
            },
          );

      final command = TestCommand('test');
      await decorator(command);

      pollingService.emitTimeout('op-123');

      await Future.delayed(Duration(milliseconds: 50));

      expect(failureCommand, equals(command));
      expect(failureError, equals('Operation timed out'));
    });

    test('emits stream success event on completion', () async {
      final decorator =
          CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
            commandHandler: commandHandler,
            pollingService: pollingService,
            streamController: streamController,
          );

      final events = <CommandExecutionResult<TestResponse>>[];
      streamController.stream.listen((event) => events.add(event));

      await decorator(TestCommand('test'));

      pollingService.emitSuccess('op-123');

      await Future.delayed(Duration(milliseconds: 50));

      expect(events.length, equals(1));
      expect(events.first, isA<CommandExecutionSuccess>());
    });

    test('emits stream failure event when operation fails', () async {
      final decorator =
          CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
            commandHandler: commandHandler,
            pollingService: pollingService,
            streamController: streamController,
          );

      final events = <CommandExecutionResult<TestResponse>>[];
      streamController.stream.listen((event) => events.add(event));

      await decorator(TestCommand('test'));

      pollingService.emitFailure('op-123');

      await Future.delayed(Duration(milliseconds: 50));

      expect(events.length, equals(1));
      expect(events.first, isA<CommandExecutionFailure>());
    });

    group('Configuration', () {
      test('uses default config when no configBuilder', () async {
        final decorator =
            CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
              commandHandler: commandHandler,
              pollingService: pollingService,
            );

        await decorator(TestCommand('test'));

        expect(pollingService.usedConfigs.length, equals(1));
        expect(
          pollingService.usedConfigs.first,
          equals(OperationPollingConfig.defaultConfig),
        );
      });

      test('uses custom config from configBuilder', () async {
        final customConfig = OperationPollingConfig(
          pollingInterval: Duration(seconds: 5),
          timeout: Duration(seconds: 120),
        );

        final decorator =
            CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
              commandHandler: commandHandler,
              pollingService: pollingService,
              configBuilder: (command) => customConfig,
            );

        await decorator(TestCommand('test'));

        expect(pollingService.usedConfigs.length, equals(1));
        expect(
          pollingService.usedConfigs.first.pollingInterval,
          equals(Duration(seconds: 5)),
        );
        expect(
          pollingService.usedConfigs.first.timeout,
          equals(Duration(seconds: 120)),
        );
      });
    });

    group('Error Handling', () {
      test('command handler throws - calls onFailure', () async {
        var failureCalled = false;

        commandHandler = CommandHandlerTestDouble(
          handler: (command) async => throw Exception('Handler failed'),
        );

        final decorator =
            CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
              commandHandler: commandHandler,
              pollingService: pollingService,
              onFailure: (command, error) {
                failureCalled = true;
              },
            );

        try {
          await decorator(TestCommand('test'));
        } catch (_) {}

        await Future.delayed(Duration(milliseconds: 50));

        expect(failureCalled, isTrue);
      });

      test('rethrows original exception', () async {
        final originalException = Exception('Original error');

        commandHandler = CommandHandlerTestDouble(
          handler: (command) async => throw originalException,
        );

        final decorator =
            CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
              commandHandler: commandHandler,
              pollingService: pollingService,
            );

        expect(
          () => decorator(TestCommand('test')),
          throwsA(equals(originalException)),
        );
      });

      test('does not start polling when the command handler throws', () async {
        commandHandler = CommandHandlerTestDouble(
          handler: (command) async => throw Exception('Handler failed'),
        );

        final decorator =
            CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
              commandHandler: commandHandler,
              pollingService: pollingService,
            );

        try {
          await decorator(TestCommand('test'));
        } catch (_) {}

        expect(pollingService.startedOperations, isEmpty);
      });

      test('polling error triggers onFailure', () async {
        var failureError;

        final decorator =
            CommandHandlerAsyncPollingDecorator<TestCommand, TestResponse>(
              commandHandler: commandHandler,
              pollingService: pollingService,
              onFailure: (command, error) {
                failureError = error;
              },
            );

        await decorator(TestCommand('test'));

        pollingService.emitFailure('op-123', {'error': 'polling failed'});

        await Future.delayed(Duration(milliseconds: 50));

        expect(failureError, equals({'error': 'polling failed'}));
      });
    });
  });
}
