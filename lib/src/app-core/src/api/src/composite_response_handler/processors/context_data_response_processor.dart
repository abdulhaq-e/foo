import '../composite_response_handler_core.dart';

/// Extracts data from the response context that was stored by previous handlers.
///
/// This handler retrieves data that was previously stored in the context
/// by other handlers (like [JsonDataHandler]) and optionally applies a
/// transformation function.
///
/// Example:
/// ```dart
/// // Simple extraction
/// final handler = ContextDataHandler<Map<String, dynamic>>('jsonData');
///
/// // With transformation
/// final handler = ContextDataHandler<String>('jsonData', (data) {
///   final map = data as Map<String, dynamic>;
///   return map['message'] as String;
/// });
/// ```
class ContextDataHandler<T> implements ResponseProcessor {
  final String _contextKey;
  final T Function(dynamic data)? _transformer;

  ContextDataHandler(this._contextKey, [this._transformer]);

  @override
  T call(ResponseContext context) {
    final data = context.get(_contextKey);
    if (data == null) {
      throw StateError('No data found in context for key: $_contextKey');
    }
    return _transformer?.call(data) ?? data as T;
  }
}
