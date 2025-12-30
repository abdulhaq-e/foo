import 'dart:async';
import 'package:foo/core.dart';

import 'internal.dart';

typedef SupportedGCPAuthMethodsQueryHandler =
    QueryHandling<SupportedGCPAuthMethodsQuery, SupportedGCPAuthMethods>;

abstract class GCPAuthenticationDelegate {
  void onAuthenticationSuccess();
  void onAuthenticationError(Object error);
}
