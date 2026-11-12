import 'package:material_ui/material_ui.dart';

/// How long an error stays up. Longer than Material's 4s default: the user
/// has to read *why* it failed, not just notice that something happened.
const Duration kErrorSnackBarDuration = Duration(seconds: 10);

/// A snackbar that reads as a failure at a glance: the theme's error color,
/// an error icon, a bold [title] saying what failed, and an optional
/// [message] saying why.
///
/// The plain dark Material snackbar looks the same for "Saved" and for
/// "Couldn't save", so failures must not use it.
SnackBar errorSnackBar(
  BuildContext context, {
  required String title,
  String? message,
  Duration duration = kErrorSnackBarDuration,
}) {
  final colors = Theme.of(context).colorScheme;
  final textTheme = Theme.of(context).textTheme;
  final hasMessage = message != null && message.trim().isNotEmpty;

  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: colors.error,
    duration: duration,
    showCloseIcon: true,
    closeIconColor: colors.onError,
    content: Semantics(
      liveRegion: true,
      label: hasMessage ? 'Error: $title. $message' : 'Error: $title',
      excludeSemantics: true,
      child: Row(
        crossAxisAlignment: hasMessage
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: colors.onError),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleSmall?.copyWith(
                    color: colors.onError,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (hasMessage) ...[
                  const SizedBox(height: 2),
                  Text(
                    message.trim(),
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.onError,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

/// Replaces whatever snackbar is showing with an [errorSnackBar].
void showErrorSnackBar(
  BuildContext context, {
  required String title,
  String? message,
  Duration duration = kErrorSnackBarDuration,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      errorSnackBar(
        context,
        title: title,
        message: message,
        duration: duration,
      ),
    );
}
