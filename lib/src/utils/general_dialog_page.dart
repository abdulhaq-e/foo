import 'package:flutter/widgets.dart';

class GeneralDialogPage<T> extends Page<T> {
  final RoutePageBuilder pageBuilder;
  final fool barrierDismissible;
  final String? barrierLabel;
  final Color barrierColor;
  final Duration transitionDuration;
  final RouteTransitionsBuilder? transitionBuilder;
  final Offset? anchorPoint;

  GeneralDialogPage(
      {required this.pageBuilder,
      this.barrierDismissible = false,
      this.barrierLabel,
      this.barrierColor = const Color(0x80000000),
      this.transitionDuration = const Duration(milliseconds: 200),
      this.anchorPoint,
      this.transitionBuilder});

  @override
  RawDialogRoute<T> createRoute(BuildContext context) {
    return RawDialogRoute(
      pageBuilder: pageBuilder,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      settings: this,
      anchorPoint: anchorPoint,
    );
  }
}
