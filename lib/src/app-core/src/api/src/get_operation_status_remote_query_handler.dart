import 'package:api_tools/api_tools.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

/// Factory function that creates a query handler for fetching operation status.
///
/// This handler queries the operation status endpoint using the provided
/// operation ID and returns the parsed [OperationStatus] response.
///
/// ## Usage
///
/// ```dart
/// final queryHandler = getOperationStatusQueryHandlerFactory(
///   apiClient: apiClient,
/// );
///
/// final status = await queryHandler('operation-123');
/// ```
QueryHandling<String, OperationStatus>
getOperationStatusRemoteQueryHandlerFactory({required APIClient apiClient}) {
  Future<OperationStatus> handle(String operationId) async {
    return JsonRemoteMessageHandlerHelper.createApiHandlerForSingularItem(
      apiClient: apiClient,
      fromJsonT: (json) => OperationStatus.fromJson(json),
      endpointBuilder: (String operationId) {
        final path = 'api/operations/${operationId}/status';
        return simpleQueryEndpointFactory(path: path);
      },
    )(operationId);
  }

  return handle;
}
