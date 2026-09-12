import 'dart:async';

import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

/// Decorator for a command already known to be async (HTTP 202 always) —
/// see [AsyncCommandHandling] for why that's decided by the caller up front,
/// not detected from the response.
///
/// Bridges the gap between the command handler and the async operation
/// polling system: submits the command, registers the returned operation id
/// with [OperationPollingService], and fires notifications and stream events
/// when the polling completes.
///
/// This decorator is critical for optimistic UI patterns where users can
/// dismiss modals after submitting commands - the polling continues in the
/// background via the app-wide service and shows notifications when
/// operations complete.
///
/// ## Usage
///
/// ```dart
/// // In ScenesBuilder:
/// RegisterStudentCommandHandling _decorateRegisterStudentCommandHandler() {
///   final rawHandler = container.registerStudentCommandHandlerFactory();
///   final pollingService = serviceRegistry.get<OperationPollingService>();
///
///   return CommandHandlerAsyncPollingDecorator(
///     commandHandler: rawHandler,
///     pollingService: pollingService,
///     streamController: _studentsRefreshController,
///     onSubmitted: (command) =>
///         snackbarNotifier.showLoading('Registering student...'),
///     onPollingStarted: (command, operationId) =>
///         snackbarNotifier.showInfo('Processing registration...'),
///     onSuccess: (command, data) =>
///         snackbarNotifier.showSuccess('Student registered successfully!'),
///     onFailure: (command, error) =>
///         snackbarNotifier.showError('Failed to register student'),
///   );
/// }
/// ```
class CommandHandlerAsyncPollingDecorator<Command, Response> {
  final AsyncCommandHandling<Command> commandHandler;

  final OperationPollingService pollingService;

  final StreamController<CommandExecutionResult<Response>>? streamController;

  final FutureOr<void> Function(Command command)? onSubmitted;

  final FutureOr<void> Function(Command command, String operationId)?
  onPollingStarted;

  final FutureOr<void> Function(Command command, Map<String, dynamic>? data)?
  onSuccess;

  final FutureOr<void> Function(Command command, dynamic error)? onFailure;

  final OperationPollingConfig Function(Command command)? configBuilder;

  CommandHandlerAsyncPollingDecorator({
    required this.commandHandler,
    required this.pollingService,
    this.streamController,
    this.onSubmitted,
    this.onPollingStarted,
    this.onSuccess,
    this.onFailure,
    this.configBuilder,
  });

  /// Submit the command and start polling its operation. Returns as soon as
  /// the operation id is known — the eventual outcome arrives later via
  /// [onSuccess]/[onFailure] and [streamController], not via this future.
  Future<AsyncCommandResponse> call(Command command) async {
    await onSubmitted?.call(command);

    try {
      final asyncResponse = await commandHandler(command);
      final operationId = asyncResponse.operationId;
      final config =
          configBuilder?.call(command) ?? OperationPollingConfig.defaultConfig;

      await onPollingStarted?.call(command, operationId);

      // Start polling (this continues in background even if BLoC is disposed)
      final completionStream = pollingService.startPolling(
        operationId: operationId,
        config: config,
      );

      // Listen for completion events and fire appropriate callbacks
      completionStream.listen((event) async {
        switch (event) {
          case OperationSucceeded(:final data):
            await onSuccess?.call(command, data);
            streamController?.add(const CommandExecutionSuccess());

          case OperationFailed(:final error):
            await onFailure?.call(command, error);
            streamController?.add(const CommandExecutionFailure());

          case OperationTimedOut():
            await onFailure?.call(command, 'Operation timed out');
            streamController?.add(const CommandExecutionFailure());
        }
      });

      return asyncResponse;
    } catch (error) {
      await onFailure?.call(command, error);
      streamController?.add(const CommandExecutionFailure());
      rethrow;
    }
  }
}
