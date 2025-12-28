import 'package:api_tools/api_tools.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'api_response_builder.dart';
import 'mock_factories.dart';

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
  late MockAPIClient mockApiClient;

  RemoteHandlerTestHarness() {
    mockApiClient = MockAPIClient();
  }

  /// Mocks the API client to return a successful response with the given data.
  /// Uses ApiResponseBuilder to create properly formatted GenericAPIResponse.
  /// Use this for handlers that use `createGenericApiHandlerForSingularData`.
  void mockApiResponseWith<T>(T data) {
    final response = ApiResponseBuilder.forSingleItem(data).build();
    when(() => mockApiClient.request(any())).thenAnswer((_) async => response);
  }

  /// Mocks the API client to return a nested response where data is wrapped under a key.
  /// Use this for handlers that expect data nested like: {"data": {"config": {...}}}
  void mockNestedApiResponseWith<T>(T data, {required String nestedKey}) {
    final response = ApiResponseBuilder.forNestedItem(
      data,
      nestedKey: nestedKey,
    ).build();
    when(() => mockApiClient.request(any())).thenAnswer((_) async => response);
  }

  /// Mocks the API client to return a raw response without GenericAPIResponse wrapper.
  /// Use this for handlers that use `createApiHandlerForSingularItem`.
  void mockRawApiResponseWith<T>(T data) {
    final response = ApiResponseBuilder.forRawItem(data).build();
    when(() => mockApiClient.request(any())).thenAnswer((_) async => response);
  }

  /// Mocks the API client to return a paginated list response.
  void mockPaginatedResponseWith<T>(List<T> data) {
    final response = ApiResponseBuilder.forPaginatedList(data).build();
    when(() => mockApiClient.request(any())).thenAnswer((_) async => response);
  }

  /// Mocks the API client to return a list response.
  void mockListResponseWith<T>(List<T> data) {
    final response = ApiResponseBuilder.forList(data).build();
    when(() => mockApiClient.request(any())).thenAnswer((_) async => response);
  }

  /// Verifies that an endpoint with the specified properties was called exactly once.
  void verifyEndpointWasCalled({
    required String path,
    required HttpMethod httpMethod,
    Map<String, String>? queryParameters,
    String? body,
  }) {
    verify(
      () => mockApiClient.request(
        any(
          that: _endpointMatcher(
            path: path,
            httpMethod: httpMethod,
            queryParameters: queryParameters,
            body: body,
          ),
        ),
      ),
    ).called(1);
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
    verify(
      () => mockApiClient.request(
        any(
          that: predicate<Endpoint>(
            (endpoint) =>
                endpoint.path == path &&
                endpoint.httpMethod == httpMethod &&
                endpoint.queryParameters.isEmpty,
          ),
        ),
      ),
    ).called(1);
  }

  /// Captures the endpoint that was sent to verify its contents.
  Endpoint captureEndpoint() {
    return verify(() => mockApiClient.request(captureAny())).captured.single
        as Endpoint;
  }

  /// Internal helper to create an endpoint matcher.
  Matcher _endpointMatcher({
    required String path,
    required HttpMethod httpMethod,
    Map<String, String>? queryParameters,
    String? body,
  }) {
    return predicate<Endpoint>((endpoint) {
      // Always check path and method
      if (endpoint.path != path || endpoint.httpMethod != httpMethod) {
        return false;
      }

      // Check query parameters if provided
      if (queryParameters != null) {
        for (final entry in queryParameters.entries) {
          if (endpoint.queryParameters[entry.key] != entry.value) {
            return false;
          }
        }
      }

      // Check body if provided
      if (body != null && endpoint.data != body) {
        return false;
      }

      return true;
    });
  }
}
