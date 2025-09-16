import 'dart:convert';
import 'dart:typed_data';
import 'package:api_tools/api_tools.dart';

import 'composite_response_handler_core.dart';
import 'data_extractors.dart';
import 'processors/problem_details_response_processor.dart';
import 'processors/status_code_response_processor.dart';
import 'processors/json_data_response_processor.dart';

/// Composite response handler that processes responses through a pipeline.
///
/// Executes processing steps in sequence, then extracts the final result.
/// This separates data processing (validation, transformation) from data
/// extraction, making the pipeline more predictable and easier to understand.
class CompositeResponseHandler<T> {
  final List<ResponseProcessor> _processors;
  final DataExtractor<T> _extractor;

  CompositeResponseHandler({
    required List<ResponseProcessor> processors,
    required DataExtractor<T> extractor,
  }) : _processors = processors,
       _extractor = extractor;

  T call(APIResponse apiResponse) {
    final context = ResponseContext(apiResponse);

    // Execute all processors in sequence
    for (final processor in _processors) {
      processor(context);
    }

    // Extract the final result
    return _extractor(context);
  }
}

/// Factory class for creating common response handler patterns.
///
/// Provides pre-configured handlers for typical API response scenarios.
/// These factory methods handle the most common use cases and can serve
/// as starting points for custom implementations.
class CompositeResponseHandlers {
  /// Basic JSON response handler with 2xx status code validation.
  ///
  /// Perfect for simple REST APIs that return JSON data on success.
  /// Validates status codes in the 200-299 range and decodes JSON.
  ///
  /// Example:
  /// ```dart
  /// final handler = ResponseHandlers.jsonMap();
  /// final result = handler(ResponseContext(apiResponse));
  /// print(result['message']); // Access JSON data
  /// ```
  static CompositeResponseHandler<Map<String, dynamic>> jsonMap() {
    return CompositeResponseHandler<Map<String, dynamic>>(
      processors: [StatusCodeProcessor.ok200Range(), JsonDataProcessor()],
      extractor: DataExtractorFactory.jsonMap(),
    );
  }

  /// JSON response handler with RFC 7807 Problem Details error handling.
  ///
  /// Ideal for APIs that follow the Problem Details standard for error responses.
  /// Automatically parses and throws structured exceptions for error status codes.
  ///
  /// Example:
  /// ```dart
  /// final handler = ResponseHandlers.jsonMapWithProblemDetails();
  /// try {
  ///   final result = handler(ResponseContext(apiResponse));
  /// } on ProblemDetailsException catch (e) {
  ///   print('Error: ${e.title} - ${e.detail}');
  /// }
  /// ```
  static CompositeResponseHandler<Map<String, dynamic>>
  jsonMapWithProblemDetails() {
    return CompositeResponseHandler<Map<String, dynamic>>(
      processors: [
        ProblemDetailsProcessor(),
        StatusCodeProcessor.ok200Range(),
        JsonDataProcessor(),
      ],
      extractor: DataExtractorFactory.jsonMap(),
    );
  }

  /// JSON response handler with custom valid status codes.
  ///
  /// Useful for APIs that use non-standard success status codes or when you
  /// need to handle specific status codes differently.
  ///
  /// Example:
  /// ```dart
  /// // GraphQL APIs often return 200 even for errors
  /// final handler = ResponseHandlers.jsonMapWithCustomStatus({200});
  ///
  /// // Accept multiple status codes
  /// final handler = ResponseHandlers.jsonMapWithCustomStatus({200, 201, 202});
  /// ```
  static CompositeResponseHandler<Map<String, dynamic>> jsonMapWithCustomStatus(
    Set<int> validStatusCodes,
  ) {
    return CompositeResponseHandler<Map<String, dynamic>>(
      processors: [
        ProblemDetailsProcessor(),
        StatusCodeProcessor.specific(validStatusCodes),
        JsonDataProcessor(),
      ],
      extractor: DataExtractorFactory.jsonMap(),
    );
  }

  /// Raw API response handler with no processing.
  ///
  /// Returns the original [APIResponse] without any validation or transformation.
  /// Useful for low-level processing or when you need access to headers and metadata.
  ///
  /// Example:
  /// ```dart
  /// final handler = ResponseHandlers.raw();
  /// final response = handler(ResponseContext(apiResponse));
  /// print(response.headers); // Access response headers
  /// print(response.statusCode); // Access status code
  /// ```
  static CompositeResponseHandler<APIResponse> raw() {
    return CompositeResponseHandler<APIResponse>(
      processors: [],
      extractor: DataExtractorFactory.raw(),
    );
  }

  /// Text response handler with status validation.
  ///
  /// Decodes the response body as UTF-8 text and validates 2xx status codes.
  /// Perfect for plain text APIs or when you need the raw text content.
  ///
  /// Example:
  /// ```dart
  /// final handler = ResponseHandlers.text();
  /// final content = handler(ResponseContext(apiResponse));
  /// print(content); // Raw text content
  /// ```
  static CompositeResponseHandler<String> text() {
    return CompositeResponseHandler<String>(
      processors: [StatusCodeProcessor.ok200Range()],
      extractor: DataExtractorFactory.text(),
    );
  }

  /// Create a custom response handler with your own configuration.
  ///
  /// Provides maximum flexibility while still using the composable architecture.
  /// You can specify your own preprocessors and final handler.
  ///
  /// Example:
  /// ```dart
  /// final handler = ResponseHandlers.custom<User>(
  ///   processors: [
  ///     StatusCodeProcessor.specific({200, 201}),
  ///     JsonDataProcessor(),
  ///     CustomValidationProcessor(),
  ///   ],
  ///   extractor: DataExtractorFactory.create<User>((context) {
  ///     final jsonData = context.get<Map<String, dynamic>>('jsonData')!;
  ///     return User.fromJson(jsonData);
  ///   }),
  /// );
  /// ```
  static CompositeResponseHandler<T> custom<T>({
    List<ResponseProcessor>? processors,
    required DataExtractor<T> extractor,
  }) {
    return CompositeResponseHandler<T>(
      processors: processors ?? [StatusCodeProcessor.ok200Range()],
      extractor: extractor,
    );
  }
}
