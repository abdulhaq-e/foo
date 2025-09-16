import 'dart:convert';
import 'package:api_tools/api_tools.dart';

/// Exception thrown when an HTTP response has an unexpected status code.
///
/// Contains the status code and the full API response for detailed error handling.
class HttpStatusException implements Exception {
  /// The HTTP status code that caused the exception.
  final int statusCode;

  /// The full API response for detailed error information.
  final APIResponse response;

  HttpStatusException(this.statusCode, this.response);

  @override
  String toString() => 'HTTP $statusCode: ${utf8.decode(response.data)}';
}

/// Exception thrown when JSON decoding fails.
///
/// This typically occurs when:
/// - Response body is not valid JSON
/// - Response claims to be JSON but contains malformed data
/// - Encoding issues prevent proper JSON parsing
class JsonDecodingException implements Exception {
  /// Description of the JSON decoding error.
  final String message;

  JsonDecodingException(this.message);

  @override
  String toString() => 'JsonDecodingException: $message';
}

/// Exception for RFC 7807 Problem Details responses.
///
/// Problem Details is a standard way to carry machine-readable details
/// of errors in HTTP response bodies. This exception provides easy access
/// to all standard Problem Details fields.
///
/// See: https://tools.ietf.org/html/rfc7807
class ProblemDetailsException implements Exception {
  /// The complete Problem Details object as received from the API.
  final Map<String, dynamic> problemDetails;

  /// The HTTP status code associated with this problem.
  final int statusCode;

  ProblemDetailsException(this.problemDetails, this.statusCode);

  /// A URI reference that identifies the problem type.
  ///
  /// When dereferenced, it should provide human-readable documentation
  /// for the problem type.
  String? get type => problemDetails['type'] as String?;

  /// A short, human-readable summary of the problem type.
  ///
  /// It SHOULD NOT change from occurrence to occurrence of the problem,
  /// except for purposes of localization.
  String? get title => problemDetails['title'] as String?;

  /// A human-readable explanation specific to this occurrence of the problem.
  String? get detail => problemDetails['detail'] as String?;

  /// A URI reference that identifies the specific occurrence of the problem.
  ///
  /// It may or may not yield further information if dereferenced.
  String? get instance => problemDetails['instance'] as String?;

  @override
  String toString() {
    final buffer = StringBuffer('ProblemDetailsException: ');
    if (title != null) buffer.write(title);
    if (detail != null) buffer.write(' - $detail');
    return buffer.toString();
  }
}