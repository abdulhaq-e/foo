import 'dart:async';
import 'package:under_chamber/app/src/dependencies/saas_tenant/saas_tenant_domain_resolution_utility.dart';
import 'package:under_chamber/core/core.dart';

class SaasTenantBrandingResolverException implements Exception {
  final String message;
  SaasTenantBrandingResolverException(this.message);

  @override
  String toString() => 'SaasTenantResolverException: $message';
}

class SaasTenantBrandingResolver {
  final GetSaasTenantBrandingQueryHandling _queryHandler;
  final String? _domainFromEnv;
  final SaasTenantResolutionPriority _priority;

  SaasTenantBrandingResolver({
    required GetSaasTenantBrandingQueryHandling queryHandler,
    required String? domainFromEnv,
    required SaasTenantResolutionPriority priority,
  }) : _queryHandler = queryHandler,
       _domainFromEnv = domainFromEnv,
       _priority = priority;

  Future<SaasTenantBranding> resolveTenantBranding() async {
    try {
      final saasTenantDomain = SaasTenantDomainResolutionUtility.resolveDomain(
        domainFromEnv: _domainFromEnv,
        priority: _priority,
      );
      return await _resolve(saasTenantDomain);
    } catch (e) {
      throw SaasTenantBrandingResolverException(
        'Failed to resolve tenant: ${e.toString()}',
      );
    }
  }

  Future<SaasTenantBranding> _resolve(String saasTenantDomain) async {
    final query = GetSaasTenantBrandingQuery(
      saasTenantDomain: saasTenantDomain,
    );
    return await _queryHandler(query);
  }
}
