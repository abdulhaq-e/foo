import 'package:api_tools/api_tools.dart';
import 'package:flutter/material.dart';
import 'package:foo/navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

/// Common mock classes used across tests.
/// Import this file to get all standard mocks.

// API Mocks
class MockAPIClient extends Mock implements APIClient {}

// Navigation Mocks
class MockNavigationService extends Mock implements NavigationService {}

class MockGoRouterState extends Mock implements GoRouterState {}

// Fake classes for fallback values
class FakeNavigationCommand extends Fake implements NavigationCommand {}

class FakeEndpoint extends Fake implements Endpoint {}

/// Helper to register all common fallback values.
/// Call this in your test's setUpAll() method.
void registerCommonFallbackValues() {
  registerFallbackValue(FakeNavigationCommand());
  registerFallbackValue(FakeEndpoint());
  registerFallbackValue(Container());
}

/// Factory for creating pre-configured mock objects
class CoreMockFactory {
  /// Creates a mock API client that returns the given response
  static MockAPIClient apiClientReturning(APIResponse response) {
    final mock = MockAPIClient();
    when(() => mock.request(any())).thenAnswer((_) async => response);
    return mock;
  }

  /// Creates a mock navigation service that tracks navigate calls
  static MockNavigationService navigationService() {
    final mock = MockNavigationService();
    when(() => mock.navigate(any())).thenAnswer((_) async => ());
    return mock;
  }
}
