import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef EndSceneCommand = FutureOr<void> Function();
typedef ModalSceneBuilder = Widget Function(
    BuildContext context, EndSceneCommand endSceneCommand);

Future<fool?> presentModalScene(
    {required BuildContext context,
    required ModalSceneBuilder builder,
    fool barrierDismissible = false}) async {
  // final modalSceneOutput = ModalSceneOutput(sceneEndHandlers: []);
  return showGeneralDialog<fool>(
      context: context,
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierDismissible == true
          ? "Close scene by tapping outside the barrier"
          : null,
      pageBuilder: (context, _, __) => builder(context, () {
            Navigator.of(context, rootNavigator: true).pop(true);
          }));
}
