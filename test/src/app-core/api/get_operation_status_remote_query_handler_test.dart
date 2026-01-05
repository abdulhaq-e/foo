import 'dart:convert';

import 'package:api_tools/api_tools.dart';
import 'package:api_tools/src/testing.dart';
import 'package:foo/app-core.dart';
import 'package:foo/app-core-testing.dart';
import 'package:foo/core.dart';
import 'package:test/test.dart';

void main() {
  group('getOperationStatusQueryHandlerFactory', () {
    late APIClientTestDouble apiClient;

    setUp(() {
      apiClient = APIClientTestDouble(
        requestCallback: (endpoint) async => dummyAPIResponse(),
      );
    });

    group('Operation Status Responses', () {
      test('returns pending status', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => AsyncResponseHelpers.pending(),
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        final status = await queryHandler('op-123');

        expect(status.status, equals(OperationStatusValue.pending));
        expect(status.data, isNull);
        expect(status.error, isNull);
      });

      test('returns success status with data', () async {
        final resultData = {'userId': 'user-456', 'name': 'John Doe'};

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async =>
              AsyncResponseHelpers.success(resultData),
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        final status = await queryHandler('op-123');

        expect(status.status, equals(OperationStatusValue.success));
        expect(status.data, equals(resultData));
        expect(status.error, isNull);
      });

      test('returns failed status with error', () async {
        final errorData = {'message': 'Validation failed', 'code': 'VAL_ERR'};

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async =>
              AsyncResponseHelpers.failed(errorData),
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        final status = await queryHandler('op-123');

        expect(status.status, equals(OperationStatusValue.failed));
        expect(status.data, isNull);
        expect(status.error, equals(errorData));
      });

      test('handles success status without data', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => AsyncResponseHelpers.success(),
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        final status = await queryHandler('op-123');

        expect(status.status, equals(OperationStatusValue.success));
        expect(status.data, isNull);
      });
    });

    group('Endpoint Path Building', () {
      test('uses default status endpoint path', () async {
        Endpoint? capturedEndpoint;

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            capturedEndpoint = endpoint;
            return AsyncResponseHelpers.pending();
          },
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        await queryHandler('op-abc-123');

        expect(capturedEndpoint, isNotNull);
        expect(
          capturedEndpoint!.path,
          equals('api/operations/op-abc-123/status'),
        );
      });

      test('handles operation IDs with special characters', () async {
        Endpoint? capturedEndpoint;

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            capturedEndpoint = endpoint;
            return AsyncResponseHelpers.pending();
          },
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        await queryHandler('op-123-abc_def');

        expect(capturedEndpoint, isNotNull);
        expect(
          capturedEndpoint!.path,
          equals('api/operations/op-123-abc_def/status'),
        );
      });
    });

    group('HTTP Method and Headers', () {
      test('uses GET HTTP method', () async {
        Endpoint? capturedEndpoint;

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            capturedEndpoint = endpoint;
            return AsyncResponseHelpers.pending();
          },
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        await queryHandler('op-123');

        expect(capturedEndpoint, isNotNull);
        expect(capturedEndpoint!.httpMethod, equals(HttpMethod.get));
      });

      test('makes exactly one API call', () async {
        var callCount = 0;

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            callCount++;
            return AsyncResponseHelpers.pending();
          },
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        await queryHandler('op-123');

        expect(callCount, equals(1));
      });
    });

    group('Error Handling', () {
      test('propagates network errors', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            throw Exception('Network connection failed');
          },
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        expect(() => queryHandler('op-123'), throwsA(isA<Exception>()));
      });

      test('propagates API errors', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            throw Exception('HTTP 500: Internal Server Error');
          },
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        expect(() => queryHandler('op-123'), throwsA(isA<Exception>()));
      });

      test('handles malformed JSON response', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => APIResponse(
            data: utf8.encode('invalid-json'),
            statusCode: 200,
            headers: {},
          ),
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        expect(() => queryHandler('op-123'), throwsA(anything));
      });

      test('handles missing status field in response', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => APIResponse(
            data: utf8.encode(jsonEncode({'invalid': 'no status field'})),
            statusCode: 200,
            headers: {},
          ),
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        expect(
          () => queryHandler('op-123'),
          throwsA(anything),
          reason: 'Should throw when status field is missing',
        );
      });

      test('handles invalid status value in response', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => APIResponse(
            data: utf8.encode(jsonEncode({'status': 'invalid-status-value'})),
            statusCode: 200,
            headers: {},
          ),
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        expect(
          () => queryHandler('op-123'),
          throwsA(anything),
          reason: 'Should throw when status value is invalid',
        );
      });
    });

    group('Multiple Operations', () {
      test('can query different operation IDs', () async {
        final capturedPaths = <String>[];

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            capturedPaths.add(endpoint.path);
            if (endpoint.path.contains('op-1')) {
              return AsyncResponseHelpers.success({'result': '1'});
            } else if (endpoint.path.contains('op-2')) {
              return AsyncResponseHelpers.pending();
            } else {
              return AsyncResponseHelpers.failed({'error': 'failed'});
            }
          },
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        final status1 = await queryHandler('op-1');
        final status2 = await queryHandler('op-2');
        final status3 = await queryHandler('op-3');

        expect(status1.status, equals(OperationStatusValue.success));
        expect(status2.status, equals(OperationStatusValue.pending));
        expect(status3.status, equals(OperationStatusValue.failed));

        expect(capturedPaths, hasLength(3));
        expect(capturedPaths[0], contains('op-1'));
        expect(capturedPaths[1], contains('op-2'));
        expect(capturedPaths[2], contains('op-3'));
      });

      test('can be called multiple times with same operation ID', () async {
        var callCount = 0;

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            callCount++;
            if (callCount == 1) {
              return AsyncResponseHelpers.pending();
            } else if (callCount == 2) {
              return AsyncResponseHelpers.pending();
            } else {
              return AsyncResponseHelpers.success({'done': true});
            }
          },
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        final status1 = await queryHandler('op-123');
        final status2 = await queryHandler('op-123');
        final status3 = await queryHandler('op-123');

        expect(status1.status, equals(OperationStatusValue.pending));
        expect(status2.status, equals(OperationStatusValue.pending));
        expect(status3.status, equals(OperationStatusValue.success));
        expect(callCount, equals(3));
      });
    });

    group('Response Data Types', () {
      test('handles complex nested data objects', () async {
        final complexData = {
          'user': {
            'id': 'user-123',
            'profile': {'name': 'John Doe', 'email': 'john@example.com'},
            'preferences': ['pref1', 'pref2'],
          },
          'metadata': {'timestamp': '2024-01-01T12:00:00Z', 'version': 2},
        };

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async =>
              AsyncResponseHelpers.success(complexData),
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        final status = await queryHandler('op-123');

        expect(status.status, equals(OperationStatusValue.success));
        expect(status.data, equals(complexData));
        expect(status.data!['user']['profile']['name'], equals('John Doe'));
      });

      test('handles empty data object', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => AsyncResponseHelpers.success({}),
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        final status = await queryHandler('op-123');

        expect(status.status, equals(OperationStatusValue.success));
        expect(status.data, equals({}));
      });

      test('handles error with detailed information', () async {
        final detailedError = {
          'message': 'Validation failed',
          'code': 'VAL_001',
          'fields': {
            'email': 'Invalid email format',
            'age': 'Must be greater than 0',
          },
          'timestamp': '2024-01-01T12:00:00Z',
        };

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async =>
              AsyncResponseHelpers.failed(detailedError),
        );

        final queryHandler = getOperationStatusRemoteQueryHandlerFactory(
          apiClient: apiClient,
        );

        final status = await queryHandler('op-123');

        expect(status.status, equals(OperationStatusValue.failed));
        expect(status.error, equals(detailedError));
        expect(status.error!['code'], equals('VAL_001'));
        expect(status.error!['fields']['email'], contains('Invalid'));
      });
    });
  });
}
