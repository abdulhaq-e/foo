import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

import 'fixed_token/fixed_token.dart';
import 'gcp_identity_platform/gcp_identity_platform.dart';

enum AuthProvider { gcpIdentityPlatform, fixedToken }

class AuthProviderFactory {
  static AuthenticationService createGCPAuthService({
    required GCPAuthConfig authConfig,
    required BackendAuthCallbackCommandHandling
    backendAuthCallbackCommandHandler,
    required SaasTenantDomainResolver domainResolver,
  }) {
    return GCPAuthProvider.createService(
      backendAuthCallbackCommandHandler: backendAuthCallbackCommandHandler,
      domainResolver: domainResolver,
    );
  }

  static AuthenticationService createFixedTokenAuthService({
    required FixedTokenAuthConfig authConfig,
  }) {
    return FixedTokenAuthProvider.createService(apiToken: authConfig.apiToken);
  }
}

class GCPAuthProvider {
  static AuthenticationService createService({
    required BackendAuthCallbackCommandHandling
    backendAuthCallbackCommandHandler,
    required SaasTenantDomainResolver domainResolver,
  }) {
    return GcpIdentityPlatformAuthenticationService(
      backendAuthCallbackCommandHandler: backendAuthCallbackCommandHandler,
      domainResolver: domainResolver,
    );
  }
}

class FixedTokenAuthProvider {
  static AuthenticationService createService({required String apiToken}) {
    return FixedTokenAuthenticationService(apiToken: apiToken);
  }
}
