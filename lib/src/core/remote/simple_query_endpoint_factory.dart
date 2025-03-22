import 'package:api_tools/api_tools.dart';

Endpoint simpleQueryEndpointFactory({
  required String path,
  HttpMethod httpMethod = HttpMethod.get,
  Map<String, String> queryParameters = const {},
}) {
  return Endpoint(
    path: path,
    httpMethod: httpMethod,
    queryParameters: queryParameters,
  );
}
