import 'dart:convert';
import 'dart:typed_data';
import 'package:foo/app-core.dart';
import 'package:test/test.dart';
import 'package:api_tools/api_tools.dart';
import 'package:foo/core.dart';

void main() {
  group('CompositeResponseHandlers Factory', () {
    group('jsonMap()', () {
      test('should handle successful JSON map response', () {
        final handler = CompositeResponseHandlers.jsonMap();
        final jsonData = {'name': 'John', 'age': 30, 'active': true};
        final response = _createApiResponse(200, jsonEncode(jsonData));

        final result = handler(response);

        expect(result, isA<Map<String, dynamic>>());
        expect(result['name'], equals('John'));
        expect(result['age'], equals(30));
        expect(result['active'], equals(true));
      });

      test('should reject non-2xx status codes', () {
        final handler = CompositeResponseHandlers.jsonMap();
        final response = _createApiResponse(404, '{"error": "Not found"}');

        expect(() => handler(response), throwsA(isA<HttpStatusException>()));
      });

      test('should handle JSON decoding errors', () {
        final handler = CompositeResponseHandlers.jsonMap();
        final response = _createApiResponse(200, 'invalid json');

        expect(() => handler(response), throwsA(isA<JsonDecodingException>()));
      });
    });

    group('jsonMapWithProblemDetails()', () {
      test('should handle successful response', () {
        final handler = CompositeResponseHandlers.jsonMapWithProblemDetails();
        final jsonData = {
          'result': 'success',
          'data': [1, 2, 3],
        };
        final response = _createApiResponse(200, jsonEncode(jsonData));

        final result = handler(response);

        expect(result, equals(jsonData));
      });

      test('should parse Problem Details for error responses', () {
        final handler = CompositeResponseHandlers.jsonMapWithProblemDetails();
        final problemDetails = {
          'type': 'https://api.example.com/problems/insufficient-funds',
          'title': 'Insufficient Funds',
          'detail': 'Your account balance is insufficient for this transaction',
          'status': 400,
          'instance': '/transactions/12345',
        };
        final response = _createApiResponse(400, jsonEncode(problemDetails));

        expect(
          () => handler(response),
          throwsA(
            isA<ProblemDetailsException>()
                .having((e) => e.title, 'title', equals('Insufficient Funds'))
                .having((e) => e.detail, 'detail', contains('insufficient'))
                .having((e) => e.type, 'type', contains('insufficient-funds'))
                .having(
                  (e) => e.instance,
                  'instance',
                  equals('/transactions/12345'),
                ),
          ),
        );
      });

      test(
        'should fallback to HttpStatusException for non-Problem Details errors',
        () {
          final handler = CompositeResponseHandlers.jsonMapWithProblemDetails();
          final response = _createApiResponse(500, 'Internal Server Error');

          expect(
            () => handler(response),
            throwsA(
              isA<HttpStatusException>().having(
                (e) => e.statusCode,
                'statusCode',
                equals(500),
              ),
            ),
          );
        },
      );
    });

    group('jsonMapWithCustomStatus()', () {
      test('should accept custom valid status codes', () {
        final handler = CompositeResponseHandlers.jsonMapWithCustomStatus({
          200,
          201,
          202,
          206,
        });
        final jsonData = {'status': 'partial_content'};

        for (final statusCode in [200, 201, 202, 206]) {
          final response = _createApiResponse(statusCode, jsonEncode(jsonData));
          final result = handler(response);

          expect(
            result,
            equals(jsonData),
            reason: 'Status code $statusCode should be accepted',
          );
        }
      });

      test('should reject non-custom status codes', () {
        final handler = CompositeResponseHandlers.jsonMapWithCustomStatus({
          200,
          201,
        });
        final response = _createApiResponse(202, '{"message": "accepted"}');

        expect(() => handler(response), throwsA(isA<HttpStatusException>()));
      });

      test('should handle Problem Details with custom status codes', () {
        final handler = CompositeResponseHandlers.jsonMapWithCustomStatus({
          200,
          422,
        });
        final problemDetails = {
          'type': 'https://api.example.com/problems/validation-error',
          'title': 'Validation Error',
          'status': 422,
        };
        final response = _createApiResponse(422, jsonEncode(problemDetails));

        expect(
          () => handler(response),
          throwsA(isA<ProblemDetailsException>()),
        );
      });
    });

    group('raw()', () {
      test('should return the original APIResponse without processing', () {
        final handler = CompositeResponseHandlers.raw();
        final originalResponse = _createApiResponse(404, 'Not found');

        final result = handler(originalResponse);

        expect(result, equals(originalResponse));
        expect(result.statusCode, equals(404));
        expect(utf8.decode(result.data), equals('Not found'));
      });

      test('should not throw exceptions for any status codes', () {
        final handler = CompositeResponseHandlers.raw();

        for (final statusCode in [200, 400, 404, 500]) {
          final response = _createApiResponse(statusCode, 'test');
          expect(
            () => handler(response),
            returnsNormally,
            reason: 'Raw handler should accept status code $statusCode',
          );
        }
      });
    });

    group('text()', () {
      test('should decode response body as text', () {
        final handler = CompositeResponseHandlers.text();
        final textContent = 'Hello, World! 🌍';
        final response = _createApiResponse(200, textContent);

        final result = handler(response);

        expect(result, equals(textContent));
      });

      test('should handle different text encodings', () {
        final handler = CompositeResponseHandlers.text();
        final textWithSpecialChars = 'Café ñoño ♠️ 中文';
        final response = _createApiResponse(200, textWithSpecialChars);

        final result = handler(response);

        expect(result, equals(textWithSpecialChars));
      });

      test('should reject non-2xx status codes', () {
        final handler = CompositeResponseHandlers.text();
        final response = _createApiResponse(500, 'Server Error');

        expect(() => handler(response), throwsA(isA<HttpStatusException>()));
      });
    });

    group('custom()', () {
      test('should use provided preprocessors and final handler', () {
        final customProcessor = _MockResponseProcessor(() => {});
        final customExtractor = _MockDataExtractor<String>(
          () => 'custom result',
        );

        final handler = CompositeResponseHandlers.custom<String>(
          processors: [customProcessor],
          extractor: customExtractor,
        );

        final response = _createApiResponse(200, 'test');
        final result = handler(response);

        expect(result, equals('custom result'));
      });

      test(
        'should use default status code handler when no preprocessors provided',
        () {
          final customExtractor = DataExtractorFactory.create<String>(
            (context) => 'success',
          );

          final handler = CompositeResponseHandlers.custom<String>(
            extractor: customExtractor,
          );

          // Should accept 2xx status codes
          final successResponse = _createApiResponse(200, 'test');
          final result = handler(successResponse);
          expect(result, equals('success'));

          // Should reject non-2xx status codes
          final errorResponse = _createApiResponse(400, 'error');
          expect(
            () => handler(errorResponse),
            throwsA(isA<HttpStatusException>()),
          );
        },
      );
    });
  });

  group('Integration Scenarios', () {
    group('API Client Integration', () {
      test('should work with custom data extractors for decoding', () {
        // Test custom decoder functionality using DataExtractor
        decoder(Uint8List data, APIResponse response) =>
            jsonDecode(utf8.decode(data));
        final handler = CompositeResponseHandler<dynamic>(
          processors: [StatusCodeProcessor.ok200Range()],
          extractor: DataExtractorFactory.create<dynamic>(
            (context) => decoder(context.apiResponse.data, context.apiResponse),
          ),
        );

        final jsonData = {'message': 'Hello', 'count': 42};
        final response = _createApiResponse(200, jsonEncode(jsonData));

        final result = handler(response);

        expect(result, equals(jsonData));
      });

      test('should demonstrate common REST API patterns', () {
        // GET /users/{id} - Success case
        final getUserHandler =
            CompositeResponseHandlers.jsonMapWithProblemDetails();
        final userResponse = _createApiResponse(
          200,
          jsonEncode({
            'id': 123,
            'name': 'John Doe',
            'email': 'john@example.com',
          }),
        );

        final user = getUserHandler(userResponse);
        expect(user['name'], equals('John Doe'));

        // GET /users/{id} - Not found case
        final notFoundResponse = _createApiResponse(
          404,
          jsonEncode({
            'type': 'https://api.example.com/problems/user-not-found',
            'title': 'User Not Found',
            'detail': 'User with ID 999 does not exist',
            'status': 404,
          }),
        );

        expect(
          () => getUserHandler(notFoundResponse),
          throwsA(
            isA<ProblemDetailsException>().having(
              (e) => e.title,
              'title',
              equals('User Not Found'),
            ),
          ),
        );
      });

      test('should handle different content types appropriately', () {
        // JSON endpoint
        final jsonHandler = CompositeResponseHandlers.jsonMap();
        final jsonResponse = _createApiResponse(200, '{"data": "json"}');
        final jsonResult = jsonHandler(jsonResponse);
        expect(jsonResult['data'], equals('json'));

        // Text endpoint
        final textHandler = CompositeResponseHandlers.text();
        final textResponse = _createApiResponse(200, 'plain text response');
        final textResult = textHandler(textResponse);
        expect(textResult, equals('plain text response'));

        // Raw binary endpoint
        final rawHandler = CompositeResponseHandlers.raw();
        final rawResponse = _createApiResponse(200, 'binary data');
        final rawResult = rawHandler(rawResponse);
        expect(rawResult.statusCode, equals(200));
      });
    });

    group('Error Handling Patterns', () {
      test('should demonstrate comprehensive error handling', () {
        final handler = CompositeResponseHandlers.jsonMapWithProblemDetails();

        // Validation error (422)
        final validationError = {
          'type': 'https://api.example.com/problems/validation-error',
          'title': 'Validation Failed',
          'detail': 'Email address is required',
          'status': 422,
          'invalid_fields': ['email'],
        };

        expect(
          () => handler(_createApiResponse(422, jsonEncode(validationError))),
          throwsA(
            isA<ProblemDetailsException>()
                .having((e) => e.title, 'title', equals('Validation Failed'))
                .having(
                  (e) => e.problemDetails['invalid_fields'],
                  'invalid_fields',
                  equals(['email']),
                ),
          ),
        );

        // Authentication error (401)
        final authError = {
          'type': 'https://api.example.com/problems/unauthorized',
          'title': 'Authentication Required',
          'detail': 'Access token has expired',
          'status': 401,
        };

        expect(
          () => handler(_createApiResponse(401, jsonEncode(authError))),
          throwsA(
            isA<ProblemDetailsException>().having(
              (e) => e.statusCode,
              'statusCode',
              equals(401),
            ),
          ),
        );

        // Rate limiting error (429) - need to include 429 in the error status codes
        final rateLimitHandler =
            CompositeResponseHandlers.jsonMapWithProblemDetails();
        final rateLimitError = {
          'type': 'https://api.example.com/problems/rate-limit-exceeded',
          'title': 'Rate Limit Exceeded',
          'detail': 'Too many requests. Try again in 60 seconds',
          'status': 429,
        };

        expect(
          () => rateLimitHandler(
            _createApiResponse(429, jsonEncode(rateLimitError)),
          ),
          throwsA(isA<ProblemDetailsException>()),
        );
      });
    });

    group('Custom Handler Composition', () {
      test('should demonstrate building complex custom handlers', () {
        // Custom handler that logs requests and transforms data
        final executionLog = <String>[];

        final loggingHandler = DataExtractorFactory.create<void>((context) {
          executionLog.add('Logged request: ${context.apiResponse.statusCode}');
        });

        final transformHandler =
            DataExtractorFactory.create<Map<String, dynamic>>((context) {
              final jsonData = context.get<Map<String, dynamic>>('jsonData')!;
              return {
                'transformed': true,
                'original': jsonData,
                'timestamp': DateTime.now().toIso8601String(),
              };
            });

        final customHandler = CompositeResponseHandler<Map<String, dynamic>>(
          processors: [
            StatusCodeProcessor.ok200Range(),
            JsonDataProcessor(),
            _MockResponseProcessor(
              () => executionLog.add('Logged request: 200'),
            ),
          ],
          extractor: DataExtractorFactory.create<Map<String, dynamic>>((
            context,
          ) {
            final jsonData = context.get<Map<String, dynamic>>('jsonData')!;
            return {
              'transformed': true,
              'original': jsonData,
              'timestamp': DateTime.now().toIso8601String(),
            };
          }),
        );

        final response = _createApiResponse(200, '{"message": "hello"}');
        final result = customHandler(response);

        expect(result['transformed'], isTrue);
        expect(result['original'], equals({'message': 'hello'}));
        expect(result['timestamp'], isA<String>());
        expect(executionLog, contains('Logged request: 200'));
      });

      test('should support conditional processing based on response data', () {
        // Handler that behaves differently based on response content
        final conditionalHandler = DataExtractorFactory.create<String>((
          context,
        ) {
          final jsonData = context.get<Map<String, dynamic>>('jsonData')!;

          if (jsonData.containsKey('redirect_url')) {
            throw RedirectException(jsonData['redirect_url'] as String);
          }

          return jsonData['message'] as String;
        });

        final handler = CompositeResponseHandler<String>(
          processors: [StatusCodeProcessor.ok200Range(), JsonDataProcessor()],
          extractor: DataExtractorFactory.create<String>((context) {
            final jsonData = context.get<Map<String, dynamic>>('jsonData')!;

            if (jsonData.containsKey('redirect_url')) {
              throw RedirectException(jsonData['redirect_url'] as String);
            }

            return jsonData['message'] as String;
          }),
        );

        // Normal response
        final normalResponse = _createApiResponse(
          200,
          '{"message": "success"}',
        );
        final normalResult = handler(normalResponse);
        expect(normalResult, equals('success'));

        // Redirect response
        final redirectResponse = _createApiResponse(
          200,
          '{"redirect_url": "https://example.com"}',
        );
        expect(
          () => handler(redirectResponse),
          throwsA(
            isA<RedirectException>().having(
              (e) => e.url,
              'url',
              equals('https://example.com'),
            ),
          ),
        );
      });
    });
  });
}

// Helper classes for tests
APIResponse _createApiResponse(int statusCode, String body) {
  return APIResponse(
    statusCode: statusCode,
    data: Uint8List.fromList(utf8.encode(body)),
    headers: {},
  );
}

// Mock response processor for testing execution order
class _MockResponseProcessor implements ResponseProcessor {
  final void Function() _action;

  _MockResponseProcessor(this._action);

  @override
  void call(ResponseContext context) => _action();
}

// Mock data extractor for testing
class _MockDataExtractor<T> implements DataExtractor<T> {
  final T Function() _action;

  _MockDataExtractor(this._action);

  @override
  T call(ResponseContext context) => _action();
}

// Custom exception for demonstration
class RedirectException implements Exception {
  final String url;
  RedirectException(this.url);

  @override
  String toString() => 'RedirectException: $url';
}
