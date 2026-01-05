import 'async_command_response.model.dart';

/// Represents the outcome of a command that might execute synchronously
/// or trigger a background async operation.
sealed class CommandResult<T> {
  const CommandResult();
}

/// Case 1: The command finished immediately (HTTP 200).
/// Contains the actual data [T].
class SyncResult<T> extends CommandResult<T> {
  final T data;
  const SyncResult(this.data);
}

/// Case 2: The command started a background job (HTTP 202).
/// Contains the [AsyncCommandResponse] info (operationId).
class AsyncResult<T> extends CommandResult<T> {
  final AsyncCommandResponse response;
  const AsyncResult(this.response);
}
