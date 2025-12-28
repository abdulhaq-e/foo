import 'dart:convert';
import 'dart:typed_data';
import 'package:api_tools/api_tools.dart';
import 'composite_response_handler_core.dart';

/// Extracts data from the response context that was stored by processors.
///
/// This extractor retrieves data that was previously stored in the context
/// by processors (like JsonDataProcessor) and optionally applies a
/// transformation function.
class ContextDataExtractor<T> implements DataExtractor<T> {
  final String _contextKey;
  final T Function(dynamic data)? _transformer;

  ContextDataExtractor(this._contextKey, [this._transformer]);

  @override
  T call(ResponseContext context) {
    final data = context.get(_contextKey);
    if (data == null) {
      throw StateError('No data found in context for key: $_contextKey');
    }
    return _transformer?.call(data) ?? data as T;
  }
}

/// Extracts data directly from the raw API response.
///
/// This extractor bypasses any processed context data and works directly
/// with the original response data and metadata.
class RawDataExtractor<T> implements DataExtractor<T> {
  final T Function(Uint8List data, APIResponse response) _decoder;

  RawDataExtractor(this._decoder);

  @override
  T call(ResponseContext context) {
    return _decoder(context.apiResponse.data, context.apiResponse);
  }

  /// Create an extractor that only uses the raw data bytes.
  static RawDataExtractor<T> simple<T>(T Function(Uint8List) decoder) {
    return RawDataExtractor<T>((data, _) => decoder(data));
  }
}

/// Extracts the complete API response without any transformation.
///
/// Useful when you need access to headers, status codes, and other metadata.
class ApiResponseExtractor implements DataExtractor<APIResponse> {
  @override
  APIResponse call(ResponseContext context) {
    return context.apiResponse;
  }
}

/// Creates data extractors from simple functions.
///
/// This factory makes it easy to create custom extractors without
/// implementing the DataExtractor interface.
class DataExtractorFactory {
  /// Create a data extractor from a function that works with the context.
  static DataExtractor<T> create<T>(T Function(ResponseContext) extractor) {
    return _FunctionDataExtractor<T>(extractor);
  }

  /// Create a data extractor that gets JSON data from context.
  static DataExtractor<Map<String, dynamic>> jsonMap([String key = 'jsonData']) {
    return ContextDataExtractor<Map<String, dynamic>>(key);
  }

  /// Create a data extractor that gets JSON list from context.
  static DataExtractor<List<dynamic>> jsonList([String key = 'jsonData']) {
    return ContextDataExtractor<List<dynamic>>(key);
  }

  /// Create a data extractor that decodes response as text.
  static DataExtractor<String> text() {
    return RawDataExtractor.simple<String>((data) => utf8.decode(data));
  }

  /// Create a data extractor that returns the raw API response.
  static DataExtractor<APIResponse> raw() {
    return ApiResponseExtractor();
  }
}

class _FunctionDataExtractor<T> implements DataExtractor<T> {
  final T Function(ResponseContext) _extractor;

  _FunctionDataExtractor(this._extractor);

  @override
  T call(ResponseContext context) => _extractor(context);
}