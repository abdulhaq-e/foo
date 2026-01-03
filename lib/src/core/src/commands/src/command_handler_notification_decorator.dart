import 'dart:async';

import 'package:foo/core.dart';

/// A decorator that wraps a command handler to trigger notifications on success and failure.
/// This is designed for out-of-scope features to show notifications (toasts/snackbars)
/// after command execution completes.
///
/// Message builders allow dynamic notification content based on the command,
/// response, or error.
///
/// Usage:
/// ```dart
/// final decorator = CommandHandlerNotificationDecorator(
///   commandHandler: myHandler,
///   onStart: (command, response) {
///     notificationService.showLoading('Creating user...');
///   },
///   onSuccess: (command, response) {
///     notificationService.showSuccess('User ${response.name} created!');
///   },
///   onFailure: (command, error) {
///     notificationService.showError('Failed to create user: $error');
///   },
/// );
/// ```
class CommandHandlerNotificationDecorator<Command, Response> {
  final CommandHandling<Command, Response> commandHandler;
  final FutureOr<void> Function(Command command)? onStart;
  final FutureOr<void> Function(Command command, Response response)? onSuccess;
  final FutureOr<void> Function(Command command, Object error)? onFailure;

  CommandHandlerNotificationDecorator({
    required this.commandHandler,
    this.onStart,
    this.onSuccess,
    this.onFailure,
  });

  Future<Response> call(Command command) async {
    await onStart?.call(command);
    try {
      final response = await commandHandler(command);

      await onSuccess?.call(command, response);

      return response;
    } catch (error) {
      await onFailure?.call(command, error);

      rethrow;
    }
  }
}
