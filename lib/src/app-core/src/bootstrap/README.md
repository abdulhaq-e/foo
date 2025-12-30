# Feature Registration Pattern

A declarative pattern for organizing and bootstrapping application features in Flutter, inspired by modular architecture patterns from Vue/Nuxt applications.

## Overview

The Feature Registration pattern helps reduce coupling and improve maintainability by allowing features to encapsulate their own setup logic instead of requiring the main app to know about every feature's dependencies.

## Core Concepts

### 1. `FeatureRegistration<TContext>`

An abstract class that features implement to define their registration logic.

```dart
abstract class FeatureRegistration<TContext> {
  String get name;
  void register(TContext context);
}
```

### 2. `FeatureRegistry<TContext>`

A registry that manages features and calls their `register` methods during app bootstrap.

```dart
final registry = FeatureRegistry<MyAppContext>();
registry.add(HomeFeature());
registry.add(StudentsFeature());
registry.registerAll(context);
```

### 3. Registration Context

A context object that provides shared dependencies to features during registration. This is typically defined in your app layer (not in the shared library) since different projects have different needs.

## Generic Type Parameters

Since this library is shared across multiple projects, the feature registration system uses generic type parameters:

- **`TContext`**: The registration context type that contains dependencies needed during feature registration
- Can be combined with additional generics like `TServiceRegistry` or `TDependencyContainer` for maximum flexibility

## Usage Guide

### Step 1: Define Your Registration Context

In your app layer (e.g., `salisos/app`), define the context that features will receive:

```dart
// In your app layer
class SalisosFeatureContext {
  final DependencyContainer dependencyContainer;
  final GoRouterNavigationService navigationService;
  final RootFlowCoordinator rootFlowCoordinator;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  SalisosFeatureContext({
    required this.dependencyContainer,
    required this.navigationService,
    required this.rootFlowCoordinator,
    required this.scaffoldMessengerKey,
  });
}
```

### Step 2: Create Feature Registrations

Create a registration class for each major feature:

```dart
// In students/feature_registration.dart
class StudentsFeature implements FeatureRegistration<SalisosFeatureContext> {
  @override
  String get name => 'students';

  @override
  void register(SalisosFeatureContext context) {
    final scenesBuilder = StudentsScenesBuilder(
      container: context.dependencyContainer.students,
      scaffoldMessengerKey: context.scaffoldMessengerKey,
    );

    final flowCoordinator = StudentsFlowCoordinator(
      navigationService: context.navigationService,
      scenesBuilder: scenesBuilder,
    );

    context.rootFlowCoordinator.appendSubscenes(flowCoordinator.scenes);
  }
}
```

### Step 3: Create a Feature Registry

In your app bootstrapper or main app class:

```dart
class SalisosApp extends StatefulWidget {
  final DependencyContainer dependencyContainer;
  final SessionInteractor sessionInteractor;
  final SaasTenantBranding saasTenantBranding;

  // Instead of individual scene builder parameters,
  // you can optionally pass a pre-configured registry
  final FeatureRegistry<SalisosFeatureContext>? featureRegistry;

  SalisosApp({
    required this.dependencyContainer,
    required this.sessionInteractor,
    required this.saasTenantBranding,
    this.featureRegistry,
  });
}

class _SalisosAppState extends State<SalisosApp> {
  late FeatureRegistry<SalisosFeatureContext> _featureRegistry;

  @override
  void initState() {
    super.initState();

    // Use provided registry or create default one
    _featureRegistry = widget.featureRegistry ?? _createDefaultRegistry();

    // ... other init code
  }

  FeatureRegistry<SalisosFeatureContext> _createDefaultRegistry() {
    final registry = FeatureRegistry<SalisosFeatureContext>();
    registry.add(HomeFeature());
    registry.add(StudentsFeature());
    registry.add(GroupsFeature());
    registry.add(FinanceFeature());
    // ... etc
    return registry;
  }

  void _setupRouter() {
    final rootFlowCoordinator = _createRootFlowCoordinator();

    // Create registration context
    final context = SalisosFeatureContext(
      dependencyContainer: widget.dependencyContainer,
      navigationService: _goRouterNavigationService,
      rootFlowCoordinator: rootFlowCoordinator,
      scaffoldMessengerKey: widget.dependencyContainer.root.scaffoldMessengerKey,
    );

    // Register all features at once!
    // This replaces all the individual _setupXFlow() calls
    _featureRegistry.registerAll(context);

    // Complete router initialization
    _goRouterNavigationService.initRouter(...);
  }
}
```

