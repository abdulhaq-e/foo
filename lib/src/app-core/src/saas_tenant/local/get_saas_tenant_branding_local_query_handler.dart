import 'package:foo/core.dart';

GetSaasTenantBrandingQueryHandling getSaasTenantBrandingLocalQueryHandler({
  required String tenantName,
  required String description,
  String? logoUrl,
  SaasTenantBrandingColors? colors,
  int testingSleep = 0,
}) {
  Future<SaasTenantBranding> handle(GetSaasTenantBrandingQuery query) async {
    await Future.delayed(Duration(seconds: testingSleep));
    return SaasTenantBranding(
      tenantName: tenantName,
      description: description,
      logoUrl: logoUrl,
      colors: colors,
    );
  }

  return handle;
}
