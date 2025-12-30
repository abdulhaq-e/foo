import 'package:foo/app-core.dart';

class SaasTenantDomainResolver {
  final String? _domainFromEnv;
  final SaasTenantResolutionPriority _priority;

  SaasTenantDomainResolver({
    required String? domainFromEnv,
    required SaasTenantResolutionPriority priority,
  }) : _domainFromEnv = domainFromEnv,
       _priority = priority;

  String resolveDomain() {
    return SaasTenantDomainResolutionUtility.resolveDomain(
      domainFromEnv: _domainFromEnv,
      priority: _priority,
    );
  }
}
