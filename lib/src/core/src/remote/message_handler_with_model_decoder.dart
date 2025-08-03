import 'dart:convert';

import 'package:foo/core.dart';
import 'package:api_tools/api_tools.dart';

import 'remote_message_handler.dart';

class MessageHandlerWithModelDecoder<Message, Model,
    R extends GenericAPIResponse<Model>> {
  MessageHandlerWithModelDecoder();

  Future<GenericAPIResponse<Model>> call(Message message) async {
    // final response = await this._apiClient.request(_endpointBuilder(message));
    // return jsonDecode(utf8.decode(response.data)) as Response;
  }
}

class RemoteMessageHandlerWithModelDecoder<Message, Response,
    R extends GenericAPIResponse<Response>> {
  final APIClient _apiClient;
  final Endpoint Function(Message message) _endpointBuilder;
  RemoteMessageHandlerWithModelDecoder({
    required APIClient apiClient,
    required Endpoint Function(Message message) endpointBuilder,
  })  : _apiClient = apiClient,
        _endpointBuilder = endpointBuilder;

  Future<GenericAPIResponse<Response>> call(Message message) async {
    final remoteMessageHandler = RemoteMessageHandler(
        apiClient: _apiClient,
        responseHandler: (apiResponse) {
          return GenericAPIResponse<Response>.fromJson(apiResponse.data);
        },
        endpointBuilder: _endpointBuilder);
    final response = await _remoteMessageHandler(message);
    // final response = await this._apiClient.request(_endpointBuilder(message));
    // return jsonDecode(utf8.decode(response.data)) as Response;
  }
}
