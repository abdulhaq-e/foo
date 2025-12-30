import 'package:firebase_core/firebase_core.dart';
import 'package:foo/app-core.dart';

import 'gcp_auth_bootstrapper.dart';
import 'fixed_token_auth_bootstrapper.dart';
import 'bootrap_context.dart';

class AuthBootstrapper {
  final Map<String, FirebaseOptions> firebaseEnvOptions;
  AuthBootstrapper({required this.firebaseEnvOptions});

  Future<void> bootstrap({required BootstrapContext bootstrapContext}) async {
    final appConfig = bootstrapContext.appConfig;
    switch (appConfig.authProvider) {
      case AuthProvider.gcpIdentityPlatform:
        final bootraspper = GCPAuthBootstrapper(
          firebaseEnvOptions: firebaseEnvOptions,
        );
        await bootraspper.bootstrap(bootstrapContext: bootstrapContext);
      case AuthProvider.fixedToken:
        final bootstrapper = FixedTokenAuthBootstrapper();
        await bootstrapper.bootstrap(bootstrapContext: bootstrapContext);
    }
  }
}
