import 'dart:convert';

import 'package:api_tools/api_tools.dart';
import 'package:foo/core.dart';
import 'package:under_chamber/app/src/dependencies/authentication/third_party_auth/third_party_auth.dart';

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