## Migration from Manual Registration

### Before (Manual Registration in Salisos):

```dart
// In SalisosApp constructor - 8+ scene builder parameters
SalisosApp({
  required this.courseOfferingsScenesBuilder,
  required this.financeScenesBuilder,
  required this.gradebooksScenesBuilder,
  required this.groupsScenesBuilder,
  required this.homeScenesBuilder,
  required this.reportsScenesBuilder,
  required this.rootScenesBuilder,
  required this.studentsScenesBuilder,
});

// In _setupRouter() - 9+ manual setup calls
void _setupRouter() {
  _setupHomeFlow(rootFlowCoordinator);
  _setupFinanceFlow(rootFlowCoordinator);
  _setupStudentsFlow(rootFlowCoordinator);
  _setupEmployeesFlow(rootFlowCoordinator);
  _setupGroupsFlow(rootFlowCoordinator);
  _setupGradingV2Flow(rootFlowCoordinator);
  _setupGradebooksFlow(rootFlowCoordinator);
  _setupCourseOfferingsFlow(rootFlowCoordinator);
  _setupReportsFlow(rootFlowCoordinator);
}

// In app_builder.dart - manual instantiation of each builder
final courseOfferingsScenesBuilder = CourseOfferingsScenesBuilder(...);
final financeScenesBuilder = FinanceScenesBuilder(...);
// ... 8+ more
```

### After (Feature Registration):

```dart
// In SalisosApp constructor - no scene builder parameters needed
SalisosApp({
  required this.dependencyContainer,
  required this.sessionInteractor,
  required this.saasTenantBranding,
});

// In _setupRouter() - single call
void _setupRouter() {
  final registry = FeatureRegistry<SalisosFeatureContext>();
  registry.add(HomeFeature());
  registry.add(FinanceFeature());
  registry.add(StudentsFeature());
  registry.add(GroupsFeature());
  // ... etc

  final context = SalisosFeatureContext(...);
  registry.registerAll(context);
}

// Scene builders are created inside each feature registration
```

## Benefits

1. **Reduced Coupling**: Main app doesn't need to know about every feature's scene builders
2. **Easier Feature Management**: Add/remove features by just adding/removing from registry
3. **Better Encapsulation**: Each feature owns its complete setup logic
4. **Improved Testability**: Test features in isolation, create test registries with subsets
5. **Conditional Features**: Easy to register features based on config or feature flags:
   ```dart
   if (config.enableBetaFeatures) {
     registry.add(BetaFeature());
   }
   ```
6. **No Breaking Changes**: Adding a new feature doesn't require changing SalisosApp constructor signature

## Comparison with TypeScript/Vue Pattern

This Flutter implementation mirrors the TypeScript pattern you showed:

### TypeScript:
```typescript
// FeatureRegistration.ts
export interface FeatureRegistration {
  readonly name: string;
  register(context: FeatureRegistrationContext): void;
}

// AppBootstrapper.ts
this.featureRegistry.add(learningSessionsFeature);
this.featureRegistry.add(subscriptionsFeature);
// ...
this.featureRegistry.registerAll({
  registry: this.registry,
  config,
  baseApiClient,
  authenticatedClient,
  navigationService,
});
```

### Flutter:
```dart
// feature_registration.dart
abstract class FeatureRegistration<TContext> {
  String get name;
  void register(TContext context);
}

// app setup
_featureRegistry.add(StudentsFeature());
_featureRegistry.add(GroupsFeature());
// ...
_featureRegistry.registerAll(SalisosFeatureContext(
  dependencyContainer: dependencyContainer,
  navigationService: navigationService,
  rootFlowCoordinator: rootFlowCoordinator,
));
```

## Examples

See the example files in this directory:
- `example_feature_registration.dart` - Basic usage
- `example_scene_feature_registration.dart` - Scene/route registration pattern for Flutter apps
