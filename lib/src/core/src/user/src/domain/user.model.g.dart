// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  userEntityId: json['userEntityId'] as String,
  name: json['name'] as String? ?? '',
  email: json['email'] as String,
  permissions: (json['permissions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  avatarUrl: json['avatarUrl'] as String?,
  additionalData: json['additionalData'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'userEntityId': instance.userEntityId,
  'name': instance.name,
  'email': instance.email,
  'permissions': instance.permissions,
  'avatarUrl': instance.avatarUrl,
  'additionalData': instance.additionalData,
};
