import 'dart:convert';
import 'dart:typed_data';
import 'package:foo/app-core.dart';
import 'package:test/test.dart';
import 'package:api_tools/api_tools.dart';
import 'package:foo/core.dart';

/// This file contains executable examples that demonstrate how to use the
/// composable response handler architecture. These tests serve as both
/// documentation and validation of the API.
void main() {
  group('Composite Response Handler Examples & Documentation', () {
    group('🚀 Quick Start Examples', () {
      test('Example 1: Basic JSON API response handling', () {
        // Most common use case: Handle JSON responses from REST APIs
        final handler = CompositeResponseHandlers.jsonMap();

        // Simulate API response: GET /api/users/123
        final apiResponse = _mockApiResponse(200, {
          'id': 123,
          'name': 'John Doe',
          'email': 'john@example.com',
          'isActive': true,
        });

        // Process the response
        final user = handler(apiResponse);

        // Verify the data was extracted correctly
        expect(user['id'], equals(123));
        expect(user['name'], equals('John Doe'));
        expect(user['email'], equals('john@example.com'));
        expect(user['isActive'], isTrue);
      });

      test('Example 2: Handle API errors with Problem Details', () {
        // For APIs that follow RFC 7807 Problem Details standard
        final handler = CompositeResponseHandlers.jsonMapWithProblemDetails();

        // Simulate validation error response
        final errorResponse = _mockApiResponse(400, {
          'type': 'https://api.myapp.com/problems/validation-error',
          'title': 'Validation Error',
          'detail': 'Email address is required and must be valid',
          'status': 400,
          'invalid_fields': ['email'],
        });

        // The handler automatically parses and throws appropriate exceptions
        expect(
          () => handler(errorResponse),
          throwsA(
            isA<ProblemDetailsException>()
                .having((e) => e.title, 'title', equals('Validation Error'))
                .having(
                  (e) => e.problemDetails['invalid_fields'],
                  'fields',
                  equals(['email']),
                ),
          ),
        );
      });

      test('Example 3: Custom status codes (e.g., GraphQL over HTTP)', () {
        // Some APIs use non-standard status codes (e.g., GraphQL always returns 200)
        final handler = CompositeResponseHandlers.jsonMapWithCustomStatus({
          200,
          400,
          500,
        });

        // GraphQL query with errors (still returns 200)
        final graphqlResponse = _mockApiResponse(200, {
          'data': null,
          'errors': [
            {
              'message': 'User not found',
              'path': ['user'],
            },
          ],
        });

        final result = handler(graphqlResponse);
        expect(result['errors'], isNotNull);
        expect(result['data'], isNull);
      });
    });

    group('🔧 Advanced Composition Examples', () {
      test('Example 4: Building a custom response handler pipeline', () {
        // Create a specialized handler for a paginated API response
        final auditHandler = _AuditHandler();
        final paginationExtractor =
            DataExtractorFactory.create<PaginatedResponse>((context) {
              final jsonData = context.get<Map<String, dynamic>>('jsonData')!;

              return PaginatedResponse(
                data: List<Map<String, dynamic>>.from(jsonData['data'] ?? []),
                currentPage: jsonData['page'] as int? ?? 1,
                totalPages: jsonData['total_pages'] as int? ?? 1,
                totalItems: jsonData['total_items'] as int? ?? 0,
              );
            });

        final customHandler = CompositeResponseHandler<PaginatedResponse>(
          processors: [
            StatusCodeProcessor.ok200Range(),
            JsonDataProcessor(),
            auditHandler, // Log the request for audit purposes
          ],
          extractor: paginationExtractor,
        );

        // Simulate paginated API response
        final paginatedResponse = _mockApiResponse(200, {
          'data': [
            {'id': 1, 'name': 'Item 1'},
            {'id': 2, 'name': 'Item 2'},
          ],
          'page': 1,
          'total_pages': 5,
          'total_items': 42,
        });

        final result = customHandler(paginatedResponse);

        expect(result.data.length, equals(2));
        expect(result.currentPage, equals(1));
        expect(result.totalPages, equals(5));
        expect(result.totalItems, equals(42));
        expect(auditHandler.auditLog, isNotEmpty);
      });

      test('Example 5: Conditional processing based on response content', () {
        // Handler that processes responses differently based on content
        final smartHandler = DataExtractorFactory.create<ProcessedResult>((
          context,
        ) {
          final jsonData = context.get<Map<String, dynamic>>('jsonData')!;

          // Check if response contains a redirect
          if (jsonData.containsKey('redirect_to')) {
            return ProcessedResult.redirect(jsonData['redirect_to'] as String);
          }

          // Check if response is paginated
          if (jsonData.containsKey('next_page_url')) {
            return ProcessedResult.paginated(
              data: jsonData['data'],
              nextPageUrl: jsonData['next_page_url'] as String,
            );
          }

          // Regular single item response
          return ProcessedResult.single(jsonData);
        });

        final conditionalHandler = CompositeResponseHandler<ProcessedResult>(
          processors: [StatusCodeProcessor.ok200Range(), JsonDataProcessor()],
          extractor: smartHandler,
        );

        // Test redirect response
        final redirectResponse = _mockApiResponse(200, {
          'redirect_to': 'https://newapi.example.com/v2/users/123',
        });
        final redirectResult = conditionalHandler(redirectResponse);
        expect(redirectResult.type, equals(ResultType.redirect));
        expect(
          redirectResult.redirectUrl,
          equals('https://newapi.example.com/v2/users/123'),
        );

        // Test paginated response
        final paginatedResponse = _mockApiResponse(200, {
          'data': [
            {'id': 1},
            {'id': 2},
          ],
          'next_page_url': 'https://api.example.com/users?page=2',
        });
        final paginatedResult = conditionalHandler(paginatedResponse);
        expect(paginatedResult.type, equals(ResultType.paginated));
        expect(
          paginatedResult.nextPageUrl,
          equals('https://api.example.com/users?page=2'),
        );
      });

      test('Example 6: Multi-format API support', () {
        // Handler that can process different content types
        final contentTypeHandler = _ContentTypeProcessor();

        final multiFormatHandler = DataExtractorFactory.create<dynamic>((
          context,
        ) {
          final contentType = context.get<String>('contentType')!;

          if (contentType.contains('application/json')) {
            return context.get<Map<String, dynamic>>('jsonData');
          } else if (contentType.contains('text/plain')) {
            return utf8.decode(context.apiResponse.data);
          } else if (contentType.contains('text/xml')) {
            // In a real scenario, you'd parse XML here
            return 'XML: ${utf8.decode(context.apiResponse.data)}';
          }

          throw UnsupportedContentTypeException(contentType);
        });

        // Create a smart JSON handler that only processes JSON content types
        final conditionalJsonHandler = _ConditionalJsonProcessor();

        final universalHandler = CompositeResponseHandler<dynamic>(
          processors: [
            StatusCodeProcessor.ok200Range(),
            contentTypeHandler,
            conditionalJsonHandler, // Smart JSON handling
          ],
          extractor: multiFormatHandler,
        );

        // Test JSON response
        final jsonResponse = APIResponse(
          statusCode: 200,
          data: utf8.encode('{"message": "json"}'),
          headers: {'content-type': 'application/json'},
        );
        final jsonResult = universalHandler(jsonResponse);
        expect(jsonResult['message'], equals('json'));

        // Test text response
        final textResponse = APIResponse(
          statusCode: 200,
          data: utf8.encode('Plain text message'),
          headers: {'content-type': 'text/plain'},
        );
        final textResult = universalHandler(textResponse);
        expect(textResult, equals('Plain text message'));
      });
    });

    group('🛠️ Real-World Integration Patterns', () {
      test('Example 7: REST API client with full error handling', () async {
        // Simulate a complete REST API client method
        Future<User> fetchUser(int userId) async {
          final handler = CompositeResponseHandlers.jsonMapWithProblemDetails();

          // In real code, this would be an actual HTTP request
          final response = _mockApiResponse(200, {
            'id': userId,
            'name': 'Jane Smith',
            'email': 'jane@example.com',
            'created_at': '2023-01-15T10:30:00Z',
            'last_login': '2024-01-15T14:22:30Z',
          });

          final userData = handler(response);
          return User.fromJson(userData);
        }

        // Test successful case
        final user = await fetchUser(456);
        expect(user.id, equals(456));
        expect(user.name, equals('Jane Smith'));
        expect(user.email, equals('jane@example.com'));
      });

      test('Example 8: Batch operation with mixed results', () {
        // Handler for bulk operations that can have partial failures
        final batchHandler = DataExtractorFactory.create<BatchResult>((
          context,
        ) {
          final jsonData = context.get<Map<String, dynamic>>('jsonData')!;

          final results = (jsonData['results'] as List).map((item) {
            final result = item as Map<String, dynamic>;
            return BatchItem(
              id: result['id'] as String,
              success: result['success'] as bool,
              data: result['data'],
              error: result['error'] as String?,
            );
          }).toList();

          return BatchResult(
            totalProcessed: jsonData['total_processed'] as int,
            successCount: jsonData['success_count'] as int,
            errorCount: jsonData['error_count'] as int,
            results: results,
          );
        });

        final batchResponseHandler = CompositeResponseHandler<BatchResult>(
          processors: [
            StatusCodeProcessor.specific({200, 207}), // 207 = Multi-Status
            JsonDataProcessor(),
          ],
          extractor: batchHandler,
        );

        // Simulate batch operation response
        final batchResponse = _mockApiResponse(207, {
          'total_processed': 3,
          'success_count': 2,
          'error_count': 1,
          'results': [
            {
              'id': '1',
              'success': true,
              'data': {'created': true},
            },
            {
              'id': '2',
              'success': true,
              'data': {'updated': true},
            },
            {'id': '3', 'success': false, 'error': 'Validation failed'},
          ],
        });

        final result = batchResponseHandler(batchResponse);

        expect(result.totalProcessed, equals(3));
        expect(result.successCount, equals(2));
        expect(result.errorCount, equals(1));
        expect(result.results.length, equals(3));
        expect(result.results.where((r) => r.success).length, equals(2));
      });
    });

    group('🔧 Advanced Handler Patterns', () {
      test('Example 9: Creating reusable custom handlers', () {
        // Create a reusable handler for API responses with metadata
        final metadataHandler =
            DataExtractorFactory.create<Map<String, dynamic>>((context) {
              final jsonData = context.get<Map<String, dynamic>>('jsonData')!;
              return {
                'data': jsonData,
                'statusCode': context.apiResponse.statusCode,
                'timestamp': DateTime.now().toIso8601String(),
              };
            });

        final enrichedHandler = CompositeResponseHandler<Map<String, dynamic>>(
          processors: [StatusCodeProcessor.ok200Range(), JsonDataProcessor()],
          extractor: metadataHandler,
        );

        final response = _mockApiResponse(200, {'message': 'test'});
        final result = enrichedHandler(response);

        expect(result['data'], equals({'message': 'test'}));
        expect(result['statusCode'], equals(200));
        expect(result['timestamp'], isA<String>());
      });

      test('Example 10: Conditional handler with fallbacks', () {
        // Handler that adapts based on content type or response structure
        final adaptiveHandler = DataExtractorFactory.create<dynamic>((context) {
          final headers = context.apiResponse.headers;
          final contentType = headers['content-type'] ?? '';

          if (contentType.contains('application/json')) {
            // Try to get parsed JSON data
            if (context.has('jsonData')) {
              return context.get<Map<String, dynamic>>('jsonData');
            }
          }

          // Fallback to raw text
          return utf8.decode(context.apiResponse.data);
        });

        final flexibleHandler = CompositeResponseHandler<dynamic>(
          processors: [
            StatusCodeProcessor.ok200Range(),
            JsonDataProcessor(), // Will succeed for JSON, fail silently for others
          ],
          extractor: adaptiveHandler,
        );

        final jsonResponse = APIResponse(
          statusCode: 200,
          data: utf8.encode('{"type": "json"}'),
          headers: {'content-type': 'application/json'},
        );

        final result = flexibleHandler(jsonResponse);
        expect(result, equals({'type': 'json'}));
      });
    });

    group('🔍 Testing and Debugging Examples', () {
      test('Example 11: Handler that logs for debugging', () {
        final debugLog = <String>[];

        final loggingHandler = _LoggingProcessor(debugLog);

        final debuggableHandler =
            CompositeResponseHandler<Map<String, dynamic>>(
              processors: [
                StatusCodeProcessor.ok200Range(),
                JsonDataProcessor(),
                loggingHandler,
              ],
              extractor: DataExtractorFactory.create<Map<String, dynamic>>(
                (context) => context.get<Map<String, dynamic>>('jsonData')!,
              ),
            );

        final response = _mockApiResponse(200, {
          'debug': true,
          'trace_id': '12345',
        });
        final result = debuggableHandler(response);

        expect(result['debug'], isTrue);
        expect(debugLog, contains('Status: 200'));
        expect(debugLog, contains('JSON keys: debug, trace_id'));
      });
    });
  });
}

