import 'package:flutter/material.dart';

class TransparentWidget extends StatelessWidget {
  final Color? backgroundColor;

  TransparentWidget({this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.white.withOpacity(0),
    );
  }
}
