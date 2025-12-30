import 'feature_registration.dart';

// Example: Define your app-specific registration context
// This would typically live in your app layer, not in the shared library

/// Example registration context showing what dependencies
/// features might need during registration
///
/// In a real app, you would define this with your actual dependencies
class ExampleAppContext<TServiceRegistry> {
  /// Service registry for dependency injection
  /// (e.g., GetIt, Provider, or your custom DI container)
  final TServiceRegistry serviceRegistry;

  /// Navigation service for registering routes/scenes
  final dynamic navigationService;

  /// App configuration
  final dynamic config;

  /// Any other shared dependencies your features need
  final dynamic sharedDependencies;

  ExampleAppContext({
    required this.serviceRegistry,
    required this.navigationService,
    this.config,
    this.sharedDependencies,
  });
}

// Example: Implementing a feature

/// Example feature showing how to implement FeatureRegistration
///
/// In a real app, each major feature/module would have its own
/// implementation of FeatureRegistration
class ExampleHomeFeature<TServiceRegistry>
    implements FeatureRegistration<ExampleAppContext<TServiceRegistry>> {
  @override
  String get name => 'home';

  @override
  void register(ExampleAppContext<TServiceRegistry> context) {
    // Register services with your service registry
    // context.serviceRegistry.register('homeService', HomeService());

    // Register routes/scenes with navigation service
    // context.navigationService.registerRoute('/home', HomeScene());

    // Any other feature-specific setup
    print('HomeFeature registered');
  }
}

/// Example of how to use the feature registry in your app bootstrapper
class ExampleAppBootstrapper<TServiceRegistry> {
  final FeatureRegistry<ExampleAppContext<TServiceRegistry>> _featureRegistry =
      FeatureRegistry();

  ExampleAppBootstrapper() {
    // Register all your features
    _featureRegistry.add(ExampleHomeFeature<TServiceRegistry>());
    // _featureRegistry.add(ProfileFeature());
    // _featureRegistry.add(SettingsFeature());
  }

  Future<void> bootstrap({
    required TServiceRegistry serviceRegistry,
    required dynamic navigationService,
    dynamic config,
  }) async {
    // Create your registration context with all the dependencies
    // your features need
    final context = ExampleAppContext<TServiceRegistry>(
      serviceRegistry: serviceRegistry,
      navigationService: navigationService,
      config: config,
    );

    // Register all features at once
    _featureRegistry.registerAll(context);
  }
}
