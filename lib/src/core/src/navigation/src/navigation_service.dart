import 'dart:async';

import 'package:flutter/material.dart';

class NavigationState {
  final String? path;
  final String? name;
  final Map<String, String> pathParameters;
  final Map<String, Object> extra;
  final Uri uri;

  NavigationState({
    required this.path,
    required this.pathParameters,
    required this.uri,
    this.name,
    this.extra = const {},
  });
}

class NavigationCommand {
  final String? path;
  final String? sceneName;
  final Map<String, String> pathParameters;
  final Map<String, dynamic> queryParameters;
  final Map<String, Object> extra;

  NavigationCommand({
    this.path,
    this.sceneName,
    this.pathParameters = const <String, String>{},
    this.queryParameters = const <String, dynamic>{},
    this.extra = const {},
  }) : assert(
         path != null || sceneName != null,
         'path or sceneName must be provided',
       );
}

abstract class NavigationService {
  Future<void> navigate(NavigationCommand command);
  Future<void> presentModal(Widget scene);
  Future<void> closeModal();
  RouterConfig<Object> get router;
}

abstract class NavigationServiceRoutesAdapter<T> {
  T generateRoutes(List<Scene> scenes);
}

typedef SceneRedirect =
    FutureOr<String?> Function(BuildContext context, NavigationState state);

sealed class Scene {}

class SimpleScene extends Scene {
  final GlobalKey<NavigatorState>? parentNavigatorKey;
  final String? name;
  final String path;
  final Widget Function(BuildContext, NavigationState)? builder;
  final Page<dynamic> Function(BuildContext, NavigationState)? pageBuilder;
  final SceneRedirect? redirect;
  final List<Scene> children;

  SimpleScene({
    this.parentNavigatorKey,
    this.name,
    required this.path,
    this.redirect,
    this.builder,
    this.pageBuilder,
    this.children = const [],
  }) : assert(
         pageBuilder != null || builder != null || redirect != null,
         'builder, pageBuilder, or redirect must be provided',
       );
}

class ShellScene extends Scene {
  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<NavigatorState>? parentNavigatorKey;
  final SceneRedirect? redirect;
  final Widget Function(BuildContext, NavigationState, Widget) shellBuilder;
  final List<Scene> children;

  ShellScene({
    this.navigatorKey,
    this.parentNavigatorKey,
    this.redirect,
    required this.shellBuilder,
    this.children = const [],
  });
}
