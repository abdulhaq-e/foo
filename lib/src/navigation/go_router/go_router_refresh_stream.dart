import 'dart:async';

import 'package:flutter/foundation.dart';

class GoRouterRefreshStream<T> extends ChangeNotifier {
  GoRouterRefreshStream(Stream<T> stream, T initialValue)
      : latestValue = initialValue {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (T s) {
        latestValue = s;
        notifyListeners();
      },
    );
  }
  T latestValue;

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
