import 'package:api_tools/api_tools.dart';

class RemoteMessageHandler<Message, Response> {
  final APIClient _apiClient;
  final Response Function(APIResponse apiResponse) _responseHandler;
  final Endpoint Function(Message message) _endpointBuilder;
  RemoteMessageHandler({
    required APIClient apiClient,
    required Response Function(APIResponse apiResponse) responseHandler,
    required Endpoint Function(Message message) endpointBuilder,
  })  : _apiClient = apiClient,
        _endpointBuilder = endpointBuilder,
        _responseHandler = responseHandler;

  Future<Response> call(Message message) async {
    final response = await this._apiClient.request(_endpointBuilder(message));
    return _responseHandler(response);
  }
}
