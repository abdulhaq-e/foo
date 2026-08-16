import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ScreenEndCallback = FutureOr<void> Function();

class ScreenEndCallbackContainer {
  final List<ScreenEndCallback> callbacks;

  ScreenEndCallbackContainer({required this.callbacks});
}

Future<ScreenEndCallbackContainer?> pushScreenAsDialog(
    {required BuildContext context, required WidgetBuilder builder}) async {
  return showGeneralDialog<ScreenEndCallbackContainer>(
      context: context,
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      pageBuilder: (context, _, __) => RepositoryProvider(
            create: (_) => ScreenEndCallbackContainer(callbacks: []),
            child: builder(context),
          ));
}
