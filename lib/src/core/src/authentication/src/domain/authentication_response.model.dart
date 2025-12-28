import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'authentication_response.model.freezed.dart';
part 'authentication_response.model.g.dart';

@freezed
abstract class AuthenticationResponse with _$AuthenticationResponse {
  const factory AuthenticationResponse({
    required String token,
    required String saasTenantEntityId,
    @Default(null) Object? additionalData,
  }) = _AuthenticationResponse;

  factory AuthenticationResponse.fromJson(Map<String, Object?> json) =>
      _$AuthenticationResponseFromJson(json);
}
