import 'package:flutter/material.dart';

/// A helper for showing snackbars using a GlobalKey<ScaffoldMessengerState>.
/// This avoids BuildContext issues when showing notifications from outside the widget tree.
///
/// Usage:
/// ```dart
/// // In your app setup
/// final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
/// final snackbarNotifier = SnackbarNotifier(scaffoldMessengerKey);
///
/// MaterialApp(
///   scaffoldMessengerKey: scaffoldMessengerKey,
///   ...
/// );
///
/// // Use with notification decorator
/// final decorator = CommandHandlerNotificationDecorator(
///   commandHandler: myHandler,
///   onSuccess: (command, response) {
///     snackbarNotifier.showSuccess('Operation completed!');
///   },
///   onFailure: (command, error) {
///     snackbarNotifier.showError('Operation failed: $error');
///   },
/// );
/// ```
class SnackbarNotifier {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  SnackbarNotifier(this.scaffoldMessengerKey);

  ScaffoldMessengerState? get _messenger => scaffoldMessengerKey.currentState;

  /// Shows a success snackbar with green background.
  void showSuccess(String message, {Duration? duration}) {
    _show(
      message,
      backgroundColor: Colors.green,
      duration: duration,
    );
  }

  /// Shows an error snackbar with red background.
  void showError(String message, {Duration? duration}) {
    _show(
      message,
      backgroundColor: Colors.red,
      duration: duration,
    );
  }

  /// Shows an info snackbar with blue background.
  void showInfo(String message, {Duration? duration}) {
    _show(
      message,
      backgroundColor: Colors.blue,
      duration: duration,
    );
  }

  /// Shows a loading snackbar with a long duration.
  /// This will be auto-dismissed when another snackbar is shown.
  void showLoading(String message) {
    _show(
      message,
      backgroundColor: Colors.grey[700],
      duration: const Duration(minutes: 1), // Long duration for loading states
    );
  }

  /// Clears all currently showing snackbars.
  void clear() {
    _messenger?.clearSnackBars();
  }

  void _show(
    String message, {
    Color? backgroundColor,
    Duration? duration,
  }) {
    final messenger = _messenger;
    if (messenger == null) return;

    messenger.clearSnackBars(); // Clear any existing snackbars
    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }
}
