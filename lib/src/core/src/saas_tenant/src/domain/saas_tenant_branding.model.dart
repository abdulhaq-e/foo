import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_ui/material_ui.dart';

part 'saas_tenant_branding.model.freezed.dart';
part 'saas_tenant_branding.model.g.dart';

class ColorJsonConverter implements JsonConverter<Color?, String?> {
  const ColorJsonConverter();

  @override
  Color? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;

    try {
      final hexString = json.replaceFirst('#', '');
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) {
        buffer.write('ff');
      }
      buffer.write(hexString);
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return null;
    }
  }

  @override
  String? toJson(Color? color) {
    if (color == null) return null;
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
  }
}

@Freezed(fromJson: true, toJson: true)
abstract class SaasTenantBrandingColors with _$SaasTenantBrandingColors {
  const factory SaasTenantBrandingColors({
    @ColorJsonConverter() Color? primary,
  }) = _SaasTenantBrandingColors;

  factory SaasTenantBrandingColors.fromJson(Map<String, dynamic> json) =>
      _$SaasTenantBrandingColorsFromJson(json);
}

@Freezed(fromJson: true, toJson: true)
abstract class SaasTenantBranding with _$SaasTenantBranding {
  const factory SaasTenantBranding({
    required String tenantName,
    required String description,
    String? logoUrl,
    SaasTenantBrandingColors? colors,
  }) = _SaasTenantBranding;

  factory SaasTenantBranding.fromJson(Map<String, dynamic> json) =>
      _$SaasTenantBrandingFromJson(json);
}
