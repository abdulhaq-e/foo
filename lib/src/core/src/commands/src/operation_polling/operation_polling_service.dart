import 'dart:async';

import 'package:foo/core.dart';

import 'operation_completion_event.dart';
import 'operation_polling_config.dart';

/// Metadata about an in-flight polling operation.
class _PollingOperation {
  final String operationId;
  final Timer timer;
  final DateTime startTime;
  final OperationPollingConfig config;
  final StreamController<OperationCompletionEvent> completionController;

  _PollingOperation({
    required this.operationId,
    required this.timer,
    required this.startTime,
    required this.config,
    required this.completionController,
  });
}

/// App-wide singleton service for managing async operation polling.
///
/// This service tracks multiple concurrent async operations, polls their status
/// endpoints at fixed intervals, and emits completion events when operations
/// finish, fail, or timeout.
///
/// The service is lifecycle-aware and should be registered in the [ServiceRegistry]
/// during app bootstrap. It survives BLoC disposal and continues polling even
/// when users close modals optimistically.
///
/// ## Usage
///
/// ```dart
/// // In bootstrap:
/// final getOperationStatusHandler = getOperationStatusRemoteQueryHandlerFactory(
///   apiClient: apiClient,
/// );
/// final pollingService = OperationPollingService(
///   getOperationStatus: getOperationStatusHandler,
/// );
/// serviceRegistry.register<OperationPollingService>(pollingService);
///
/// // In a decorator:
/// final stream = pollingService.startPolling(
///   operationId: '123',
///   config: OperationPollingConfig.fromTimeout(60),
/// );
///
/// stream.listen((event) {
///   switch (event) {
///     case OperationSucceeded(:final data):
///       // Handle success
///     case OperationFailed(:final error):
///       // Handle failure
///     case OperationTimedOut():
///       // Handle timeout
///   }
/// });
/// ```
class OperationPollingService {
  final QueryHandling<String, OperationStatus> _getOperationStatusQueryHandler;

  // Track active operations: operationId -> operation metadata
  final Map<String, _PollingOperation> _activeOperations = {};

  OperationPollingService({
    required QueryHandling<String, OperationStatus>
    getOperationStatusQueryHandler,
  }) : _getOperationStatusQueryHandler = getOperationStatusQueryHandler;

  /// Start polling for an async operation.
  ///
  /// Returns a broadcast stream that emits exactly one [OperationCompletionEvent]
  /// when the operation completes, fails, or times out. The stream then closes.
  ///
  /// If polling is already active for the given [operationId], returns the
  /// existing stream instead of starting a new one.
  ///
  /// The first poll happens immediately, then continues at [config.pollingInterval]
  /// until completion or timeout.
  Stream<OperationCompletionEvent> startPolling({
    required String operationId,
    OperationPollingConfig config = OperationPollingConfig.defaultConfig,
  }) {
    // If already polling this operation, return existing stream
    if (_activeOperations.containsKey(operationId)) {
      return _activeOperations[operationId]!.completionController.stream;
    }

    final completionController =
        StreamController<OperationCompletionEvent>.broadcast();

    // Create periodic timer for polling
    final timer = Timer.periodic(config.pollingInterval, (_) {
      _pollStatus(operationId);
    });

    // Store operation metadata
    _activeOperations[operationId] = _PollingOperation(
      operationId: operationId,
      timer: timer,
      startTime: DateTime.now(),
      config: config,
      completionController: completionController,
    );

    // Start first poll immediately
    _pollStatus(operationId);

    return completionController.stream;
  }

  /// Poll the status endpoint for a specific operation.
  ///
  /// Checks for timeout, makes HTTP request to status endpoint, handles the response,
  /// and emits completion events as needed.
  Future<void> _pollStatus(String operationId) async {
    final operation = _activeOperations[operationId];
    if (operation == null) return;

    // Check timeout
    if (DateTime.now().difference(operation.startTime) >
        operation.config.timeout) {
      _completeOperation(operationId, OperationTimedOut(operationId));
      return;
    }

    try {
      // Use the query handler to fetch the operation status
      final status = await _getOperationStatusQueryHandler(operationId);

      // Handle status based on operation state
      switch (status.status) {
        case OperationStatusValue.success:
          _completeOperation(
            operationId,
            OperationSucceeded(operationId, status.data),
          );
        case OperationStatusValue.failed:
          _completeOperation(
            operationId,
            OperationFailed(operationId, status.error),
          );
        case OperationStatusValue.pending:
          // Continue polling - do nothing
          break;
      }
    } catch (error) {
      // Treat polling errors as operation failures
      _completeOperation(
        operationId,
        OperationFailed(operationId, {'message': error.toString()}),
      );
    }
  }

  /// Mark an operation as complete, emit the event, and cleanup resources.
  void _completeOperation(String operationId, OperationCompletionEvent event) {
    final operation = _activeOperations.remove(operationId);
    if (operation == null) return;

    operation.timer.cancel();
    operation.completionController.add(event);
    operation.completionController.close();
  }

  /// Cancel polling for a specific operation.
  ///
  /// Stops the timer and closes the stream without emitting a completion event.
  /// Useful if the user explicitly cancels an in-progress operation.
  void cancelPolling(String operationId) {
    final operation = _activeOperations.remove(operationId);
    if (operation == null) return;

    operation.timer.cancel();
    operation.completionController.close();
  }

  /// Get the number of currently active polling operations.
  ///
  /// Useful for debugging and monitoring.
  int get activeOperationCount => _activeOperations.length;

  /// Check if a specific operation is currently being polled.
  bool isPolling(String operationId) =>
      _activeOperations.containsKey(operationId);

  /// Dispose the service and cancel all active operations.
  ///
  /// Should be called when the app is shutting down to clean up resources.
  void dispose() {
    for (final operation in _activeOperations.values) {
      operation.timer.cancel();
      operation.completionController.close();
    }
    _activeOperations.clear();
  }
}
