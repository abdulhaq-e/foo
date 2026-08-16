import 'package:material_ui/material_ui.dart';

Widget wrapInBanner({
  required Widget child,
  required Color color,
  required String name,
}) {
  Color textColor = HSLColor.fromColor(color).lightness < 0.5
      ? Colors.white
      : Colors.black87;

  return Directionality(
    textDirection: TextDirection.ltr,
    child: Banner(
      color: color,
      message: name,
      location: BannerLocation.topStart,
      textStyle: TextStyle(
        color: textColor,
        fontSize: 12.0 * 0.85,
        fontWeight: FontWeight.w900,
        height: 1.0,
      ),
      child: child,
    ),
  );
}
