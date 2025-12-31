import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

class AppConfig {
  final String apiURL;
  final String clientType;
  final AuthProvider authProvider;
  final String? domainFromEnv;
  final SaasTenantResolutionPriority domainResolutionPriority;

  // SaaS Tenant Branding Configuration
  final String saasTenantBrandingQueryHandler;
  final String? localSaasTenantName;
  final String? localSaasTenantDescription;
  final String? localSaasTenantPrimaryColour;
  final int? localSaasTenantTestingSleepTime;

  // Firebase Configuration
  final String firebaseOptions;

  // Fixed Token Authentication
  final String? fixedTokenApiToken;

  const AppConfig({
    required this.apiURL,
    required this.clientType,
    required this.authProvider,
    required this.domainFromEnv,
    required this.domainResolutionPriority,
    required this.saasTenantBrandingQueryHandler,
    this.localSaasTenantName,
    this.localSaasTenantDescription,
    this.localSaasTenantPrimaryColour,
    this.localSaasTenantTestingSleepTime,
    required this.firebaseOptions,
    this.fixedTokenApiToken,
  });
}
