import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

import 'feature_registration.dart';
import 'feature_registry.dart';
import 'firebase_bootstrapper.dart';
import 'ui_bootstrapper/ui_bootstrapper.dart';
import 'saas_tenant_bootstrapper.dart';

/// Context passed to the app builder containing all bootstrapped dependencies
class BootstrapContext<TDependencyContainer> {
  final DotEnv env;
  final SaasTenantBranding saasTenantBranding;
  final TDependencyContainer dependencyContainer;
  final Environment environment;

  BootstrapContext({
    required this.env,
    required this.saasTenantBranding,
    required this.dependencyContainer,
    required this.environment,
  });
}

class AppBootstrapper<TAppContext, TDependencyContainer> {
  final Map<String, FirebaseOptions> firebaseEnvOptions;
  final Future<void> Function(FutureOr<Widget>) appRunner;

  /// Creates the dependency container from env and tenant info
  final TDependencyContainer Function(
    DotEnv env,
    SaasTenantBranding saasTenantBranding,
  )
  createDependencyContainer;

  /// Creates the app-specific context used for feature registration
  /// This is called after the dependency container is created but before features are registered
  final TAppContext Function(
    BootstrapContext<TDependencyContainer> bootstrapContext,
  )
  createAppContext;

  /// Builds the main app widget
  /// Called after all features are registered
  final Widget Function(
    BootstrapContext<TDependencyContainer> bootstrapContext,
    TAppContext appContext,
  )
  buildApp;

  /// List of features to register during bootstrap
  final List<FeatureRegistration<TAppContext>> features;

  AppBootstrapper({
    required this.firebaseEnvOptions,
    required this.appRunner,
    required this.createDependencyContainer,
    required this.createAppContext,
    required this.buildApp,
    this.features = const [],
  });

  Future<void> bootstrap() async {
    final environment = _parseEnvironment();
    usePathUrlStrategy();
    WidgetsFlutterBinding.ensureInitialized();

    // 1. Load environment configuration
    final env = await const EnvConfigLoader().load(
      flavourEnvFile: environment.envFile,
    );

    // 2. Initialize Firebase
    await FirebaseBootstrapper(
      envOptions: this.firebaseEnvOptions,
    ).bootstrapIfNeeded(env);

    // 3. Resolve SaaS tenant
    const uiBootstrapper = UIBootstrapper();
    final saasTenantBootstrapper = SaasTenantBootstrapper(
      onLoadingTextUpdate: uiBootstrapper.updateLoadingText,
      onTenantInfoUpdate: uiBootstrapper.updateTenantInfo,
      onLoadingError: uiBootstrapper.showError,
      priority: _parseSaasTenantResolutionPriority(env),
    );
    final resolvedSaasTenant = await saasTenantBootstrapper.resolveTenant(env);

    // 4. Create dependency container (app-specific)
    final dependencyContainer = createDependencyContainer(
      env,
      resolvedSaasTenant,
    );

    // 5. Create bootstrap context
    final bootstrapContext = BootstrapContext<TDependencyContainer>(
      env: env,
      saasTenantBranding: resolvedSaasTenant,
      dependencyContainer: dependencyContainer,
      environment: environment,
    );

    // 6. Create app context (app-specific)
    final appContext = createAppContext(bootstrapContext);

    // 7. Register all features
    final featureRegistry = FeatureRegistry<TAppContext>();
    for (final feature in features) {
      featureRegistry.add(feature);
    }
    featureRegistry.registerAll(appContext);

    // 8. Build the app widget
    Widget app = buildApp(bootstrapContext, appContext);

    // 9. Wrap in environment banner if needed
    final bannerName = environment.bannerName;
    final bannerColor = environment.bannerColor;
    final wrappedApp = (bannerName != null && bannerColor != null)
        ? wrapInBanner(child: app, color: bannerColor, name: bannerName)
        : app;

    // 10. Run the app
    await appRunner(wrappedApp);
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
}
