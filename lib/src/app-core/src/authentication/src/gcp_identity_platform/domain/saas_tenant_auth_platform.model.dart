import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saas_tenant_auth_platform.model.freezed.dart';
part 'saas_tenant_auth_platform.model.g.dart';

@Freezed(fromJson: true, toJson: true)
abstract class SaasTenantAuthPlatform with _$SaasTenantAuthPlatform {
  const factory SaasTenantAuthPlatform({
    required Map<String, Object?> config,
    required String platformName,
  }) = _SaasTenantAuthPlatform;

  factory SaasTenantAuthPlatform.fromJson(Map<String, dynamic> json) =>
      _$SaasTenantAuthPlatformFromJson(json);
}