// Helper function to create API responses for examples
APIResponse _mockApiResponse(int statusCode, Map<String, dynamic> data) {
  return APIResponse(
    statusCode: statusCode,
    data: utf8.encode(jsonEncode(data)),
    headers: {'content-type': 'application/json'},
  );
}

// Example domain models for documentation
class User {
  final int id;
  final String name;
  final String email;
  final DateTime? createdAt;
  final DateTime? lastLogin;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.createdAt,
    this.lastLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      lastLogin: json['last_login'] != null
          ? DateTime.parse(json['last_login'] as String)
          : null,
    );
  }
}

class PaginatedResponse {
  final List<Map<String, dynamic>> data;
  final int currentPage;
  final int totalPages;
  final int totalItems;

  PaginatedResponse({
    required this.data,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
  });
}

enum ResultType { single, paginated, redirect }

class ProcessedResult {
  final ResultType type;
  final dynamic data;
  final String? nextPageUrl;
  final String? redirectUrl;

  ProcessedResult._({
    required this.type,
    this.data,
    this.nextPageUrl,
    this.redirectUrl,
  });

  factory ProcessedResult.single(dynamic data) {
    return ProcessedResult._(type: ResultType.single, data: data);
  }

  factory ProcessedResult.paginated({
    required dynamic data,
    required String nextPageUrl,
  }) {
    return ProcessedResult._(
      type: ResultType.paginated,
      data: data,
      nextPageUrl: nextPageUrl,
    );
  }

