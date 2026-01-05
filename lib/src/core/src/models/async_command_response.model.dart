import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_command_response.model.freezed.dart';
part 'async_command_response.model.g.dart';

/// Response for commands that return 202 Accepted with an operationId.
///
/// When a command is submitted and the backend needs to process it asynchronously,
/// it will return HTTP 202 with this response containing the operation ID
/// that can be used to poll for the operation status.
@freezed
abstract class AsyncCommandResponse with _$AsyncCommandResponse {
  const factory AsyncCommandResponse({required String operationId}) =
      _AsyncCommandResponse;

  factory AsyncCommandResponse.fromJson(Map<String, dynamic> json) =>
      _$AsyncCommandResponseFromJson(json);
}
