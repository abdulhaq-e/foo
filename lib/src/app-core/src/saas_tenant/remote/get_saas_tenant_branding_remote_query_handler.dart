import 'dart:typed_data';

import 'package:api_tools/api_tools.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

GetSaasTenantBrandingQueryHandling getSaasTenantBrandingRemoteQueryHandler(
  APIClient apiClient,
) {
  Future<SaasTenantBranding> handle(GetSaasTenantBrandingQuery query) async {
    final apiResponse =
        await JsonRemoteMessageHandlerHelper.createGenericApiHandlerForSingularData(
          apiClient: apiClient,
          fromJsonT: (json) => SaasTenantBranding.fromJson(
            json["config"] as Map<String, Object?>,
          ),
          fromJsonM: DefaultResponseMetadata.fromJson,
          endpointBuilder: (GetSaasTenantBrandingQuery query) =>
              simpleQueryEndpointFactory(
                path: 'api/queries/v1/saas-tenancy/public-branding',
                queryParameters: {"domain": query.saasTenantDomain},
              ),
        )(query);

    return apiResponse.data;
  }

  return handle;
}
