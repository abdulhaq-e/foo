import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supported_gcp_auth_methods.model.freezed.dart';
part 'supported_gcp_auth_methods.model.g.dart';

@Freezed(fromJson: true, toJson: false)
abstract class OIDCProvider with _$OIDCProvider {
  const factory OIDCProvider({
    required String id,
    required String name,
    required String type,
    required Map<String, String> parameters,
  }) = _OIDCProvider;

  factory OIDCProvider.fromJson(Map<String, dynamic> json) =>
      _$OIDCProviderFromJson(json);
}

@Freezed(fromJson: true, toJson: false)
abstract class SupportedGCPAuthMethods with _$SupportedGCPAuthMethods {
  const factory SupportedGCPAuthMethods({
    required bool emailPasswordEnabled,
    required List<OIDCProvider> oidcProviders,
    required String tenantId,
  }) = _SupportedGCPAuthMethods;

  factory SupportedGCPAuthMethods.fromJson(Map<String, dynamic> json) =>
      _$SupportedGCPAuthMethodsFromJson(json);
}
