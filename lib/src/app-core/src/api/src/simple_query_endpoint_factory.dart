import 'package:api_tools/api_tools.dart';

Endpoint simpleQueryEndpointFactory({
  required String path,
  HttpMethod httpMethod = HttpMethod.get,
  Map<String, String> queryParameters = const {},
  Map<String, String> headers = const {},
}) {
  return Endpoint(
    path: path,
    httpMethod: httpMethod,
    queryParameters: queryParameters,
    headers: headers,
  );
}
