/// USAGE EXAMPLE: How to use AppBootstrapper in your app
///
/// This example shows how to eliminate the mess in salisos_app.dart and app_builder.dart
/// by using the feature registration system.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_bootstrapper.dart';
import 'feature_registration.dart';

// ============================================================================
// STEP 1: Define your app-specific context
// ============================================================================

/// Your app's context for feature registration
/// This contains everything features need to register themselves
class MyAppContext<TDependencyContainer> {
  final TDependencyContainer dependencyContainer;
  final dynamic navigationService;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final dynamic rootFlowCoordinator;

  MyAppContext({
    required this.dependencyContainer,
    required this.navigationService,
    required this.scaffoldMessengerKey,
    required this.rootFlowCoordinator,
  });
}

// ============================================================================
// STEP 2: Create feature registrations for each module
// ============================================================================

/// Example: Home feature registration
class HomeFeatureRegistration<TDependencyContainer>
    implements FeatureRegistration<MyAppContext<TDependencyContainer>> {
  @override
  String get name => 'home';

  @override
  void register(MyAppContext<TDependencyContainer> context) {
    // This replaces _setupHomeFlow() in SalisosApp
    final scenesBuilder = HomeScenesBuilder();
    final flowCoordinator = HomeFlowCoordinator(
      navigationService: context.navigationService,
      scenesBuilder: scenesBuilder,
    );
    context.rootFlowCoordinator.appendSubscenes(flowCoordinator.scenes);
  }
}

/// Example: Students feature registration
class StudentsFeatureRegistration<TDependencyContainer>
    implements FeatureRegistration<MyAppContext<TDependencyContainer>> {
  @override
  String get name => 'students';

  @override
  void register(MyAppContext<TDependencyContainer> context) {
    // This replaces _setupStudentsFlow() in SalisosApp
    final container = context.dependencyContainer.students;
    final scenesBuilder = StudentsScenesBuilder(
      container: container,
      scaffoldMessengerKey: context.scaffoldMessengerKey,
    );
    final flowCoordinator = StudentsFlowCoordinator(
      navigationService: context.navigationService,
      scenesBuilder: scenesBuilder,
    );
    context.rootFlowCoordinator.appendSubscenes(flowCoordinator.scenes);
  }
}

// ... Create similar feature registrations for Finance, Groups, etc.

// ============================================================================
// STEP 3: Use AppBootstrapper in your main.dart
// ============================================================================

/// Example main.dart showing how to use the bootstrapper
void exampleMain() async {
  final bootstrapper = AppBootstrapper<
      MyAppContext<MyDependencyContainer>,
      MyDependencyContainer>(
    firebaseEnvOptions: {
      'dev': myDevFirebaseOptions,
      'prod': myProdFirebaseOptions,
    },
    appRunner: (app) => runApp(app),

    // Create dependency container
    createDependencyContainer: (env, saasTenant) {
      return MyDependencyContainer(env: env, saasTenant: saasTenant);
    },

    // Create app context
    createAppContext: (bootstrapContext) {
      // Here you can create navigation service, root flow coordinator, etc.
      final navigationService = MyNavigationService();
      final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

      // Create root flow coordinator (if you create it here)
      // Or you might create it in buildApp and pass it differently
      final rootFlowCoordinator = RootFlowCoordinator(
        navigationService: navigationService,
        shellNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shell'),
        scenesBuilder: RootScenesBuilder(
          container: bootstrapContext.dependencyContainer.root,
          saasTenantBranding: bootstrapContext.saasTenantBranding,
        ),
        saasTenant: bootstrapContext.saasTenantBranding,
      );

      return MyAppContext<MyDependencyContainer>(
        dependencyContainer: bootstrapContext.dependencyContainer,
        navigationService: navigationService,
        scaffoldMessengerKey: scaffoldMessengerKey,
        rootFlowCoordinator: rootFlowCoordinator,
      );
    },

    // Build the app widget
    buildApp: (bootstrapContext, appContext) {
      return MyApp(
        dependencyContainer: bootstrapContext.dependencyContainer,
        saasTenantBranding: bootstrapContext.saasTenantBranding,
        navigationService: appContext.navigationService,
        scaffoldMessengerKey: appContext.scaffoldMessengerKey,
      );
    },

    // Register all features
    features: [
      HomeFeatureRegistration<MyDependencyContainer>(),
      StudentsFeatureRegistration<MyDependencyContainer>(),
      // FinanceFeatureRegistration<MyDependencyContainer>(),
      // GroupsFeatureRegistration<MyDependencyContainer>(),
      // ... etc
    ],
  );

  await bootstrapper.bootstrap();
}

