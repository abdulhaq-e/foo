import 'dart:async';

import 'package:api_tools/api_tools.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:foo/core.dart';
import 'package:http/http.dart' as http;

import 'package:foo/app-core.dart';

import 'auth_bootstrapper.dart';
import 'feature_registration.dart';
import 'feature_registry.dart';
import 'ui_bootstrapper/ui_bootstrapper.dart';
import 'saas_tenant_bootstrapper.dart';
import 'user_session_bootstrapper.dart';
import 'bootrap_context.dart';

class AppBootstrapper<TAppContext> {
  final Map<String, FirebaseOptions> firebaseEnvOptions;
  final Future<void> Function(FutureOr<Widget> Function()) appRunner;

  final ServiceRegistry Function(DotEnv env) createServiceRegistry;

  final TAppContext Function(BootstrapContext bootstrapContext)
  createAppContext;

  final Widget Function(
    BootstrapContext bootstrapContext,
    TAppContext appContext,
  )
  buildApp;

  final List<FeatureRegistration<TAppContext>> features;

  AppBootstrapper({
    required this.firebaseEnvOptions,
    required this.appRunner,
    required this.createServiceRegistry,
    required this.createAppContext,
    required this.buildApp,
    this.features = const [],
  });

  Future<void> bootstrap() async {
    final environment = _parseEnvironment();
    usePathUrlStrategy();
    WidgetsFlutterBinding.ensureInitialized();

    final env = await const EnvConfigLoader().load(
      flavourEnvFile: environment.envFile,
    );

    final appConfig = _createAppConfig(environment, env);
    final serviceRegistry = createServiceRegistry(env);
    final bootstrapContext = BootstrapContext(
      env: env,
      appConfig: appConfig,
      environment: environment,
      serviceRegistry: serviceRegistry,
    );
    await _ensureEssentialServices(bootstrapContext);

    const uiBootstrapper = UIBootstrapper();
    final saasTenantBootstrapper = SaasTenantBootstrapper(
      onLoadingTextUpdate: uiBootstrapper.updateLoadingText,
      onTenantInfoUpdate: uiBootstrapper.updateTenantInfo,
      onLoadingError: uiBootstrapper.showError,
    );
    await saasTenantBootstrapper.bootstrap(bootrapContext: bootstrapContext);

    final authBootstrapper = AuthBootstrapper(
      firebaseEnvOptions: firebaseEnvOptions,
    );
    await authBootstrapper.bootstrap(bootstrapContext: bootstrapContext);

    await _setupAuthenticatedApiClient(bootstrapContext);

    final userSessionBootstrapper = UserSessionBootstrapper();
    await userSessionBootstrapper.bootstrap(bootstrapContext: bootstrapContext);

    final appContext = createAppContext(bootstrapContext);

    final featureRegistry = FeatureRegistry<TAppContext>();
    for (final feature in features) {
      featureRegistry.add(feature);
    }
    featureRegistry.registerAll(appContext);

    Widget appBuilder() {
      Widget app = buildApp(bootstrapContext, appContext);

      final bannerName = environment.bannerName;
      final bannerColor = environment.bannerColor;
      final wrappedApp = (bannerName != null && bannerColor != null)
          ? wrapInBanner(child: app, color: bannerColor, name: bannerName)
          : app;

      return wrappedApp;
    }

    await appRunner(appBuilder);
  }

  Future<void> _ensureEssentialServices(BootstrapContext bootrapContext) async {
    final serviceRegistry = bootrapContext.serviceRegistry;
    final appConfig = bootrapContext.appConfig;

    if (serviceRegistry.tryGet<BaseAPIClientType>() == null) {
      final apiClient = HttpAPIClient(
        baseURL: appConfig.apiURL,
        client: http.Client() as http.BaseClient,
      );
      serviceRegistry.register<BaseAPIClientType>(apiClient);
    }

    serviceRegistry.register(
      SaasTenantDomainResolver(
        domainFromEnv: appConfig.domainFromEnv,
        priority: appConfig.domainResolutionPriority,
      ),
    );
  }

