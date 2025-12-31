import 'package:api_tools/api_tools.dart';

Endpoint simpleCommandEndpointFactory({
  required String path,
  HttpMethod httpMethod = HttpMethod.post,
  dynamic data,
  Map<String, String> headers = const {},
}) {
  return Endpoint(
    path: path,
    httpMethod: httpMethod,
    data: data,
    headers: headers,
  );
}
