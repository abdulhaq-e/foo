import 'dart:async';

import 'package:material_ui/material_ui.dart';
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
        home: Scaffold(body: scene),
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
    int? delay,
    Exception? error,
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
      delay: delay,
      error: error,
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
    int? delay,
    Exception? error,
  }) {
    return CaptureHandler<Q, DataContainer<T, DefaultResponseMetadata>>(
      responseBuilder: (query) {
        final data = dataBuilder(query);
        return DataContainer(data: data, metadata: DefaultResponseMetadata());
      },
      delay: delay,
      error: error,
    );
  }

  CaptureHandler<C, void> createVoidCommandHandler<C>({
    required void Function(C command) commandHandler,
    int? delay,
    Exception? error,
  }) {
    return CaptureHandler<C, void>(
      responseBuilder: (command) {
        commandHandler(command);
      },
      delay: delay,
      error: error,
    );
  }

  /// Creates a generic capture handler with custom response building logic.
  ///
  /// Use this when you need full control over the response.
  /// The responseBuilder can be sync or async.
  CaptureHandler<Q, R> createCaptureHandler<Q, R>({
    required FutureOr<R> Function(Q query) responseBuilder,
    int? delay,
    Exception? error,
  }) {
    return CaptureHandler<Q, R>(
      responseBuilder: responseBuilder,
      delay: delay,
      error: error,
    );
  }
}

/// A handler that captures queries and returns responses.
///
/// This is useful for verifying that scenes dispatch the correct queries.
class CaptureHandler<M, R> {
  final List<M> capturedMessages = [];
  int numberOfQueryCalls = 0;
  final FutureOr<R> Function(M message) responseBuilder;
  int? delay;
  Exception? error;

  CaptureHandler({required this.responseBuilder, this.delay, this.error});

  /// The handler function to pass to composers.
  Future<R> Function(M) get handler => _handle;

  Future<R> _handle(M message) async {
    capturedMessages.add(message);
    this.numberOfQueryCalls += 1;
    if (delay != null) {
      await Future<void>.delayed(Duration(seconds: delay!));
    }
    if (error != null) {
      throw error!;
    }
    return await responseBuilder(message);
  }

  /// Clears all captured queries.
  void clear() {
    capturedMessages.clear();
  }
}
