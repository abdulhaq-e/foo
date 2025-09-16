import 'dart:convert';
import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:api_tools/api_tools.dart';
import 'package:foo/core.dart';

void main() {
  group('Composite response handler components', () {
    group('ResponseContext', () {
      test('should store and retrieve data', () {
        final apiResponse = _createApiResponse(200, '{"test": "data"}');
        final context = ResponseContext(apiResponse)
          ..set('key1', 'value1')
          ..set('key2', 42);

        expect(context.get<String>('key1'), equals('value1'));
        expect(context.get<int>('key2'), equals(42));
        expect(context.has('key1'), isTrue);
        expect(context.has('nonexistent'), isFalse);
      });

      test('should provide access to original API response', () {
        final apiResponse = _createApiResponse(200, '{"test": "data"}');
        final context = ResponseContext(apiResponse);

        expect(context.apiResponse, equals(apiResponse));
        expect(context.apiResponse.statusCode, equals(200));
      });
    });

    group('StatusCodeProcessor', () {
      test('should accept valid status codes', () {
        final handler = StatusCodeProcessor(validStatusCodes: {200, 201});
        final context = ResponseContext(_createApiResponse(200, 'OK'));

        expect(() => handler(context), returnsNormally);
      });

      test('should reject invalid status codes', () {
        final handler = StatusCodeProcessor(validStatusCodes: {200, 201});
        final context = ResponseContext(_createApiResponse(404, 'Not Found'));

        expect(
          () => handler(context),
          throwsA(
            isA<HttpStatusException>().having(
              (e) => e.statusCode,
              'statusCode',
              equals(404),
            ),
          ),
        );
      });

      test('ok200Range should accept 2xx status codes', () {
        final handler = StatusCodeProcessor.ok200Range();

        for (int code = 200; code <= 299; code++) {
          final context = ResponseContext(_createApiResponse(code, 'OK'));
          expect(
            () => handler(context),
            returnsNormally,
            reason: 'Status code $code should be accepted',
          );
        }
      });

      test('ok200Range should reject non-2xx status codes', () {
        final handler = StatusCodeProcessor.ok200Range();
        final testCodes = [199, 300, 400, 404, 500];

        for (int code in testCodes) {
          final context = ResponseContext(_createApiResponse(code, 'Error'));
          expect(
            () => handler(context),
            throwsA(isA<HttpStatusException>()),
            reason: 'Status code $code should be rejected',
          );
        }
      });

      test('should use custom exception mappings', () {
        final customException = Exception('Custom 404 error');
        final handler = StatusCodeProcessor(
          statusExceptionMap: {404: (response) => customException},
        );
        final context = ResponseContext(_createApiResponse(404, 'Not Found'));

        expect(() => handler(context), throwsA(equals(customException)));
      });
    });

    group('JsonDataProcessor', () {
      test('should decode valid JSON and store in context', () {
        final handler = JsonDataProcessor();
        final jsonData = {'name': 'John', 'age': 30};
        final context = ResponseContext(
          _createApiResponse(200, jsonEncode(jsonData)),
        );

        handler(context);

        final decodedData = context.get<Map<String, dynamic>>('jsonData');
        expect(decodedData, equals(jsonData));
      });

      test('should handle JSON arrays', () {
        final handler = JsonDataProcessor(contextKey: 'arrayData');
        final jsonArray = ['item1', 'item2', 'item3'];
        final context = ResponseContext(
          _createApiResponse(200, jsonEncode(jsonArray)),
        );

        handler(context);

        final decodedData = context.get<List<dynamic>>('arrayData');
        expect(decodedData, equals(jsonArray));
      });

      test('should throw JsonDecodingException for invalid JSON', () {
        final handler = JsonDataProcessor();
        final context = ResponseContext(
          _createApiResponse(200, 'invalid json'),
        );

        expect(() => handler(context), throwsA(isA<JsonDecodingException>()));
      });

      test('static decode methods should work correctly', () {
        final mapJson = '{"key": "value"}';
        final listJson = '["item1", "item2"]';

        final decodedMap = JsonDataProcessor.decodeToMap(utf8.encode(mapJson));
        final decodedList = JsonDataProcessor.decodeToList(
          utf8.encode(listJson),
        );

        expect(decodedMap, equals({'key': 'value'}));
        expect(decodedList, equals(['item1', 'item2']));
      });
    });

    group('ProblemDetailsProcessor', () {
      test(
        'should parse and throw ProblemDetailsException for error status codes',
        () {
          final problemDetails = {
            'type': 'https://example.com/problems/validation-error',
            'title': 'Validation Error',
            'detail': 'The request contained invalid data',
            'status': 400,
          };

          final handler = ProblemDetailsProcessor();
          final context = ResponseContext(
            _createApiResponse(400, jsonEncode(problemDetails)),
          );

          expect(
            () => handler(context),
            throwsA(
              isA<ProblemDetailsException>()
                  .having((e) => e.statusCode, 'statusCode', equals(400))
                  .having((e) => e.title, 'title', equals('Validation Error'))
                  .having(
                    (e) => e.detail,
                    'detail',
                    equals('The request contained invalid data'),
                  )
                  .having(
                    (e) => e.type,
                    'type',
                    equals('https://example.com/problems/validation-error'),
                  ),
            ),
          );
        },
      );

      test('should ignore success status codes', () {
        final handler = ProblemDetailsProcessor();
        final context = ResponseContext(_createApiResponse(200, 'OK'));

        expect(() => handler(context), returnsNormally);
      });

      test(
        'should fall back to HttpStatusException for non-Problem Details responses',
        () {
          final handler = ProblemDetailsProcessor();
          final context = ResponseContext(
            _createApiResponse(500, 'Internal Server Error'),
          );

          expect(
            () => handler(context),
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

      test('should validate Problem Details format', () {
        final invalidProblemDetails = {'message': 'Some error'};
        final handler = ProblemDetailsProcessor();
        final context = ResponseContext(
          _createApiResponse(400, jsonEncode(invalidProblemDetails)),
        );

        expect(() => handler(context), throwsA(isA<HttpStatusException>()));
      });
    });


    group('ContextDataHandler', () {
      test('should extract data from context', () {
        final handler = ContextDataHandler<String>('testKey');
        final context = ResponseContext(_createApiResponse(200, ''));
        context.set('testKey', 'extracted value');

        final result = handler(context);

        expect(result, equals('extracted value'));
      });

      test('should apply transformer if provided', () {
        final transformer = (dynamic data) => (data as String).toUpperCase();
        final handler = ContextDataHandler<String>('testKey', transformer);
        final context = ResponseContext(_createApiResponse(200, ''));
        context.set('testKey', 'hello');

        final result = handler(context);

        expect(result, equals('HELLO'));
      });

      test('should throw StateError if data not found in context', () {
        final handler = ContextDataHandler<String>('missingKey');
        final context = ResponseContext(_createApiResponse(200, ''));

        expect(
          () => handler(context),
          throwsA(
            isA<StateError>().having(
              (e) => e.message,
              'message',
              contains('No data found in context for key: missingKey'),
            ),
          ),
        );
      });
    });

    group('CompositeResponseHandler', () {
      test('should execute preprocessors in order then final handler', () {
        final executionOrder = <String>[];

        final preprocessor1 = _MockResponseProcessor(
          () => executionOrder.add('prep1'),
        );
        final preprocessor2 = _MockResponseProcessor(
          () => executionOrder.add('prep2'),
        );
        final finalHandler = _MockDataExtractor<String>(() {
          executionOrder.add('final');
          return 'result';
        });

        final composite = CompositeResponseHandler<String>(
          processors: [preprocessor1, preprocessor2],
          extractor: finalHandler,
        );

        final apiResponse = _createApiResponse(200, 'test');
        final result = composite(apiResponse);

        expect(result, equals('result'));
        expect(executionOrder, equals(['prep1', 'prep2', 'final']));
      });

      test('should stop execution if preprocessor throws exception', () {
        final executionOrder = <String>[];

        final preprocessor1 = _MockResponseProcessor(
          () => executionOrder.add('prep1'),
        );
        final preprocessor2 = _MockResponseProcessor(() {
          executionOrder.add('prep2');
          throw Exception('Preprocessor error');
        });
        final finalHandler = _MockDataExtractor<String>(() {
          executionOrder.add('final');
          return 'result';
        });

        final composite = CompositeResponseHandler<String>(
          processors: [preprocessor1, preprocessor2],
          extractor: finalHandler,
        );

        final apiResponse = _createApiResponse(200, 'test');

        expect(() => composite(apiResponse), throwsA(isA<Exception>()));
        expect(executionOrder, equals(['prep1', 'prep2']));
      });
    });
  });
}

// Helper function to create APIResponse objects for testing
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
