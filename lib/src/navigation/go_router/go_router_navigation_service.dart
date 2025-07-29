import 'package:foo/src/navigation/flow_coordinator.dart';
import 'package:foo/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterNavigationService
    implements
        NavigationService,
        NavigationServiceRoutesAdapter<List<RouteBase>> {
  final Map<String, List<Scene>> _flowScenes = {};
  late final GoRouter _router;
  late BuildContext context;

  GoRouterNavigationService();

  @override
  GoRouter get router => _router;

  @override
  Future<void> closeModal() async {
    router.pop();
  }

  @override
  List<RouteBase> generateRoutes(List<Scene> scenes) {
    return _convertScenesToRoutes(scenes);
  }

  void initRouter({
    required String initialLocation,
    GoRouterRedirect? redirect,
    GlobalKey<NavigatorState>? navigatorKey,
    Listenable? refreshListenable,
    bool debugLogDiagnostics = false,
  }) {
    final routes = _buildAllRoutes();

    _router = GoRouter(
      initialLocation: initialLocation,
      debugLogDiagnostics: debugLogDiagnostics,
      refreshListenable: refreshListenable,
      routes: routes,
      redirect: redirect,
      navigatorKey: navigatorKey,
    );
  }

  @override
  Future<void> navigate(NavigationCommand command) async {
    if (command.path != null) {
      var path = command.path!;
      command.pathParameters.forEach((key, value) {
        path = path.replaceFirst(':$key', value.toString());
      });
      router.go(
          Uri(path: path, queryParameters: command.queryParameters).toString());
    } else if (command.sceneName != null) {
      var namedRoute = command.sceneName!;
      router.goNamed(namedRoute,
          queryParameters: command.queryParameters,
          pathParameters: command.pathParameters);
    }
  }

  @override
  Future<void> presentModal(Widget scene) async {
    router.push('/dialog', extra: scene);
  }

  void registerFlow({
    required String name,
    required List<Scene> scenes,
  }) {
    _flowScenes[name] = scenes;
  }

  List<RouteBase> _buildAllRoutes() {
    final routes = <RouteBase>[];

    for (final flowScenes in _flowScenes.values) {
      routes.addAll(generateRoutes(flowScenes));
    }

    routes.add(_dialogRoute());
    return routes;
  }

  List<RouteBase> _convertScenesToRoutes(
    List<Scene> scenes,
  ) {
    return scenes.map(_convertSceneToGoRoute).toList();
  }

  RouteBase _convertSceneToGoRoute(Scene scene) {
    return switch (scene) {
      SimpleScene() => GoRoute(
          parentNavigatorKey: scene.parentNavigatorKey,
          path: scene.path,
          name: scene.name,
          builder: scene.builder != null
              ? (context, state) => scene.builder!(
                    context,
                    _navigationStateFromGoRouterState(state),
                  )
              : null,
          pageBuilder: scene.pageBuilder != null
              ? (context, state) => scene.pageBuilder!(
                    context,
                    _navigationStateFromGoRouterState(state),
                  )
              : null,
          redirect: scene.redirect == null
              ? null
              : (context, state) async {
                  return scene.redirect!(
                    context,
                    _navigationStateFromGoRouterState(state),
                  );
                },
          routes: scene.children.isEmpty
              ? []
              : [
                  ..._convertScenesToRoutes(
                    scene.children,
                  ),
                ],
        ),
      ShellScene() => ShellRoute(
          navigatorKey: scene.navigatorKey,
          parentNavigatorKey: scene.parentNavigatorKey,
          routes: _convertScenesToRoutes(scene.children),
          redirect: scene.redirect == null
              ? null
              : (context, state) async {
                  return scene.redirect!(
                    context,
                    _navigationStateFromGoRouterState(state),
                  );
                },
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return scene.shellBuilder(
                context,
                NavigationState(
                  uri: state.uri,
                  path: state.path,
                  pathParameters: state.pathParameters,
                  extra: state.extra != null
                      ? state.extra as Map<String, Object>
                      : {},
                ),
                child);
          })
    };
  }

  GoRoute _dialogRoute() {
    return GoRoute(
      path: "/dialog",
      pageBuilder: (BuildContext context, GoRouterState state) {
        late Widget dialog;
        if (state.extra != null && state.extra is Widget) {
          dialog = state.extra as Widget;
        } else {
          dialog = Container();
        }
        return DialogPage(builder: (_) => dialog);
      },
    );
  }
}

NavigationState _navigationStateFromGoRouterState(GoRouterState state) {
  return NavigationState(
    path: state.path,
    uri: state.uri,
    pathParameters: state.pathParameters,
    extra: state.extra != null ? state.extra! as Map<String, Object> : {},
  );
}
