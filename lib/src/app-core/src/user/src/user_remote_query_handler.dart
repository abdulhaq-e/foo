import 'package:api_tools/api_tools.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

UserQueryHandling userRemoteQueryHandler(APIClient apiClient) {
  Future<User> handle(_) async {
    final apiResponse =
        await JsonRemoteMessageHandlerHelper.createGenericApiHandlerForSingularData(
          apiClient: apiClient,
          fromJsonT: (json) => User.fromJson(json),
          fromJsonM: DefaultResponseMetadata.fromJson,
          endpointBuilder: (_) => simpleQueryEndpointFactory(
            path: "api/queries/v1/me/user/:profile",
          ),
        )(());

    return apiResponse.data;
  }

  return handle;
}
