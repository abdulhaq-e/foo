import 'dart:convert';
import 'dart:typed_data';
import '../composite_response_handler_core.dart';
import '../composite_response_handler_exceptions.dart';

/// Handles RFC 7807 Problem Details error responses.
///
/// This handler specifically looks for error status codes and attempts
/// to parse the response body as a Problem Details object. If successful,
/// it throws a [ProblemDetailsException] with structured error information.
///
/// Example:
/// ```dart
/// // Default error status codes
/// final handler = ProblemDetailsHandler();
///
/// // Custom error status codes
/// final handler = ProblemDetailsHandler(errorStatusCodes: {400, 401, 403});
/// ```
class ProblemDetailsProcessor implements ResponseProcessor {
  final Set<int> _errorStatusCodes;

  ProblemDetailsProcessor({Set<int>? errorStatusCodes})
    : _errorStatusCodes =
          errorStatusCodes ??
          {400, 401, 403, 404, 409, 422, 429, 500, 502, 503};

  @override
  void call(ResponseContext context) {
    final response = context.apiResponse;
    if (_errorStatusCodes.contains(response.statusCode)) {
      try {
        final problemDetails = _parseProblemDetails(response.data);
        throw ProblemDetailsException(problemDetails, response.statusCode);
      } catch (e) {
        if (e is ProblemDetailsException) rethrow;
        // If we can't parse as Problem Details, fall back to generic exception
        throw HttpStatusException(response.statusCode, response);
      }
    }
  }

  Map<String, dynamic> _parseProblemDetails(Uint8List data) {
    final jsonString = utf8.decode(data);
    final json = jsonDecode(jsonString) as Map<String, dynamic>;

    // Validate it looks like Problem Details (has at least 'type' or 'title')
    if (!json.containsKey('type') && !json.containsKey('title')) {
      throw FormatException('Not a valid Problem Details response');
    }

    return json;
  }
}