  Future<void> _setupAuthenticatedApiClient(
    BootstrapContext bootrapContext,
  ) async {
    final serviceRegistry = bootrapContext.serviceRegistry;
    final apiClient = serviceRegistry.get<BaseAPIClientType>();
    final authenticationInteractor = serviceRegistry
        .get<AuthenticationInteractor>();
    final tokenProvider = AuthenticationInteractorTokenProvider(
      authenticationInteractor: authenticationInteractor,
    );
    final saasTenantEntityIdProvider =
        AuthenticationInteractorSaasEntityIdProvider(
          authenticationInteractor: authenticationInteractor,
        );
    final saasTenantAPIClient = SaasTenantAPIClient(
      client: apiClient,
      tenantProvider: saasTenantEntityIdProvider,
    );

    final additionalHeaders = <String, String>{};

    final authProvider = bootrapContext.appConfig.authProvider;
    switch (authProvider) {
      case AuthProvider.gcpIdentityPlatform:
        additionalHeaders['X-AUTH-PROVIDER'] = 'GCP_IDENTITY_PLATFORM';
      default:
    }
    final secureAPIClient = SecureAPIClient(
      client: saasTenantAPIClient,
      tokenProvider: tokenProvider,
      additionalHeaders: additionalHeaders,
    );

    final tokenRefreshLock = TokenRefreshLock(tokenProvider: tokenProvider);
    final authenticatedApiClient = RefreshableAPIClient(
      client: secureAPIClient,
      tokenRefreshLock: tokenRefreshLock,
    );

    serviceRegistry.register(tokenRefreshLock);
    serviceRegistry.register<AuthenticatedAPIClientType>(
      authenticatedApiClient,
    );
  }

  Environment _parseEnvironment() {
    const appEnvironment = String.fromEnvironment('ENVIRONMENT');
    if (appEnvironment == '') {
      throw Exception(
        'DID NOT SET APP ENVIRONMENT (use --dart-define=ENVIRONMENT=PROD)',
      );
    }

    return switch (appEnvironment) {
      'DEV' => Environment.development,
      'PROD' => Environment.production,
      'STG' => Environment.staging,
      'LOCAL' => Environment.local,
      _ => throw Exception('UNKNOWN ENVIRONMENT: $appEnvironment'),
    };
  }

  SaasTenantResolutionPriority _parseSaasTenantResolutionPriority(DotEnv env) {
    final value = env.get('SAAS_TENANT_RESOLVER_PRIORITY');
    return switch (value) {
      'HOST' => SaasTenantResolutionPriority.host,
      'ENV' => SaasTenantResolutionPriority.env,
      _ => SaasTenantResolutionPriority.host,
    };
  }

  AppConfig _createAppConfig(Environment environment, DotEnv env) {
    final apiUrl = env.get('BACKEND_URL');
    late AuthProvider authProvider;

    if (env.get('AUTH_PROVIDER') == 'FIXED_TOKEN') {
      authProvider = AuthProvider.fixedToken;
    } else if (env.get('AUTH_PROVIDER') == 'GCP_IDENTITY_PLATFORM') {
      authProvider = AuthProvider.gcpIdentityPlatform;
    } else {
      throw Exception('Unknown auth provider or no auth provider set');
    }

    SaasTenantResolutionPriority priority = _parseSaasTenantResolutionPriority(
      env,
    );

    String domainFromEnvVal = env.get('SAAS_TENANT_DOMAIN', fallback: '');
    String? domainFromEnv = domainFromEnvVal.isEmpty ? null : domainFromEnvVal;

    // SaaS Tenant Branding Configuration
    final saasTenantBrandingQueryHandler = env.get(
      'SAAS_TENANT_BRANDING_QUERY_HANDLER',
    );
    final localSaasTenantName = env.maybeGet('LOCAL_SAAS_TENANT_NAME');
    final localSaasTenantDescription = env.maybeGet(
      'LOCAL_SAAS_TENANT_DESCRIPTION',
    );
    final localSaasTenantPrimaryColour = env.maybeGet(
      'LOCAL_SAAS_TENANT_PRIMARY_COLOUR',
    );
    final localSaasTenantTestingSleepTimeStr = env.maybeGet(
      'LOCAL_SAAS_TENANT_TESTING_SLEEP_TIME',
    );
    final localSaasTenantTestingSleepTime =
        localSaasTenantTestingSleepTimeStr != null
        ? int.tryParse(localSaasTenantTestingSleepTimeStr)
        : null;

    // Firebase Configuration
    final firebaseOptions = env.get('FIREBASE_OPTIONS');

    // Fixed Token Authentication
    final fixedTokenApiToken = env.maybeGet('FIXED_TOKEN_API_TOKEN');

    switch (environment) {
      default:
        return AppConfig(
          apiURL: apiUrl,
          authProvider: authProvider,
          domainFromEnv: domainFromEnv,
          domainResolutionPriority: priority,
          saasTenantBrandingQueryHandler: saasTenantBrandingQueryHandler,
          localSaasTenantName: localSaasTenantName,
          localSaasTenantDescription: localSaasTenantDescription,
          localSaasTenantPrimaryColour: localSaasTenantPrimaryColour,
          localSaasTenantTestingSleepTime: localSaasTenantTestingSleepTime,
          firebaseOptions: firebaseOptions,
          fixedTokenApiToken: fixedTokenApiToken,
        );
    }
  }
}
