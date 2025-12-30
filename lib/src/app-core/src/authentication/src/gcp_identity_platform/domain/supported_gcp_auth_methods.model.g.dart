// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supported_gcp_auth_methods.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OIDCProvider _$OIDCProviderFromJson(Map<String, dynamic> json) =>
    _OIDCProvider(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      parameters: Map<String, String>.from(json['parameters'] as Map),
    );

_SupportedGCPAuthMethods _$SupportedGCPAuthMethodsFromJson(
  Map<String, dynamic> json,
) => _SupportedGCPAuthMethods(
  emailPasswordEnabled: json['emailPasswordEnabled'] as bool,
  oidcProviders: (json['oidcProviders'] as List<dynamic>)
      .map((e) => OIDCProvider.fromJson(e as Map<String, dynamic>))
      .toList(),
  tenantId: json['tenantId'] as String,
);
