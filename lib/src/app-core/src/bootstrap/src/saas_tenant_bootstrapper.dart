import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

class SaasTenantBootstrapper {
  final void Function(String text) onLoadingTextUpdate;
  final void Function(SaasTenantBranding tenant) onTenantInfoUpdate;
  final void Function(String error) onLoadingError;
  final SaasTenantResolutionPriority priority;
  final int millisecondsDelay;

  const SaasTenantBootstrapper({
    required this.onLoadingTextUpdate,
    required this.onTenantInfoUpdate,
    required this.onLoadingError,
    required this.priority,
    this.millisecondsDelay = 500,
  });

  Future<SaasTenantBranding> resolveTenant(DotEnv env) async {
    try {
      onLoadingTextUpdate('Resolving workspace...');

      final queryHandler = const SaasTenantQueryHandlerFactory()
          .createQueryHandler(env);

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

      await Future<void>.delayed(Duration(milliseconds: millisecondsDelay));

      return tenant;
    } catch (error) {
      onLoadingError('Unable to load workspace: ${error.toString()}');
      rethrow;
    }
  }
}
