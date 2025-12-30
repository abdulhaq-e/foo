import 'package:flutter/foundation.dart';
import 'web_utils.dart';

enum SaasTenantResolutionPriority { env, host }

class SaasTenantDomainResolutionException implements Exception {
  final String message;
  SaasTenantDomainResolutionException(this.message);

  @override
  String toString() => 'SaasTenantDomainResolutionException: $message';
}

class SaasTenantDomainResolutionUtility {
  static String resolveDomain({
    required String? domainFromEnv,
    required SaasTenantResolutionPriority priority,
  }) {
    try {
      if (kIsWeb) {
        if (priority == SaasTenantResolutionPriority.env) {
          return _resolveFromEnv(domainFromEnv);
        }
        return _resolveFromHost();
      } else {
        return _resolveFromEnv(domainFromEnv);
      }
    } catch (e) {
      throw SaasTenantDomainResolutionException(
        'Failed to resolve domain: ${e.toString()}',
      );
    }
  }

  static String _resolveFromHost() {
    final hostname = window.location.hostname;
    if (hostname.isEmpty) {
      throw SaasTenantDomainResolutionException('Unable to determine hostname');
    }
    return hostname;
  }

  static String _resolveFromEnv(String? domainFromEnv) {
    if (domainFromEnv == null || domainFromEnv.isEmpty) {
      throw SaasTenantDomainResolutionException(
        'SAAS_TENANT_DOMAIN environment variable is required for non-web platforms',
      );
    }
    return domainFromEnv;
  }
}
