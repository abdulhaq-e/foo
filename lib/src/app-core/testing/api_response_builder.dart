import 'dart:convert';
import 'package:api_tools/api_tools.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

/// Builder for creating mock API responses with proper structure.
///
/// Usage:
/// ```dart
/// final response = ApiResponseBuilder.forSingleItem(student)
///     .withStatusCode(200)
///     .build();
/// ```
class ApiResponseBuilder<T, M> {
  final T data;
  final M metadata;
  int statusCode;
  Map<String, String> headers;

  ApiResponseBuilder._({
    required this.data,
    required this.metadata,
    this.statusCode = 200,
    this.headers = const {},
  });

  /// Creates a builder for a single item response wrapped in GenericAPIResponse
  static ApiResponseBuilder<T, DefaultResponseMetadata> forSingleItem<T>(
    T data, {
    DefaultResponseMetadata? metadata,
  }) {
    return ApiResponseBuilder<T, DefaultResponseMetadata>._(
      data: data,
      metadata: metadata ?? DefaultResponseMetadata(),
    );
  }

  /// Creates a builder for a nested item response (data wrapped under a key)
  /// Use this when the handler expects data nested under a specific key like:
  /// ```json
  /// {
  ///   "data": {
  ///     "config": { /* actual data */ }
  ///   }
  /// }
  /// ```
  static ApiResponseBuilder<Map<String, dynamic>, DefaultResponseMetadata>
  forNestedItem<T>(
    T data, {
    required String nestedKey,
    DefaultResponseMetadata? metadata,
  }) {
    final wrappedData = {
      nestedKey: data is Map ? data : (data as dynamic).toJson(),
    };
    return ApiResponseBuilder<Map<String, dynamic>, DefaultResponseMetadata>._(
      data: wrappedData,
      metadata: metadata ?? DefaultResponseMetadata(),
    );
  }

  /// Creates a builder for a raw item response (no GenericAPIResponse wrapper)
  /// Use this for handlers that use createApiHandlerForSingularItem
  static _RawApiResponseBuilder<T> forRawItem<T>(T data) {
    return _RawApiResponseBuilder<T>._(data: data);
  }

  /// Creates a builder for a list response
  static ApiResponseBuilder<List<T>, DefaultResponseMetadata> forList<T>(
    List<T> items, {
    DefaultResponseMetadata? metadata,
  }) {
    return ApiResponseBuilder<List<T>, DefaultResponseMetadata>._(
      data: items,
      metadata: metadata ?? DefaultResponseMetadata(),
    );
  }

  /// Creates a builder for a paginated list response
  static ApiResponseBuilder<List<T>, PaginatedResponseMetadata>
  forPaginatedList<T>(
    List<T> items, {
    String? nextCursor,
    String? previousCursor,
  }) {
    return ApiResponseBuilder<List<T>, PaginatedResponseMetadata>._(
      data: items,
      metadata: PaginatedResponseMetadata(
        pagination: CursorPaginationMetadata(
          nextCursor: nextCursor,
          previousCursor: previousCursor,
          limit: 50,
          cursorInput: null,
        ),
      ),
    );
  }

  /// Sets a custom status code
  ApiResponseBuilder<T, M> withStatusCode(int code) {
    statusCode = code;
    return this;
  }

  /// Sets custom headers
  ApiResponseBuilder<T, M> withHeaders(Map<String, String> newHeaders) {
    headers = newHeaders;
    return this;
  }

  /// Builds the APIResponse with the configured data
  APIResponse build() {
    final genericResponse = GenericAPIResponse(data, metadata);

    // Convert to JSON based on data type
    final jsonData = data is List
        ? genericResponse.toJson(
            (e) => (e as List).map((item) => _toJson(item)).toList(),
            (m) => (m as dynamic).toJson(),
          )
        : genericResponse.toJson(
            (e) => _toJson(e),
            (m) => (m as dynamic).toJson(),
          );

    return APIResponse(
      data: utf8.encode(jsonEncode(jsonData)),
      statusCode: statusCode,
      headers: headers,
    );
  }

  /// Helper to convert items to JSON
  dynamic _toJson(dynamic item) {
    if (item is Map) return item;
    // Assume the object has a toJson method
    return (item as dynamic).toJson();
  }
}

/// Builder for raw API responses (without GenericAPIResponse wrapper)
class _RawApiResponseBuilder<T> {
  final T data;
  int statusCode;
  Map<String, String> headers;

  _RawApiResponseBuilder._({
    required this.data,
    this.statusCode = 200,
    this.headers = const {},
  });

  /// Sets a custom status code
  _RawApiResponseBuilder<T> withStatusCode(int code) {
    statusCode = code;
    return this;
  }

  /// Sets custom headers
  _RawApiResponseBuilder<T> withHeaders(Map<String, String> newHeaders) {
    headers = newHeaders;
    return this;
  }

  /// Builds the APIResponse with raw data (no wrapper)
  APIResponse build() {
    // Convert to JSON directly without GenericAPIResponse wrapper
    dynamic jsonData;
    if (data is Map) {
      jsonData = data;
    } else {
      // Assume the object has a toJson method
      jsonData = (data as dynamic).toJson();
    }

    return APIResponse(
      data: utf8.encode(jsonEncode(jsonData)),
      statusCode: statusCode,
      headers: headers,
    );
  }
}

/// Convenience functions for common response patterns
extension ApiResponseHelpers on APIResponse {
  /// Creates an empty list response
  static APIResponse emptyList<T>() {
    return ApiResponseBuilder.forPaginatedList<T>([]).build();
  }

  /// Creates an error response
  static APIResponse error({
    int statusCode = 500,
    String message = 'Internal Server Error',
  }) {
    return APIResponse(
      data: utf8.encode(jsonEncode({'error': message})),
      statusCode: statusCode,
      headers: {},
    );
  }
}
