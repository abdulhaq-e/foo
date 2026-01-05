import 'dart:async';

import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

/// Decorator that handles async commands (those that return HTTP 202 Accepted).
///
/// This decorator bridges the gap between command handlers and the async operation
/// polling system. It detects when a command returns [AsyncCommandResponse],
/// registers the operation with [OperationPollingService], and fires notifications
/// and stream events when the polling completes.
///
/// For synchronous commands (HTTP 200), this decorator behaves like
/// [CommandHandlerNotificationDecorator], firing success callbacks immediately.
///
/// This decorator is critical for optimistic UI patterns where users can dismiss
/// modals after submitting commands - the polling continues in the background via
/// the app-wide service and shows notifications when operations complete.
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
  final AsyncCommandHandling<Command, Response> commandHandler;

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

  /// Execute the command and handle sync/async responses appropriately.
  Future<CommandResult<Response>> call(Command command) async {
    await onSubmitted?.call(command);

    try {
      final result = await commandHandler(command);

      switch (result) {
        case AsyncResult(response: final asyncResp):
          await _handleAsyncResponse(command, asyncResp);
          return result;

        case SyncResult(data: final data):
          await onSuccess?.call(command, null);
          streamController?.add(const CommandExecutionSuccess());
          return result;
      }
    } catch (error) {
      await onFailure?.call(command, error);
      streamController?.add(const CommandExecutionFailure());
      rethrow;
    }
  }

  /// Handle async command response by starting polling and listening for completion.
  Future<void> _handleAsyncResponse(
    Command command,
    AsyncCommandResponse asyncResponse,
  ) async {
    final operationId = asyncResponse.operationId;
    final config =
        configBuilder?.call(command) ?? OperationPollingConfig.defaultConfig;

    // Notify that polling has started
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
  }
}
