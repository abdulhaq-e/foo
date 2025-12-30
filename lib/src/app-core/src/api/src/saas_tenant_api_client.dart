import 'package:api_tools/api_tools.dart';

class SaasTenantAPIClient extends APIClient {
  APIClient client;
  String tenant;
  String tenantHeaderKey;

  SaasTenantAPIClient({
    required this.client,
    required this.tenant,
    this.tenantHeaderKey = "SAAS_TENANT_ENTITY_ID",
  });
  @override
  Future<APIResponse> request(Endpoint endpoint) async {
    Map<String, String> headers = {
      ...endpoint.headers,
      this.tenantHeaderKey: '$tenant'
    };
    return client.request(endpoint.copyWith(headers: headers));
  }

  @override
  Future<APIResponse> requestMultipart(EndpointMultipart endpoint) async {
    Map<String, String> headers = {
      ...endpoint.headers,
      this.tenantHeaderKey: '$tenant'
    };
    return client.requestMultipart(endpoint.copyWith(headers: headers));
  }
}
