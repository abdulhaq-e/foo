// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saas_tenant_branding.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaasTenantBrandingColors _$SaasTenantBrandingColorsFromJson(
  Map<String, dynamic> json,
) => _SaasTenantBrandingColors(
  primary: const ColorJsonConverter().fromJson(json['primary'] as String?),
);

Map<String, dynamic> _$SaasTenantBrandingColorsToJson(
  _SaasTenantBrandingColors instance,
) => <String, dynamic>{
  'primary': const ColorJsonConverter().toJson(instance.primary),
};

_SaasTenantBranding _$SaasTenantBrandingFromJson(Map<String, dynamic> json) =>
    _SaasTenantBranding(
      tenantName: json['tenantName'] as String,
      description: json['description'] as String,
      logoUrl: json['logoUrl'] as String?,
      colors: json['colors'] == null
          ? null
          : SaasTenantBrandingColors.fromJson(
              json['colors'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SaasTenantBrandingToJson(_SaasTenantBranding instance) =>
    <String, dynamic>{
      'tenantName': instance.tenantName,
      'description': instance.description,
      'logoUrl': instance.logoUrl,
      'colors': instance.colors,
    };
