import 'package:api_tools/api_tools.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';
import 'package:foo/src/app-core/src/authentication/src/gcp_identity_platform/gcp_identity_platform.dart';

import 'bootrap_context.dart';

class GCPAuthBootstrapper {
  final String authResponseStorageKey;

  final Map<String, FirebaseOptions> firebaseEnvOptions;
  GCPAuthBootstrapper({
    required this.firebaseEnvOptions,
    this.authResponseStorageKey = 'gcp_auth_response',
  });

  Future<void> bootstrap({required BootstrapContext bootstrapContext}) async {
    final appConfig = bootstrapContext.appConfig;
    String firebaseOptionsFile = appConfig.firebaseOptions;
    FirebaseOptions options = this.firebaseEnvOptions[firebaseOptionsFile]!;
    await Firebase.initializeApp(options: options);

    final serviceRegistry = bootstrapContext.serviceRegistry;
    final apiClient = serviceRegistry.get<APIClient>(name: 'base');
    final backendAuthCallbackHandler = backendAuthCallbackRemoteCommandHandler(
      apiClient,
    );

    final domainResolver = serviceRegistry.get<SaasTenantDomainResolver>();
    final authService =
        AuthProviderFactory.createGCPAuthService(
              authConfig: GCPAuthConfig(clientType: appConfig.clientType),
              backendAuthCallbackCommandHandler: backendAuthCallbackHandler,
              domainResolver: domainResolver,
            )
            as GcpIdentityPlatformAuthenticationService;

    final authStore = FirebaseAuthenticationStore(
      authenticationStore: CompositeFirebaseAuthenticationStore(
        authResponseStorageKey: authResponseStorageKey,
      ),
    );

    // 5. Create authentication interactor
    final authInteractor = AuthenticationInteractor(
      authenticationService: authService,
      authenticationStore: authStore,
    );

    // 6. Register all auth services
    serviceRegistry.register<AuthenticationService>(authService);
    serviceRegistry.register<GcpIdentityPlatformAuthenticationService>(
      authService,
    );
    serviceRegistry.register<AuthenticationStore>(authStore);
    serviceRegistry.register<AuthenticationInteractor>(authInteractor);

    // 7. Create and register auth widget builder
    final authComponentBuilder = _createAuthComponentBuilder(
      authService: authService,
      domainResolver: domainResolver,
      baseApiClient: apiClient,
    );
    serviceRegistry.register<WidgetBuilder>(
      authComponentBuilder,
      name: 'authWidgetBuilder',
    );
  }

  WidgetBuilder _createAuthComponentBuilder({
    required GcpIdentityPlatformAuthenticationService authService,
    required SaasTenantDomainResolver domainResolver,
    required APIClient baseApiClient,
  }) {
    return (BuildContext context) {
      return GCPAuthenticationComposer.composeGCPAuthenticationWidget(
        supportedMethodsQueryHandler: supportedGCPAuthMethodsRemoteQueryHandler(
          baseApiClient,
        ),
        authService: authService,
        domainResolver: domainResolver,
      );
    };
  }
}
