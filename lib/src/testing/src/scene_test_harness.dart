import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foo/core.dart';

/// Test harness for testing scene composers (UI components).
///
/// This harness simplifies testing composers by providing utilities to:
/// - Pump scenes with minimal boilerplate (MaterialApp + Scaffold wrapper)
/// - Create mock query/command handlers that capture invocations
/// - Build domain-level responses (DataContainer, PaginatedDataContainer)
///
/// Usage:
/// ```dart
/// testWidgets('scene test', (tester) async {
///   final harness = SceneTestHarness(tester);
///
///   final handler = harness.createPaginatedHandler<ListStudentsQuery, Student>(
///     dataBuilder: (query) => [],
///   );
///
///   await harness.pumpScene(
///     MyComposer.composeScene(
///       queryHandler: handler.handler,
///     ),
///   );
///
///   // Verify queries captured
///   expect(handler.capturedQueries, hasLength(1));
/// });
/// ```
class SceneTestHarness {
  final WidgetTester tester;

  SceneTestHarness(this.tester);

  /// Pumps a scene wrapped in MaterialApp and Scaffold.
  /// This is the standard setup for composer integration tests.
  ///
  /// Each call uses a unique key to ensure a fresh widget tree is created,
  /// preventing Flutter from reusing previous providers or state.
  Future<void> pumpScene(Widget scene) async {
    await tester.pumpWidget(
      MaterialApp(
        key: UniqueKey(),
        home: Scaffold(
          body: scene,
        ),
      ),
    );
  }

  /// Creates a paginated query handler that captures queries and returns PaginatedDataContainer.
  ///
  /// Use this for list queries that return paginated results.
  ///
  /// Example:
  /// ```dart
  /// final handler = harness.createPaginatedHandler<ListStudentsQuery, Student>(
  ///   dataBuilder: (query) => query.search != null ? filteredStudents : allStudents,
  /// );
  /// ```
  CaptureHandler<Q, PaginatedDataContainer<T>> createPaginatedHandler<Q, T>({
    required List<T> Function(Q query) dataBuilder,
    String? nextCursor,
    String? previousCursor,
  }) {
    return CaptureHandler<Q, PaginatedDataContainer<T>>(
      responseBuilder: (query) {
        final data = dataBuilder(query);
        return PaginatedDataContainer(
          data: data,
          metadata: PaginatedResponseMetadata(
            pagination: CursorPaginationMetadata(
              nextCursor: nextCursor,
              previousCursor: previousCursor,
              limit: 50,
              cursorInput: null,
            ),
          ),
        );
      },
    );
  }

  /// Creates a singular query handler that captures queries and returns DataContainer.
  ///
  /// Use this for queries that return a single item.
  ///
  /// Example:
  /// ```dart
  /// final handler = harness.createSingularHandler<GetStudentDetailsQuery, StudentDetails>(
  ///   dataBuilder: (query) => TestFixtures.studentDetails(id: query.studentEntityId),
  /// );
  /// ```
  CaptureHandler<Q, DataContainer<T, DefaultResponseMetadata>>
      createSingularHandler<Q, T>({
    required T Function(Q query) dataBuilder,
  }) {
    return CaptureHandler<Q, DataContainer<T, DefaultResponseMetadata>>(
      responseBuilder: (query) {
        final data = dataBuilder(query);
        return DataContainer(
          data: data,
          metadata: DefaultResponseMetadata(),
        );
      },
    );
  }

  /// Creates a generic capture handler with custom response building logic.
  ///
  /// Use this when you need full control over the response.
  /// The responseBuilder can be sync or async.
  CaptureHandler<Q, R> createCaptureHandler<Q, R>({
    required FutureOr<R> Function(Q query) responseBuilder,
  }) {
    return CaptureHandler<Q, R>(responseBuilder: responseBuilder);
  }
}

/// A handler that captures queries and returns responses.
///
/// This is useful for verifying that scenes dispatch the correct queries.
class CaptureHandler<Q, R> {
  final List<Q> capturedQueries = [];
  final FutureOr<R> Function(Q query) responseBuilder;

  CaptureHandler({required this.responseBuilder});

  /// The handler function to pass to composers.
  Future<R> Function(Q) get handler => _handle;

  Future<R> _handle(Q query) async {
    capturedQueries.add(query);
    return await responseBuilder(query);
  }

  /// Clears all captured queries.
  void clear() {
    capturedQueries.clear();
  }
}
