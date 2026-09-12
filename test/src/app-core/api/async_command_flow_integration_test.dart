import 'dart:async';
import 'package:api_tools/api_tools.dart';
import 'package:api_tools/src/testing.dart';
import 'package:foo/app-core.dart';
import 'package:foo/app-core-testing.dart';
import 'package:foo/core.dart';
import 'package:test/test.dart';

// Test command
class CreateReportCommand {
  final String reportName;
  final String reportType;

  const CreateReportCommand({
    required this.reportName,
    required this.reportType,
  });

  Map<String, dynamic> toJson() => {
    'reportName': reportName,
    'reportType': reportType,
  };
}

// Test notification tracker
class NotificationTracker {
  final List<String> notifications = [];

  void showLoading(String message) => notifications.add('loading: $message');
  void showInfo(String message) => notifications.add('info: $message');
  void showSuccess(String message) => notifications.add('success: $message');
  void showError(String message) => notifications.add('error: $message');

  void clear() => notifications.clear();
}

void main() {
  group('Async Command Flow Integration', () {
    late APIClientTestDouble apiClient;
    late OperationPollingService pollingService;
    late NotificationTracker notificationTracker;
    late StreamController<CommandExecutionResult<dynamic>> refreshController;

    Endpoint reportEndpointBuilder(CreateReportCommand command) => Endpoint(
      httpMethod: HttpMethod.post,
      path: 'api/reports',
      headers: {},
    );

    setUp(() {
      apiClient = APIClientTestDouble(
        requestCallback: (endpoint) async => dummyAPIResponse(),
      );
      pollingService = OperationPollingService(
        getOperationStatusQueryHandler:
            getOperationStatusRemoteQueryHandlerFactory(apiClient: apiClient),
      );
      notificationTracker = NotificationTracker();
      refreshController = StreamController<CommandExecutionResult<dynamic>>();
    });

    tearDown(() {
      pollingService.dispose();
      refreshController.close();
    });

    group('End-to-End Async Flow', () {
      test('submit command → 202 → poll → success → notification', () async {
        var commandRequestCount = 0;
        var statusPollCount = 0;

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            if (endpoint.path == 'api/reports') {
              // Command submission endpoint
              commandRequestCount++;
              return AsyncResponseHelpers.accepted('report-op-123');
            } else if (endpoint.path.contains('api/operations')) {
              // Status polling endpoint
              statusPollCount++;
              if (statusPollCount < 3) {
                return AsyncResponseHelpers.pending();
              }
              return AsyncResponseHelpers.success({
                'reportId': 'report-456',
                'downloadUrl': 'https://example.com/report-456.pdf',
              });
            }
            return dummyAPIResponse();
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler:
              getOperationStatusRemoteQueryHandlerFactory(apiClient: apiClient),
        );

        // Create the handler - already known to be async, no fromJsonT needed
        final rawHandler = JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
          apiClient: apiClient,
          endpointBuilder: reportEndpointBuilder,
        );

        // Decorate with async polling support
        final config = OperationPollingConfig(
          pollingInterval: Duration(milliseconds: 50),
          timeout: Duration(seconds: 10),
        );

        final handler = CommandHandlerAsyncPollingDecorator<CreateReportCommand, dynamic>(
          commandHandler: rawHandler,
          pollingService: pollingService,
          streamController: refreshController,
          onSubmitted: (command) {
            notificationTracker.showLoading('Creating report...');
          },
          onPollingStarted: (command, operationId) {
            notificationTracker.showInfo('Processing report generation...');
          },
          onSuccess: (command, data) {
            notificationTracker.showSuccess('Report created successfully!');
          },
          onFailure: (command, error) {
            notificationTracker.showError('Failed to create report');
          },
          configBuilder: (_) => config,
        );

        final refreshEvents = <CommandExecutionResult>[];
        refreshController.stream.listen((event) => refreshEvents.add(event));

        // Execute the command
        final command = CreateReportCommand(
          reportName: 'Q4 Sales Report',
          reportType: 'sales',
        );

        final result = await handler(command);

        expect(result.operationId, equals('report-op-123'));
        expect(commandRequestCount, equals(1));

        // Wait for polling to complete
        await Future.delayed(Duration(milliseconds: 300));

        // Verify polling happened
        expect(statusPollCount, greaterThanOrEqualTo(3));

        // Verify notifications in correct order
        expect(notificationTracker.notifications, [
          'loading: Creating report...',
          'info: Processing report generation...',
          'success: Report created successfully!',
        ]);

        // Verify refresh event was emitted
        expect(refreshEvents.length, equals(1));
        expect(refreshEvents.first, isA<CommandExecutionSuccess>());
      });

      test('submit command → 202 → poll → failure → notification', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            if (endpoint.path == 'api/reports') {
              return AsyncResponseHelpers.accepted('report-op-789');
            } else if (endpoint.path.contains('api/operations')) {
              return AsyncResponseHelpers.failed({
                'code': 'VALIDATION_ERROR',
                'message': 'Report type is invalid',
              });
            }
            return dummyAPIResponse();
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler:
              getOperationStatusRemoteQueryHandlerFactory(apiClient: apiClient),
        );

        final rawHandler = JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
          apiClient: apiClient,
          endpointBuilder: reportEndpointBuilder,
        );

        final handler = CommandHandlerAsyncPollingDecorator<CreateReportCommand, dynamic>(
          commandHandler: rawHandler,
          pollingService: pollingService,
          streamController: refreshController,
          onSubmitted: (command) {
            notificationTracker.showLoading('Creating report...');
          },
          onPollingStarted: (command, operationId) {
            notificationTracker.showInfo('Processing...');
          },
          onSuccess: (command, data) {
            notificationTracker.showSuccess('Report created!');
          },
          onFailure: (command, error) {
            notificationTracker.showError('Failed to create report');
          },
        );

        final refreshEvents = <CommandExecutionResult>[];
        refreshController.stream.listen((event) => refreshEvents.add(event));

        await handler(
          CreateReportCommand(reportName: 'Test', reportType: 'invalid'),
        );

        await Future.delayed(Duration(milliseconds: 100));

        expect(notificationTracker.notifications, [
          'loading: Creating report...',
          'info: Processing...',
          'error: Failed to create report',
        ]);

        expect(refreshEvents.length, equals(1));
        expect(refreshEvents.first, isA<CommandExecutionFailure>());
      });

      test('submit command → 202 → timeout → notification', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            if (endpoint.path == 'api/reports') {
              return AsyncResponseHelpers.accepted('report-op-timeout');
            } else if (endpoint.path.contains('api/operations')) {
              // Always return pending
              return AsyncResponseHelpers.pending();
            }
            return dummyAPIResponse();
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler:
              getOperationStatusRemoteQueryHandlerFactory(apiClient: apiClient),
        );

        final rawHandler = JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
          apiClient: apiClient,
          endpointBuilder: reportEndpointBuilder,
        );

        final config = OperationPollingConfig(
          pollingInterval: Duration(milliseconds: 30),
          timeout: Duration(milliseconds: 100),
        );

        final handler = CommandHandlerAsyncPollingDecorator<CreateReportCommand, dynamic>(
          commandHandler: rawHandler,
          pollingService: pollingService,
          onSubmitted: (command) {
            notificationTracker.showLoading('Creating report...');
          },
          onPollingStarted: (command, operationId) {
            notificationTracker.showInfo('Processing...');
          },
          onSuccess: (command, data) {
            notificationTracker.showSuccess('Success!');
          },
          onFailure: (command, error) {
            notificationTracker.showError('Operation timed out');
          },
          configBuilder: (_) => config,
        );

        await handler(
          CreateReportCommand(reportName: 'Test', reportType: 'test'),
        );

        await Future.delayed(Duration(milliseconds: 200));

        expect(
          notificationTracker.notifications.last,
          equals('error: Operation timed out'),
        );
      });
    });

    group('Multiple Concurrent Async Commands', () {
      test('handles multiple commands with different operation IDs', () async {
        final completedReports = <String>[];

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            if (endpoint.path == 'api/reports') {
              // Return different operation IDs
              return AsyncResponseHelpers.accepted(
                'op-${DateTime.now().millisecondsSinceEpoch}',
              );
            } else if (endpoint.path.contains('api/operations')) {
              // All operations succeed immediately
              return AsyncResponseHelpers.success({'completed': true});
            }
            return dummyAPIResponse();
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler:
              getOperationStatusRemoteQueryHandlerFactory(apiClient: apiClient),
        );

        final rawHandler = JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
          apiClient: apiClient,
          endpointBuilder: reportEndpointBuilder,
        );

        final handler = CommandHandlerAsyncPollingDecorator<CreateReportCommand, dynamic>(
          commandHandler: rawHandler,
          pollingService: pollingService,
          onSuccess: (command, data) {
            completedReports.add(command.reportName);
          },
        );

        // Submit multiple commands
        await handler(
          CreateReportCommand(reportName: 'Report A', reportType: 'type-a'),
        );
        await handler(
          CreateReportCommand(reportName: 'Report B', reportType: 'type-b'),
        );
        await handler(
          CreateReportCommand(reportName: 'Report C', reportType: 'type-c'),
        );

        // Wait for all to complete
        await Future.delayed(Duration(milliseconds: 200));

        expect(
          completedReports,
          containsAll(['Report A', 'Report B', 'Report C']),
        );
        expect(pollingService.activeOperationCount, equals(0));
      });
    });

    group('Real API Mocking Scenarios', () {
      test(
        'realistic polling progression: pending → pending → success',
        () async {
          var pollCount = 0;

          apiClient = APIClientTestDouble(
            requestCallback: (endpoint) async {
              if (endpoint.path == 'api/reports') {
                return AsyncResponseHelpers.accepted('realistic-op-456');
              } else if (endpoint.path.contains('api/operations')) {
                pollCount++;
                switch (pollCount) {
                  case 1:
                  case 2:
                    return AsyncResponseHelpers.pending();
                  case 3:
                  default:
                    return AsyncResponseHelpers.success({
                      'reportId': 'final-report-123',
                      'generatedAt': '2024-01-15T10:30:00Z',
                    });
                }
              }
              return dummyAPIResponse();
            },
          );

          pollingService = OperationPollingService(
            getOperationStatusQueryHandler:
                getOperationStatusRemoteQueryHandlerFactory(
                  apiClient: apiClient,
                ),
          );

          final rawHandler = JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
            apiClient: apiClient,
            endpointBuilder: reportEndpointBuilder,
          );

          final config = OperationPollingConfig(
            pollingInterval: Duration(milliseconds: 50),
          );

          Map<String, dynamic>? finalData;

          final handler = CommandHandlerAsyncPollingDecorator<CreateReportCommand, dynamic>(
            commandHandler: rawHandler,
            pollingService: pollingService,
            onSuccess: (command, data) {
              finalData = data;
            },
            configBuilder: (_) => config,
          );

          await handler(
            CreateReportCommand(reportName: 'Realistic', reportType: 'test'),
          );

          await Future.delayed(Duration(milliseconds: 200));

          expect(pollCount, greaterThanOrEqualTo(3));
          expect(finalData, isNotNull);
          expect(finalData!['reportId'], equals('final-report-123'));
        },
      );

      test('network error during polling', () async {
        var attemptCount = 0;

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            if (endpoint.path == 'api/reports') {
              return AsyncResponseHelpers.accepted('network-error-op');
            } else if (endpoint.path.contains('api/operations')) {
              attemptCount++;
              if (attemptCount == 1) {
                throw Exception('Network timeout');
              }
              return AsyncResponseHelpers.pending();
            }
            return dummyAPIResponse();
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler:
              getOperationStatusRemoteQueryHandlerFactory(apiClient: apiClient),
        );

        final rawHandler = JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
          apiClient: apiClient,
          endpointBuilder: reportEndpointBuilder,
        );

        var errorOccurred = false;

        final handler = CommandHandlerAsyncPollingDecorator<CreateReportCommand, dynamic>(
          commandHandler: rawHandler,
          pollingService: pollingService,
          onFailure: (command, error) {
            errorOccurred = true;
          },
        );

        await handler(
          CreateReportCommand(reportName: 'Test', reportType: 'test'),
        );

        await Future.delayed(Duration(milliseconds: 100));

        expect(errorOccurred, isTrue);
      });
    });

    group('Callback Execution Order', () {
      test('callbacks execute in correct order for async flow', () async {
        final executionOrder = <String>[];

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            if (endpoint.path == 'api/reports') {
              executionOrder.add('api-call');
              return AsyncResponseHelpers.accepted('order-test-op');
            } else if (endpoint.path.contains('api/operations')) {
              return AsyncResponseHelpers.success({'done': true});
            }
            return dummyAPIResponse();
          },
        );

        pollingService = OperationPollingService(
          getOperationStatusQueryHandler:
              getOperationStatusRemoteQueryHandlerFactory(apiClient: apiClient),
        );

        final rawHandler = JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
          apiClient: apiClient,
          endpointBuilder: reportEndpointBuilder,
        );

        final handler = CommandHandlerAsyncPollingDecorator<CreateReportCommand, dynamic>(
          commandHandler: rawHandler,
          pollingService: pollingService,
          onSubmitted: (command) {
            executionOrder.add('onSubmitted');
          },
          onPollingStarted: (command, operationId) {
            executionOrder.add('onPollingStarted');
          },
          onSuccess: (command, data) {
            executionOrder.add('onSuccess');
          },
        );

        await handler(
          CreateReportCommand(reportName: 'Order Test', reportType: 'test'),
        );

        await Future.delayed(Duration(milliseconds: 100));

        expect(executionOrder, [
          'onSubmitted',
          'api-call',
          'onPollingStarted',
          'onSuccess',
        ]);
      });
    });
  });
}