  factory ProcessedResult.redirect(String redirectUrl) {
    return ProcessedResult._(
      type: ResultType.redirect,
      redirectUrl: redirectUrl,
    );
  }
}

class BatchResult {
  final int totalProcessed;
  final int successCount;
  final int errorCount;
  final List<BatchItem> results;

  BatchResult({
    required this.totalProcessed,
    required this.successCount,
    required this.errorCount,
    required this.results,
  });
}

class BatchItem {
  final String id;
  final bool success;
  final dynamic data;
  final String? error;

  BatchItem({required this.id, required this.success, this.data, this.error});
}

// Custom exception for examples
class UnsupportedContentTypeException implements Exception {
  final String contentType;
  UnsupportedContentTypeException(this.contentType);

  @override
  String toString() => 'Unsupported content type: $contentType';
}

// Example audit handler for tracking requests
class _AuditHandler implements ResponseProcessor {
  final List<String> auditLog = [];

  @override
  void call(ResponseContext context) {
    final timestamp = DateTime.now().toIso8601String();
    final statusCode = context.apiResponse.statusCode;
    auditLog.add('$timestamp: Response received with status $statusCode');
  }
}

// Content type processor
class _ContentTypeProcessor implements ResponseProcessor {
  @override
  void call(ResponseContext context) {
    final contentType =
        context.apiResponse.headers['content-type'] ?? 'application/json';
    context.set('contentType', contentType);
  }
}

// Conditional JSON processor
class _ConditionalJsonProcessor implements ResponseProcessor {
  @override
  void call(ResponseContext context) {
    final contentType = context.get<String>('contentType')!;
    if (contentType.contains('application/json')) {
      // Only decode JSON for JSON content types
      final jsonString = utf8.decode(context.apiResponse.data);
      final jsonData = jsonDecode(jsonString);
      context.set('jsonData', jsonData);
    }
  }
}

// Logging processor
class _LoggingProcessor implements ResponseProcessor {
  final List<String> debugLog;

  _LoggingProcessor(this.debugLog);

  @override
  void call(ResponseContext context) {
    debugLog.add('Status: ${context.apiResponse.statusCode}');
    debugLog.add('Body length: ${context.apiResponse.data.length}');
    if (context.has('jsonData')) {
      final jsonData = context.get<Map<String, dynamic>>('jsonData')!;
      debugLog.add('JSON keys: ${jsonData.keys.join(', ')}');
    }
  }
}
