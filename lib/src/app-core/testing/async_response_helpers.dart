import 'dart:convert';
import 'package:api_tools/api_tools.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

/// Helper for creating async command responses (HTTP 202) for testing.
class AsyncResponseHelpers {
  /// Creates an HTTP 202 Accepted response with an operation ID.
  static APIResponse accepted(String operationId) {
    final json = {'operationId': operationId};
    return APIResponse(
      data: utf8.encode(jsonEncode(json)),
      statusCode: 202,
      headers: {},
    );
  }

  /// Creates an operation status response for polling endpoint.
  static APIResponse operationStatus({
    required OperationStatusValue status,
    Map<String, dynamic>? data,
    Map<String, dynamic>? error,
  }) {
    final json = {
      'status': status.name,
      if (data != null) 'data': data,
      if (error != null) 'error': error,
    };
    return APIResponse(
      data: utf8.encode(jsonEncode(json)),
      statusCode: 200,
      headers: {},
    );
  }

  /// Creates a pending operation status response.
  static APIResponse pending() {
    return operationStatus(status: OperationStatusValue.pending);
  }

  /// Creates a successful operation status response.
  static APIResponse success([Map<String, dynamic>? data]) {
    return operationStatus(status: OperationStatusValue.success, data: data);
  }

  /// Creates a failed operation status response.
  static APIResponse failed([Map<String, dynamic>? error]) {
    return operationStatus(
      status: OperationStatusValue.failed,
      error: error ?? {'message': 'Operation failed'},
    );
  }
}
