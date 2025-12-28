import 'dart:convert';
import 'dart:typed_data';
import '../composite_response_handler_core.dart';
import '../composite_response_handler_exceptions.dart';

class JsonDataProcessor implements ResponseProcessor {
  final String _contextKey;

  JsonDataProcessor({String contextKey = 'jsonData'})
    : _contextKey = contextKey;

  @override
  void call(ResponseContext context) {
    try {
      final jsonString = utf8.decode(context.apiResponse.data);
      final jsonData = jsonDecode(jsonString);
      context.set(_contextKey, jsonData);
    } catch (e) {
      throw JsonDecodingException('Failed to decode JSON response: $e');
    }
  }

  static Map<String, dynamic> decodeToMap(Uint8List data) {
    return jsonDecode(utf8.decode(data)) as Map<String, dynamic>;
  }

  static List<dynamic> decodeToList(Uint8List data) {
    return jsonDecode(utf8.decode(data)) as List<dynamic>;
  }
}
