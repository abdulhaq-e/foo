import 'package:api_tools/api_tools.dart';

Endpoint simpleCommandEndpointFactory({
  required String path,
  HttpMethod httpMethod = HttpMethod.post,
  dynamic data,
}) {
  return Endpoint(path: path, httpMethod: httpMethod, data: data);
}
