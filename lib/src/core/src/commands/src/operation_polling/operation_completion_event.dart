/// Events emitted when async operations complete, fail, or timeout.
///
/// These sealed classes allow exhaustive pattern matching when handling
/// operation completion events from the [OperationPollingService].
sealed class OperationCompletionEvent {
  final String operationId;
  const OperationCompletionEvent(this.operationId);
}

/// Emitted when an async operation completes successfully.
///
/// The [data] field contains optional result data returned by the operation.
class OperationSucceeded extends OperationCompletionEvent {
  final Map<String, dynamic>? data;
  const OperationSucceeded(super.operationId, this.data);
}

/// Emitted when an async operation fails with an error.
///
/// The [error] field contains error details returned by the operation status endpoint.
class OperationFailed extends OperationCompletionEvent {
  final Map<String, dynamic>? error;
  const OperationFailed(super.operationId, this.error);
}

/// Emitted when polling for an operation exceeds the configured timeout.
///
/// This indicates the operation took too long to complete and polling was cancelled.
class OperationTimedOut extends OperationCompletionEvent {
  const OperationTimedOut(super.operationId);
}
