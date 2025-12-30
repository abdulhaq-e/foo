import 'dart:convert';

import 'package:api_tools/api_tools.dart';
import 'package:foo/app-core.dart';

import 'backend_auth_callback_response.model.dart';

BackendAuthCallbackCommandHandling backendAuthCallbackRemoteCommandHandler(
  APIClient apiClient,
) {
  Future<BackendAuthCallbackResponse> handle(
    BackendAuthCallbackCommand command,
  ) async {
    final apiResponse =
        await JsonRemoteMessageHandlerHelper.createApiHandlerForSingularItem(
          apiClient: apiClient,
          fromJsonT: BackendAuthCallbackResponse.fromJson,
          endpointBuilder: (BackendAuthCallbackCommand command) =>
              simpleCommandEndpointFactory(
                path: 'api/v1/auth/callback',
                data: jsonEncode(command.toJson()),
              ),
        )(command);

    return apiResponse;
  }

  return handle;
}
