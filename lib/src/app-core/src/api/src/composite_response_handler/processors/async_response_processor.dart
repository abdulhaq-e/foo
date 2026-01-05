import '../composite_response_handler_core.dart';

/// Processor that detects HTTP 202 Accepted responses and marks them in the context.
///
/// This processor should be placed early in the processor chain (before JsonDataProcessor)
/// to allow the data extractor to determine whether to parse the response as an
/// [AsyncCommandResponse] or a normal response type.
///
/// When a 202 status code is detected, this processor sets a flag in the response context
/// that can be checked by the data extractor to return the appropriate response type.
///
/// ## Usage
///
/// ```dart
/// final handler = CompositeResponseHandler<dynamic>(
///   processors: [
///     ProblemDetailsProcessor(),
///     AsyncResponseProcessor(), // Detect 202 before validating status
///     StatusCodeProcessor.ok200Range(),
///     JsonDataProcessor(),
///   ],
///   extractor: DataExtractorFactory.create((context) {
///     final jsonData = context.get("jsonData");
///     final isAsync = context.get("isAsyncOperation") ?? false;
///
///     if (isAsync) {
///       return AsyncCommandResponse.fromJson(jsonData);
///     } else {
///       return NormalResponse.fromJson(jsonData);
///     }
///   }),
/// );
/// ```
class AsyncResponseProcessor implements ResponseProcessor {
  @override
  void call(ResponseContext context) {
    if (context.apiResponse.statusCode == 202) {
      context.set('isAsyncOperation', true);
    }
  }
}
