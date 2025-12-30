import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

class AppConfig {
  final String apiURL;
  final AuthProvider authProvider;
  final SaasTenantBranding saasTenantBranding;
  final String? domainFromEnv;
  final SaasTenantResolutionPriority domainResolutionPriority;

  const AppConfig({
    required this.apiURL,
    required this.authProvider,
    required this.saasTenantBranding,
    required this.domainFromEnv,
    required this.domainResolutionPriority,
  });
}
