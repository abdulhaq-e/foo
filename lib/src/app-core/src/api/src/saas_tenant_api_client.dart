import 'package:api_tools/api_tools.dart';
import 'saas_tenant_entity_id_provider.dart';

class SaasTenantAPIClient extends APIClient {
  APIClient client;
  SaasTenantEntityIdProvider tenantProvider;
  String tenantHeaderKey;

  SaasTenantAPIClient({
    required this.client,
    required this.tenantProvider,
    this.tenantHeaderKey = "SAAS_TENANT_ENTITY_ID",
  });
  @override
  Future<APIResponse> request(Endpoint endpoint) async {
    final tenantId = await tenantProvider.getTenantId();
    Map<String, String> headers = {
      ...endpoint.headers,
      this.tenantHeaderKey: '$tenantId'
    };
    return client.request(endpoint.copyWith(headers: headers));
  }

  @override
  Future<APIResponse> requestMultipart(EndpointMultipart endpoint) async {
    final tenantId = await tenantProvider.getTenantId();
    Map<String, String> headers = {
      ...endpoint.headers,
      this.tenantHeaderKey: '$tenantId'
    };
    return client.requestMultipart(endpoint.copyWith(headers: headers));
  }
}
