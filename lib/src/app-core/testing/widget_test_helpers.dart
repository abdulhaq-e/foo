import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// Helpers for widget testing to reduce boilerplate
class WidgetTestHelpers {
  /// Pumps a widget wrapped in MaterialApp for testing
  static Future<void> pumpWidgetWithMaterialApp(
    WidgetTester tester,
    Widget widget, {
    ThemeData? theme,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: widget),
        theme: theme,
      ),
    );
  }

  /// Pumps a widget with MaterialApp and waits for animations to settle
  static Future<void> pumpWidgetAndSettle(
    WidgetTester tester,
    Widget widget, {
    ThemeData? theme,
  }) async {
    await pumpWidgetWithMaterialApp(tester, widget, theme: theme);
    await tester.pumpAndSettle();
  }

  /// Gets the GoRouter instance from the current context
  static GoRouter getRouter(WidgetTester tester) {
    final context = tester.element(find.byType(MaterialApp));
    return GoRouter.of(context);
  }

  /// Navigates to a route and waits for animations
  static Future<void> navigateTo(WidgetTester tester, String path) async {
    final router = getRouter(tester);
    router.go(path);
    await tester.pumpAndSettle();
  }

  /// Gets the current route location
  static String getCurrentLocation(WidgetTester tester) {
    final router = getRouter(tester);
    return router.routerDelegate.currentConfiguration.uri.path;
  }
}

/// Extensions on WidgetTester for convenience
extension WidgetTesterExtensions on WidgetTester {
  /// Pumps widget with MaterialApp wrapper
  Future<void> pumpMaterialWidget(Widget widget, {ThemeData? theme}) {
    return WidgetTestHelpers.pumpWidgetWithMaterialApp(
      this,
      widget,
      theme: theme,
    );
  }

  /// Pumps widget and settles animations
  Future<void> pumpMaterialWidgetAndSettle(Widget widget, {ThemeData? theme}) {
    return WidgetTestHelpers.pumpWidgetAndSettle(this, widget, theme: theme);
  }

  /// Gets the current router location
  String get currentLocation => WidgetTestHelpers.getCurrentLocation(this);

  /// Navigates to a path using GoRouter
  Future<void> goTo(String path) => WidgetTestHelpers.navigateTo(this, path);
}

/// Helpers for finding widgets in tests
class TestFinders {
  /// Finds a widget by its text content (case-insensitive)
  static Finder textContaining(String text) {
    return find.byWidgetPredicate(
      (widget) =>
          widget is Text &&
          widget.data != null &&
          widget.data!.toLowerCase().contains(text.toLowerCase()),
    );
  }

  /// Finds a TextField by its label text
  static Finder textFieldWithLabel(String label) {
    return find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration?.labelText?.toLowerCase() == label.toLowerCase(),
    );
  }

  /// Finds a button by its text
  static Finder buttonWithText(String text) {
    return find.ancestor(
      of: find.text(text),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is ElevatedButton ||
            widget is TextButton ||
            widget is OutlinedButton ||
            widget is IconButton,
      ),
    );
  }
}

/// Helper for creating mock navigation state
class MockNavigationStateBuilder {
  final Map<String, String> _pathParameters = {};
  final Map<String, String> _queryParameters = {};
  String _location = '/';

  MockNavigationStateBuilder withPathParameter(String key, String value) {
    _pathParameters[key] = value;
    return this;
  }

  MockNavigationStateBuilder withQueryParameter(String key, String value) {
    _queryParameters[key] = value;
    return this;
  }

  MockNavigationStateBuilder withLocation(String location) {
    _location = location;
    return this;
  }

  Map<String, String> get pathParameters => _pathParameters;
  Map<String, String> get queryParameters => _queryParameters;
  String get location => _location;
}
