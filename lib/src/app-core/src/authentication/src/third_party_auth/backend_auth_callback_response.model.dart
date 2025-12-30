import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'backend_auth_callback_response.model.freezed.dart';
part 'backend_auth_callback_response.model.g.dart';

@Freezed(fromJson: true, toJson: true)
abstract class BackendAuthCallbackResponse with _$BackendAuthCallbackResponse {
  const factory BackendAuthCallbackResponse({
    required String saasTenantEntityId,
  }) = _BackendAuthCallbackResponse;

  factory BackendAuthCallbackResponse.fromJson(Map<String, Object?> json) =>
      _$BackendAuthCallbackResponseFromJson(json);
}
