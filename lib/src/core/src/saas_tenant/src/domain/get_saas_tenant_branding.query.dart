import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_saas_tenant_branding.query.freezed.dart';
part 'get_saas_tenant_branding.query.g.dart';

@Freezed(fromJson: true, toJson: true)
abstract class GetSaasTenantBrandingQuery with _$GetSaasTenantBrandingQuery {
  const factory GetSaasTenantBrandingQuery({required String saasTenantDomain}) =
      _GetSaasTenantBrandingQuery;

  factory GetSaasTenantBrandingQuery.fromJson(Map<String, dynamic> json) =>
      _$GetSaasTenantBrandingQueryFromJson(json);
}
