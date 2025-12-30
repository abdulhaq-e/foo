import 'package:flutter/widgets.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';
import 'package:foo/src/app-core/src/authentication/src/fixed_token/fixed_token.dart';
import 'package:foo/src/app-core/src/authentication/src/in_memory/in_memory_authentication_store.dart';

import 'bootrap_context.dart';

class FixedTokenAuthBootstrapper {
  /// Storage key for authentication data
  /// Can be overridden for custom storage keys
  final String authResponseStorageKey;

  FixedTokenAuthBootstrapper({
    this.authResponseStorageKey = 'fixed_token_auth_response',
  });

  Future<void> bootstrap({required BootstrapContext bootstrapContext}) async {
    final appConfig = bootstrapContext.appConfig;
    final serviceRegistry = bootstrapContext.serviceRegistry;
    final apiToken = _getApiTokenFromConfig(appConfig);

    final authService =
        AuthProviderFactory.createFixedTokenAuthService(
              authConfig: FixedTokenAuthConfig(apiToken: apiToken),
            )
            as FixedTokenAuthenticationService;

    final authStore = InMemoryAuthenticationStore();

    // 4. Create authentication interactor
    final authInteractor = AuthenticationInteractor(
      authenticationService: authService,
      authenticationStore: authStore,
    );

    // 5. Register all auth services
    serviceRegistry.register<AuthenticationService>(authService);
    serviceRegistry.register<FixedTokenAuthenticationService>(authService);
    serviceRegistry.register<AuthenticationStore>(authStore);
    serviceRegistry.register<AuthenticationInteractor>(authInteractor);

    // 6. Create and register a simple auth widget builder (auto-authenticates)
    final authWidgetBuilder = _createAuthWidgetBuilder(authInteractor);
    serviceRegistry.register<WidgetBuilder>(authWidgetBuilder);
  }

  String _getApiTokenFromConfig(AppConfig appConfig) {
    final apiToken = appConfig.fixedTokenApiToken;
    if (apiToken == null || apiToken.isEmpty) {
      throw StateError(
        'FIXED_TOKEN_API_TOKEN environment variable is required for Fixed Token authentication. '
        'Please set it in your .env file.',
      );
    }
    return apiToken;
  }

  WidgetBuilder _createAuthWidgetBuilder(
    AuthenticationInteractor authInteractor,
  ) {
    return (BuildContext context) {
      return Container();
    };
  }
}
