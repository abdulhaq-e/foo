import 'dart:async';

import 'package:flutter/material.dart';

class NavigationState {
  final String? path;
  final Map<String, String> pathParameters;
  final Map<String, Object> extra;

  NavigationState(
      {required this.path,
      required this.pathParameters,
      this.extra = const {}});
}

class NavigationCommand {
  final String path;
  final Map<String, dynamic>? queryParameters;
  final Map<String, Object> extra;

  NavigationCommand({
    required this.path,
    this.queryParameters,
    this.extra = const {},
  });
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

typedef SceneRedirect = FutureOr<String?> Function(
    BuildContext context, NavigationState state);

sealed class Scene {}

class SimpleScene extends Scene {
  final GlobalKey<NavigatorState>? parentNavigatorKey;
  final String? path;
  final Widget Function(BuildContext, NavigationState) builder;
  final SceneRedirect? redirect;
  final List<Scene> children;

  SimpleScene({
    this.parentNavigatorKey,
    this.path,
    this.redirect,
    required this.builder,
    this.children = const [],
  });
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

abstract class BaseFlowCoordinator {
  FutureOr<void> start();

  final NavigationService _navigationService;

  BaseFlowCoordinator({required NavigationService navigationService})
      : _navigationService = navigationService;

  Future<void> navigate(NavigationCommand command) {
    return _navigationService.navigate(command);
  }

  Future<void> presentModal(Widget scene) {
    return _navigationService.presentModal(scene);
  }

  Future<void> closeModal() {
    return _navigationService.closeModal();
  }

  List<Scene> get scenes;
}
