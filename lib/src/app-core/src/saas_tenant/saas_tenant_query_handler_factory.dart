import 'package:api_tools/api_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:under_chamber/app/src/dependencies/saas_tenant/local/get_saas_tenant_branding_local_query_handler.dart';
import 'package:under_chamber/app/src/dependencies/saas_tenant/remote/get_saas_tenant_branding_remote_query_handler.dart';
import 'package:under_chamber/core/core.dart';

class SaasTenantQueryHandlerFactory {
  const SaasTenantQueryHandlerFactory();

  GetSaasTenantBrandingQueryHandling createQueryHandler(DotEnv env) {
    String handlerType = env.get('SAAS_TENANT_BRANDING_QUERY_HANDLER');

    if (handlerType == "LOCAL") {
      return getSaasTenantBrandingLocalQueryHandler(
        tenantName: env.get('LOCAL_SAAS_TENANT_NAME'),
        description: env.get('LOCAL_SAAS_TENANT_DESCRIPTION'),
        logoUrl: null,
        colors: SaasTenantBrandingColors(
          primary: _parseColorFromEnv(
            env.get('LOCAL_SAAS_TENANT_PRIMARY_COLOUR'),
          ),
        ),
        testingSleep: int.parse(
          env.get('LOCAL_SAAS_TENANT_TESTING_SLEEP_TIME'),
        ),
      );
    } else if (handlerType == "REMOTE") {
      final baseApiClient = HttpAPIClient(
        baseURL: env.get('UNDER_CHAMBER_BACKEND_URL'),
        client: http.Client() as http.BaseClient,
      );

      return getSaasTenantBrandingRemoteQueryHandler(baseApiClient);
    } else {
      throw Exception(
        "Unknown value for SAAS_TENANT_BRANDING_QUERY_HANDLER, value set is $handlerType",
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
