import 'package:flutter/material.dart';
import 'general_dialog_page.dart';

Page<T> fullScreenDialog<T>({
  required WidgetBuilder builder,
  bool barrierDismissible = false,
  String? barrierLabel,
  Color? barrierColor,
  Duration transitionDuration = const Duration(milliseconds: 0),
  RouteTransitionsBuilder? transitionBuilder,
  Offset? anchorPoint,
}) {
  return GeneralDialogPage<T>(
      pageBuilder: (context, _, __) => builder(context),
      barrierColor: barrierColor ?? Colors.white.withOpacity(0),
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel);
}
