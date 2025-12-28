// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthenticationResponse _$AuthenticationResponseFromJson(
  Map<String, dynamic> json,
) => _AuthenticationResponse(
  token: json['token'] as String,
  saasTenantEntityId: json['saasTenantEntityId'] as String,
  additionalData: json['additionalData'] ?? null,
);

Map<String, dynamic> _$AuthenticationResponseToJson(
  _AuthenticationResponse instance,
) => <String, dynamic>{
  'token': instance.token,
  'saasTenantEntityId': instance.saasTenantEntityId,
  'additionalData': instance.additionalData,
};
