import 'package:api_tools/api_tools.dart';

/// Base interface for processors that transform/validate responses without returning data.
///
/// These processors typically:
/// - Validate status codes (throwing exceptions on error)
/// - Parse and store data in context for later extraction
/// - Transform or enrich the context data
abstract class ResponseProcessor {
  void call(ResponseContext context);
}

/// Interface for extracting final results from the response context.
///
/// Data extractors are the final step in the processing pipeline and
/// are responsible for taking processed data from the context and
/// returning it in the desired format.
abstract class DataExtractor<T> {
  T call(ResponseContext context);
}

/// Context object that flows through the response processing pipeline.
///
/// Contains the original API response and provides a shared data store
/// for processors to communicate with each other.
class ResponseContext {
  final APIResponse apiResponse;
  final Map<String, dynamic> _data = {};

  ResponseContext(this.apiResponse);

  /// Get data stored in the context by a previous processor.
  T? get<T>(String key) => _data[key] as T?;

  /// Store data in the context for use by subsequent processors.
  void set<T>(String key, T value) => _data[key] = value;

  /// Check if the context contains data for the given key.
  bool has(String key) => _data.containsKey(key);
}
