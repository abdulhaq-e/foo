import 'dart:async';

import 'package:flutter/material.dart';

import 'navigation_service.dart';

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
