import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef EndSceneCommand = FutureOr<void> Function();
typedef ModalSceneBuilder = Widget Function(
    BuildContext context, EndSceneCommand endSceneCommand);

Future<bool?> presentModalScene(
    {required BuildContext context,
    required ModalSceneBuilder builder,
    bool barrierDismissible = false}) async {
  // final modalSceneOutput = ModalSceneOutput(sceneEndHandlers: []);
  return showGeneralDialog<bool>(
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
