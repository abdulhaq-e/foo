import 'package:flutter/material.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';
import 'package:foo/src/app-core/src/bootstrap/src/bootrap_context.dart';

class SaasTenantBootstrapper {
  const SaasTenantBootstrapper({
    required this.onLoadingTextUpdate,
    required this.onTenantInfoUpdate,
    required this.onLoadingError,
    this.millisecondsDelay = 500,
  });
  final void Function(String text) onLoadingTextUpdate;
  final void Function(SaasTenantBranding tenant) onTenantInfoUpdate;
  final void Function(String error) onLoadingError;
  final int millisecondsDelay;

  Future<void> bootstrap({required BootstrapContext bootrapContext}) async {
    final priority = bootrapContext.appConfig.domainResolutionPriority;
    try {
      onLoadingTextUpdate('Resolving workspace...');

      final queryHandler = _createQueryHandler(bootrapContext);

      final domainFromEnv = bootrapContext.appConfig.domainFromEnv;
      final tenantBrandingResolver = SaasTenantBrandingResolver(
        queryHandler: queryHandler,
        domainFromEnv: domainFromEnv,
        priority: priority,
      );

      onLoadingTextUpdate('Loading workspace configuration...');

      final saasTenantBranding = await tenantBrandingResolver.resolve();

      bootrapContext.serviceRegistry.register(saasTenantBranding);
      onTenantInfoUpdate(saasTenantBranding);
      onLoadingTextUpdate('Preparing ${saasTenantBranding.tenantName}...');

      await Future<void>.delayed(Duration(milliseconds: millisecondsDelay));
    } catch (error) {
      onLoadingError('Unable to load workspace: $error');
      rethrow;
    }
  }

  GetSaasTenantBrandingQueryHandling _createQueryHandler(
    BootstrapContext bootrapContext,
  ) {
    final env = bootrapContext.env;
    final handlerType = env.get('SAAS_TENANT_BRANDING_QUERY_HANDLER');

    if (handlerType == 'LOCAL') {
      return getSaasTenantBrandingLocalQueryHandler(
        tenantName: env.get('LOCAL_SAAS_TENANT_NAME'),
        description: env.get('LOCAL_SAAS_TENANT_DESCRIPTION'),
        colors: SaasTenantBrandingColors(
          primary: _parseColorFromEnv(
            env.get('LOCAL_SAAS_TENANT_PRIMARY_COLOUR'),
          ),
        ),
        testingSleep: int.parse(
          env.get('LOCAL_SAAS_TENANT_TESTING_SLEEP_TIME'),
        ),
      );
    } else if (handlerType == 'REMOTE') {
      final apiClient = bootrapContext.serviceRegistry.get<BaseAPIClientType>();
      return getSaasTenantBrandingRemoteQueryHandler(apiClient);
    } else {
      throw Exception(
        'Unknown value for SAAS_TENANT_BRANDING_QUERY_HANDLER, value set is $handlerType',
      );
    }
  }

  Color? _parseColorFromEnv(String? colorString) {
    if (colorString == null || colorString.isEmpty) return null;

    try {
      final hexString = colorString.replaceFirst('#', '');
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
}
