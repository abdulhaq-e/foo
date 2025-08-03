import 'dart:convert';
import 'dart:typed_data';

import 'package:api_tools/api_tools.dart';
import 'package:foo/core.dart';

class SimpleResponseHandler<Response> {
  Response Function(Uint8List data) decoder;
  SimpleResponseHandler({required this.decoder});

  Response call(APIResponse apiResponse) {
    var statusCode = apiResponse.statusCode;
    if (200 > statusCode || statusCode > 299) {
      throw Exception();
    }

    return decoder(apiResponse.data);
  }

  static List<dynamic> decodeJsonToList(Uint8List data) {
    return jsonDecode(utf8.decode(data)) as List;
  }

  static dynamic decodeJsonToMap(Uint8List data) {
    return jsonDecode(utf8.decode(data)) as Map<String, Object?>;
  }
}

class SimpleResponseHandlerWithSpecialDecoder<Response> {
  Response Function(Uint8List data, APIResponse apiResponse) decoder;
  SimpleResponseHandlerWithSpecialDecoder({required this.decoder});

  Response call(APIResponse apiResponse) {
    var statusCode = apiResponse.statusCode;
    if (200 > statusCode || statusCode > 299) {
      throw Exception();
    }

    return decoder(apiResponse.data, apiResponse);
  }
}

class SimpleRemoteMessageHandler<Message, Response> {
  final APIClient apiClient;
  final Response Function(Uint8List data) decoder;
  final Endpoint Function(Message message) endpointBuilder;

  SimpleRemoteMessageHandler({
    required this.apiClient,
    required this.decoder,
    required this.endpointBuilder,
  });

  Future<Response> call(Message message) async {
    final responseHandler = SimpleResponseHandler<Response>(decoder: decoder);
    final handler = RemoteMessageHandler<Message, Response>(
        apiClient: apiClient,
        responseHandler: responseHandler,
        endpointBuilder: endpointBuilder);
    return handler(message);
  }
}

class SimpleRemoteMessageHandlerWithSpecialDecoder<Message, Response> {
  final APIClient apiClient;
  final Response Function(Uint8List data, APIResponse apiResponse) decoder;
  final Endpoint Function(Message message) endpointBuilder;

  SimpleRemoteMessageHandlerWithSpecialDecoder({
    required this.apiClient,
    required this.decoder,
    required this.endpointBuilder,
  });

  Future<Response> call(Message message) async {
    final responseHandler =
        SimpleResponseHandlerWithSpecialDecoder<Response>(decoder: decoder);
    final handler = RemoteMessageHandler<Message, Response>(
        apiClient: apiClient,
        responseHandler: responseHandler,
        endpointBuilder: endpointBuilder);
    return handler(message);
  }
}
