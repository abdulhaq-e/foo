import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:under_chamber/app/src/dependencies/dependency_factory.dart';
import 'package:under_chamber/app/src/dependencies/saas_tenant/saas_tenant_branding_resolver.dart';
import 'package:under_chamber/app/src/dependencies/saas_tenant/saas_tenant_domain_resolution_utility.dart';
import 'package:under_chamber/app/src/dependencies/saas_tenant/saas_tenant_query_handler_factory.dart';
import 'package:under_chamber/core/core.dart';

class SaasTenantBootstrapper {
  final void Function(String text) onLoadingTextUpdate;
  final void Function(SaasTenantBranding tenant) onTenantInfoUpdate;
  final void Function(String error) onLoadingError;

  const SaasTenantBootstrapper({
    required this.onLoadingTextUpdate,
    required this.onTenantInfoUpdate,
    required this.onLoadingError,
  });

  Future<SaasTenantBranding> resolveTenant(DotEnv env) async {
    try {
      onLoadingTextUpdate('Resolving workspace...');

      SaasTenantResolutionPriority priority =
          DependencyFactory.parseSaasTenantResolutionPriority(env);

      final queryHandler =
          const SaasTenantQueryHandlerFactory().createQueryHandler(env);

      String domainFromEnv = env.get('SAAS_TENANT_DOMAIN', fallback: '');
      final tenantBrandingResolver = SaasTenantBrandingResolver(
        queryHandler: queryHandler,
        domainFromEnv: domainFromEnv.isNotEmpty ? domainFromEnv : null,
        priority: priority,
      );

      onLoadingTextUpdate('Loading workspace configuration...');

      final tenant = await tenantBrandingResolver.resolveTenantBranding();

      onTenantInfoUpdate(tenant);
      onLoadingTextUpdate('Preparing ${tenant.tenantName}...');

      await Future.delayed(Duration(milliseconds: 800));

      return tenant;
    } catch (error) {
      onLoadingError('Unable to load workspace: ${error.toString()}');
      rethrow;
    }
  }
}
