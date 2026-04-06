import 'package:api_tools/api_tools.dart';
import 'package:api_tools/src/testing.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api_response_builder.dart';

/// Test harness for testing remote query/command handlers.
///
/// This harness simplifies testing handlers that use JsonRemoteMessageHandler
/// by providing utilities to:
/// - Mock API responses easily
/// - Verify the correct Endpoint was sent
/// - Focus tests on endpoint construction rather than error handling
///
/// The JsonRemoteMessageHandler already handles:
/// - HTTP error responses
/// - JSON parsing errors
/// - Data transformation
///
/// Therefore, these tests should focus on:
/// - Correct endpoint path
/// - Correct HTTP method
/// - Correct query parameters
/// - Correct request body (for commands)
///
/// Usage:
/// ```dart
/// late RemoteHandlerTestHarness harness;
///
/// setUp(() {
///   harness = RemoteHandlerTestHarness();
/// });
///
/// test('should send correct endpoint', () async {
///   // Arrange
///   final mockData = TestFixtures.student();
///   harness.mockApiResponseWith(mockData);
///
///   // Act
///   await handler(query);
///
///   // Assert
///   harness.verifyEndpointWasCalled(
///     path: 'api/queries/v1/students',
///     httpMethod: HttpMethod.get,
///   );
/// });
/// ```
class RemoteHandlerTestHarness {
  final List<Endpoint> _capturedEndpoints = [];
  final Map<String, APIResponse> _responses = {};
  APIResponse? _defaultResponse;

  late final APIClientTestDouble apiClient;

  RemoteHandlerTestHarness() {
    apiClient = APIClientTestDouble(
      requestCallback: (endpoint) async {
        _capturedEndpoints.add(endpoint);
        final response = _responses[endpoint.path] ?? _defaultResponse;
        if (response == null) {
          throw StateError('No response configured for ${endpoint.path}');
        }
        return response;
      },
    );
  }

  /// Mocks the API client to return a successful response with the given data.
  /// Uses ApiResponseBuilder to create properly formatted GenericAPIResponse.
  /// Use this for handlers that use `createGenericApiHandlerForSingularData`.
  void mockApiResponseWith<T>(T data) {
    _defaultResponse = ApiResponseBuilder.forSingleItem(data).build();
  }

  /// Mocks the API client to return a nested response where data is wrapped under a key.
  /// Use this for handlers that expect data nested like: {"data": {"config": {...}}}
  void mockNestedApiResponseWith<T>(T data, {required String nestedKey}) {
    _defaultResponse = ApiResponseBuilder.forNestedItem(
      data,
      nestedKey: nestedKey,
    ).build();
  }

  /// Mocks the API client to return a raw response without GenericAPIResponse wrapper.
  /// Use this for handlers that use `createApiHandlerForSingularItem`.
  void mockRawApiResponseWith<T>(T data) {
    _defaultResponse = ApiResponseBuilder.forRawItem(data).build();
  }

  /// Mocks the API client to return a paginated list response.
  void mockPaginatedResponseWith<T>(List<T> data) {
    _defaultResponse = ApiResponseBuilder.forPaginatedList(data).build();
  }

  /// Mocks the API client to return a list response.
  void mockListResponseWith<T>(List<T> data) {
    _defaultResponse = ApiResponseBuilder.forList(data).build();
  }

  /// Verifies that an endpoint with the specified properties was called exactly once.
  void verifyEndpointWasCalled({
    required String path,
    required HttpMethod httpMethod,
    Map<String, String>? queryParameters,
    String? body,
  }) {
    final matches = _capturedEndpoints.where((endpoint) {
      if (endpoint.path != path || endpoint.httpMethod != httpMethod) {
        return false;
      }
      if (queryParameters != null) {
        for (final entry in queryParameters.entries) {
          if (endpoint.queryParameters[entry.key] != entry.value) return false;
        }
      }
      if (body != null && endpoint.data != body) return false;
      return true;
    });
    expect(matches, hasLength(1));
  }

  /// Verifies that the endpoint was called with specific query parameters present.
  void verifyEndpointCalledWithQueryParams({
    required String path,
    required Map<String, String> queryParameters,
    HttpMethod httpMethod = HttpMethod.get,
  }) {
    verifyEndpointWasCalled(
      path: path,
      httpMethod: httpMethod,
      queryParameters: queryParameters,
    );
  }

  /// Verifies that the endpoint was called with an empty query parameters map.
  void verifyEndpointCalledWithoutQueryParams({
    required String path,
    HttpMethod httpMethod = HttpMethod.get,
  }) {
    final matches = _capturedEndpoints.where(
      (endpoint) =>
          endpoint.path == path &&
          endpoint.httpMethod == httpMethod &&
          endpoint.queryParameters.isEmpty,
    );
    expect(matches, hasLength(1));
  }

  /// Captures the endpoint that was sent to verify its contents.
  Endpoint captureEndpoint() {
    return _capturedEndpoints.single;
  }
}
