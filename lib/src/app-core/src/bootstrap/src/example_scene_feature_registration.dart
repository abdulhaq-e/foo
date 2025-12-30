import 'feature_registration.dart';

/// Example showing how to use FeatureRegistration for scene/route registration
/// This demonstrates a pattern similar to what Salisos uses

// 1. Define your app-specific registration context
// This would live in your app layer

/// Registration context for features that need to register scenes
class SceneRegistrationContext<TDependencyContainer> {
  /// Dependency container (e.g., your app's DI container)
  final TDependencyContainer dependencyContainer;

  /// Navigation service for registering scenes/routes
  final dynamic navigationService;

  /// Root flow coordinator that features append their scenes to
  final dynamic rootFlowCoordinator;

  /// Global key for scaffold messenger (for showing snackbars, etc.)
  final dynamic scaffoldMessengerKey;

  SceneRegistrationContext({
    required this.dependencyContainer,
    required this.navigationService,
    required this.rootFlowCoordinator,
    this.scaffoldMessengerKey,
  });
}

// 2. Create feature registrations for each module

/// Example: Home feature registration
///
/// Instead of manually creating and wiring up the flow in your app,
/// each feature encapsulates its own setup logic
class HomeFeatureRegistration<TDependencyContainer>
    implements FeatureRegistration<SceneRegistrationContext<TDependencyContainer>> {
  @override
  String get name => 'home';

  @override
  void register(SceneRegistrationContext<TDependencyContainer> context) {
    // Create the scenes builder (equivalent to what's in app_builder.dart)
    // final scenesBuilder = HomeScenesBuilder();

    // Create the flow coordinator
    // final flowCoordinator = HomeFlowCoordinator(
    //   navigationService: context.navigationService,
    //   scenesBuilder: scenesBuilder,
    // );

    // Register scenes with root coordinator
    // context.rootFlowCoordinator.appendSubscenes(flowCoordinator.scenes);

    print('Home feature registered');
  }
}

/// Example: Students feature registration
class StudentsFeatureRegistration<TDependencyContainer>
    implements FeatureRegistration<SceneRegistrationContext<TDependencyContainer>> {
  @override
  String get name => 'students';

  @override
  void register(SceneRegistrationContext<TDependencyContainer> context) {
    // Access feature-specific dependencies from container
    // final container = context.dependencyContainer.students;

    // Create scenes builder
    // final scenesBuilder = StudentsScenesBuilder(
    //   container: container,
    //   scaffoldMessengerKey: context.scaffoldMessengerKey,
    // );

    // Create and register flow coordinator
    // final flowCoordinator = StudentsFlowCoordinator(
    //   navigationService: context.navigationService,
    //   scenesBuilder: scenesBuilder,
    // );
    // context.rootFlowCoordinator.appendSubscenes(flowCoordinator.scenes);

    print('Students feature registered');
  }
}

// 3. Use in your app setup

/// Example showing how the feature registry simplifies app setup
///
/// Compare this to the manual setup in salisos_app.dart:
/// - No need for individual scene builder constructor parameters
/// - No need for individual _setupXFlow methods
/// - Features are self-contained and can be added/removed easily
class ExampleAppSetup<TDependencyContainer> {
  final FeatureRegistry<SceneRegistrationContext<TDependencyContainer>> _featureRegistry =
      FeatureRegistry();

  ExampleAppSetup() {
    // Simply add all your features
    // This replaces the long list of constructor parameters in SalisosApp
    _featureRegistry.add(HomeFeatureRegistration<TDependencyContainer>());
    _featureRegistry.add(StudentsFeatureRegistration<TDependencyContainer>());
    // _featureRegistry.add(GroupsFeatureRegistration());
    // _featureRegistry.add(FinanceFeatureRegistration());
    // ... etc
  }

  void setupFeatures({
    required TDependencyContainer dependencyContainer,
    required dynamic navigationService,
    required dynamic rootFlowCoordinator,
    dynamic scaffoldMessengerKey,
  }) {
    // Create the context once
    final context = SceneRegistrationContext<TDependencyContainer>(
      dependencyContainer: dependencyContainer,
      navigationService: navigationService,
      rootFlowCoordinator: rootFlowCoordinator,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );

    // Register all features at once
    // This replaces all the individual _setupXFlow() calls
    _featureRegistry.registerAll(context);
  }
}

/// Benefits of this approach:
///
/// 1. **Reduced coupling**: SalisosApp no longer needs to know about every
///    feature's scene builder as constructor parameters
///
/// 2. **Easier to add/remove features**: Just add/remove from the registry,
///    no need to modify SalisosApp constructor and all call sites
///
/// 3. **Feature encapsulation**: Each feature owns its setup logic,
///    making it easier to understand and maintain
///
/// 4. **Testability**: Can test feature registration independently,
///    can create test registries with subset of features
///
/// 5. **Conditional features**: Easy to conditionally register features
///    based on config, feature flags, etc:
///    ```dart
///    if (config.enableStudents) {
///      registry.add(StudentsFeature());
///    }
///    ```
