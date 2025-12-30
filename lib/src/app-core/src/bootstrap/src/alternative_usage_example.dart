/// ALTERNATIVE USAGE: Navigation service created in app widget
///
/// This approach is closer to the current SalisOS pattern where the
/// navigation service is created in the app widget's initState.
/// Features are registered after the widget is created but before router init.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_bootstrapper.dart';
import 'feature_registration.dart';
import 'feature_registry.dart';

// ============================================================================
// APPROACH 2: Deferred feature registration in app widget
// ============================================================================

/// App context that will be populated in the app widget
class DeferredAppContext<TDependencyContainer> {
  final TDependencyContainer dependencyContainer;
  final dynamic saasTenantBranding;
  late final dynamic navigationService;
  late final dynamic rootFlowCoordinator;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  DeferredAppContext({
    required this.dependencyContainer,
    required this.saasTenantBranding,
    required this.scaffoldMessengerKey,
  });
}

/// Main.dart with deferred registration
void alternativeMain() async {
  // Create the app context container (without navigation service yet)
  late DeferredAppContext<MyDependencyContainer> appContext;

  // Create feature registry
  final featureRegistry =
      FeatureRegistry<DeferredAppContext<MyDependencyContainer>>();

  // Add all features
  featureRegistry.add(HomeFeatureRegistration<MyDependencyContainer>());
  featureRegistry.add(StudentsFeatureRegistration<MyDependencyContainer>());
  // ... add more features

  final bootstrapper =
      AppBootstrapper<
        DeferredAppContext<MyDependencyContainer>,
        MyDependencyContainer
      >(
        firebaseEnvOptions: {
          'dev': myDevFirebaseOptions,
          'prod': myProdFirebaseOptions,
        },
        appRunner: (app) => runApp(app),

        createServiceRegistry: (env, saasTenant) {
          return MyDependencyContainer(env: env, saasTenant: saasTenant);
        },

        // Create app context WITHOUT navigation service
        createAppContext: (bootstrapContext) {
          appContext = DeferredAppContext<MyDependencyContainer>(
            dependencyContainer: bootstrapContext.dependencyContainer,
            saasTenantBranding: bootstrapContext.saasTenantBranding,
            scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
          );
          return appContext;
        },

        // Build app widget and pass feature registry
        buildApp: (bootstrapContext, appContext) {
          return MyAppWithDeferredRegistration(
            dependencyContainer: bootstrapContext.dependencyContainer,
            saasTenantBranding: bootstrapContext.saasTenantBranding,
            appContext: appContext,
            featureRegistry: featureRegistry,
          );
        },

        // No features registered here - done in app widget
        features: [],
      );

  await bootstrapper.bootstrap();
}

/// App widget that registers features in initState
class MyAppWithDeferredRegistration extends StatefulWidget {
  final dynamic dependencyContainer;
  final dynamic saasTenantBranding;
  final DeferredAppContext appContext;
  final FeatureRegistry<DeferredAppContext> featureRegistry;

  const MyAppWithDeferredRegistration({
    required this.dependencyContainer,
    required this.saasTenantBranding,
    required this.appContext,
    required this.featureRegistry,
    super.key,
  });

  @override
  State<MyAppWithDeferredRegistration> createState() =>
      _MyAppWithDeferredRegistrationState();
}

class _MyAppWithDeferredRegistrationState
    extends State<MyAppWithDeferredRegistration> {
  late dynamic _navigationService;

  @override
  void initState() {
    super.initState();

    // 1. Create navigation service (just like current SalisosApp)
    _navigationService = MyNavigationService();

    // 2. Set it in the app context
    widget.appContext.navigationService = _navigationService;

    // 3. Create root flow coordinator
    final rootFlowCoordinator = RootFlowCoordinator(
      navigationService: _navigationService,
      shellNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shell'),
      scenesBuilder: RootScenesBuilder(
        container: widget.dependencyContainer.root,
        saasTenantBranding: widget.saasTenantBranding,
      ),
      saasTenant: widget.saasTenantBranding,
    );
    widget.appContext.rootFlowCoordinator = rootFlowCoordinator;

    // 4. Register welcome flow manually (or make it a feature too)
    final welcomeFlowCoordinator = _setupWelcomeFlow();
    _navigationService.registerFlow(
      name: "welcome",
      scenes: welcomeFlowCoordinator.scenes,
    );
    _navigationService.registerFlow(
      name: "root",
      scenes: rootFlowCoordinator.scenes,
    );

    // 5. NOW register all features - this replaces all the _setupXFlow() calls!
    widget.featureRegistry.registerAll(widget.appContext);

    // 6. Initialize router (after all flows registered)
    _navigationService.initRouter(
      initialLocation: '/welcome',
      // ... other router config
    );
  }

  dynamic _setupWelcomeFlow() {
    // Setup welcome flow...
    return WelcomeFlowCoordinator(
      navigationService: _navigationService,
      container: widget.dependencyContainer.welcome,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My App',
      scaffoldMessengerKey: widget.appContext.scaffoldMessengerKey,
      routerConfig: _navigationService.router,
    );
  }
}

// ============================================================================
// Feature registrations (same as before)
// ============================================================================

class HomeFeatureRegistration<TDependencyContainer>
    implements FeatureRegistration<DeferredAppContext<TDependencyContainer>> {
  @override
  String get name => 'home';

  @override
  void register(DeferredAppContext<TDependencyContainer> context) {
    final scenesBuilder = HomeScenesBuilder();
    final flowCoordinator = HomeFlowCoordinator(
      navigationService: context.navigationService,
      scenesBuilder: scenesBuilder,
    );
    context.rootFlowCoordinator.appendSubscenes(flowCoordinator.scenes);
  }
}

class StudentsFeatureRegistration<TDependencyContainer>
    implements FeatureRegistration<DeferredAppContext<TDependencyContainer>> {
  @override
  String get name => 'students';

  @override
  void register(DeferredAppContext<TDependencyContainer> context) {
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

// ============================================================================
// Key differences between the two approaches:
// ============================================================================

/// APPROACH 1 (usage_example.dart):
/// - Navigation service created in createAppContext callback
/// - Features registered during bootstrap (before app widget created)
/// - App widget just calls initRouter in initState
/// - Pros: Features fully registered before app runs
/// - Cons: Less flexible if you need widget context for navigation setup
///
/// APPROACH 2 (this file):
/// - Navigation service created in app widget's initState
/// - Features registered in initState (after navigation service exists)
/// - Closer to current SalisOS pattern
/// - Pros: More flexible, follows familiar pattern
/// - Cons: Features registered later in lifecycle
///
/// RECOMMENDATION: Use Approach 1 unless you have specific reasons to create
/// the navigation service in the widget (e.g., need widget context, need to
/// access inherited widgets, etc.)

// ============================================================================
// Placeholder types
// ============================================================================

class MyDependencyContainer {
  final DotEnv env;
  final dynamic saasTenant;
  final dynamic students;
  final dynamic root;
  final dynamic welcome;

  MyDependencyContainer({required this.env, required this.saasTenant});
}

final myDevFirebaseOptions = null;
final myProdFirebaseOptions = null;

class MyNavigationService {
  void registerFlow({required String name, required dynamic scenes}) {}
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
  List<dynamic> get scenes => [];
}

class WelcomeFlowCoordinator {
  WelcomeFlowCoordinator({required navigationService, required container});
  List<dynamic> get scenes => [];
}
