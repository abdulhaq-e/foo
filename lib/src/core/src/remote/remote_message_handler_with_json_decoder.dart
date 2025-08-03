import 'dart:convert';

import 'package:api_tools/api_tools.dart';

class RemoteMessageHandlerWithJsonDecoder<Message, Response> {
  final APIClient _apiClient;
  final Endpoint Function(Message message) _endpointBuilder;
  RemoteMessageHandlerWithJsonDecoder({
    required APIClient apiClient,
    required Endpoint Function(Message message) endpointBuilder,
  })  : _apiClient = apiClient,
        _endpointBuilder = endpointBuilder;

  Future<Response> call(Message message) async {
    final response = await this._apiClient.request(_endpointBuilder(message));
    return jsonDecode(utf8.decode(response.data)) as Response;
  }
}
