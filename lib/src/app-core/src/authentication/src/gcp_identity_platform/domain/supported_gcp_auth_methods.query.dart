import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supported_gcp_auth_methods.query.freezed.dart';
part 'supported_gcp_auth_methods.query.g.dart';

@Freezed(fromJson: true, toJson: false)
abstract class SupportedGCPAuthMethodsQuery
    with _$SupportedGCPAuthMethodsQuery {
  const factory SupportedGCPAuthMethodsQuery({
    required String saasTenantDomain,
  }) = _SupportedGCPAuthMethodsQuery;

  factory SupportedGCPAuthMethodsQuery.fromJson(Map<String, dynamic> json) =>
      _$SupportedGCPAuthMethodsQueryFromJson(json);
}