// ============================================================================
// STEP 4: Simplified App Widget (compare to SalisosApp)
// ============================================================================

/// Your simplified app widget
///
/// BEFORE: Had to accept 8+ scene builders as constructor parameters
/// AFTER: Only needs core dependencies, features register themselves
class MyApp extends StatefulWidget {
  final dynamic dependencyContainer;
  final dynamic saasTenantBranding;
  final dynamic navigationService;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  const MyApp({
    required this.dependencyContainer,
    required this.saasTenantBranding,
    required this.navigationService,
    required this.scaffoldMessengerKey,
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Features are already registered!
    // No need for _setupHomeFlow(), _setupStudentsFlow(), etc.
    // Just initialize the router
    widget.navigationService.initRouter(
      initialLocation: '/welcome',
      // ... other router config
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My App',
      scaffoldMessengerKey: widget.scaffoldMessengerKey,
      routerConfig: widget.navigationService.router,
    );
  }
}

// ============================================================================
// COMPARISON: What you eliminated
// ============================================================================

/// BEFORE (in app_builder.dart):
/// - Had to manually create ALL scene builders:
///   - courseOfferingsScenesBuilder
///   - financeScenesBuilder
///   - gradebooksScenesBuilder
///   - groupsScenesBuilder
///   - homeScenesBuilder
///   - reportsScenesBuilder
///   - studentsScenesBuilder
///   - rootScenesBuilder
/// - Pass all 8+ builders to SalisosApp constructor
///
/// BEFORE (in SalisosApp):
/// - Accept all 8+ scene builders in constructor
/// - Define 8+ separate _setupXFlow() methods
/// - Manually call each _setupXFlow() in _setupRouter()
///
/// AFTER:
/// - Features register themselves
/// - App widget only needs core dependencies
/// - Adding/removing features is just adding/removing from features list
/// - No need to modify app widget when adding new features

// ============================================================================
// Placeholder types (replace with your actual types)
// ============================================================================

class MyDependencyContainer {
  final DotEnv env;
  final dynamic saasTenant;
  final dynamic students;
  final dynamic root;

  MyDependencyContainer({required this.env, required this.saasTenant});
}

final myDevFirebaseOptions = null;
final myProdFirebaseOptions = null;

class MyNavigationService {
  void initRouter({required String initialLocation}) {}
  dynamic get router => null;
}

class HomeScenesBuilder {}
class StudentsScenesBuilder {
  StudentsScenesBuilder({required container, required scaffoldMessengerKey});
}
class RootScenesBuilder {
  RootScenesBuilder({required container, required saasTenantBranding});
}
class HomeFlowCoordinator {
  HomeFlowCoordinator({required navigationService, required scenesBuilder});
  List<dynamic> get scenes => [];
}
class StudentsFlowCoordinator {
  StudentsFlowCoordinator({required navigationService, required scenesBuilder});
  List<dynamic> get scenes => [];
}
class RootFlowCoordinator {
  RootFlowCoordinator({
    required navigationService,
    required shellNavigatorKey,
    required scenesBuilder,
    required saasTenant,
  });
  void appendSubscenes(List<dynamic> scenes) {}
}
