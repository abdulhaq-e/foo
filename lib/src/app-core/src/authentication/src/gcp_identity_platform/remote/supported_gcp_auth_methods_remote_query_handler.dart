import 'dart:typed_data';

import 'package:api_tools/api_tools.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

import '../internal.dart';

SupportedGCPAuthMethodsQueryHandler supportedGCPAuthMethodsRemoteQueryHandler(
  APIClient apiClient,
) {
  Future<SupportedGCPAuthMethods> handle(
    SupportedGCPAuthMethodsQuery query,
  ) async {
    final apiResponse =
        await JsonRemoteMessageHandlerHelper.createGenericApiHandlerForLists(
          apiClient: apiClient,
          fromJsonT: SaasTenantAuthPlatform.fromJson,
          fromJsonM: DefaultResponseMetadata.fromJson,
          endpointBuilder: (SupportedGCPAuthMethodsQuery query) =>
              simpleQueryEndpointFactory(
                path: 'api/queries/v1/saas-tenancy/auth-platforms',
                queryParameters: {"domain": query.saasTenantDomain},
              ),
        )(query);
    SaasTenantAuthPlatform? gcpAuthPlatform = apiResponse.data
        .where((e) => e.platformName == "GCP_IDENTITY_PLATFORM")
        .firstOrNull;
    if (gcpAuthPlatform == null) {
      throw Exception("SaasTenant does not support GCP_IDENTITY_PLATFORM");
    }

    try {
      return SupportedGCPAuthMethods.fromJson(gcpAuthPlatform.config);
    } catch (e) {
      throw e;
    }
  }

  return handle;
}
