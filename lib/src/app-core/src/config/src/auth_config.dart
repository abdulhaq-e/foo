abstract class AuthConfig {}

class GCPAuthConfig implements AuthConfig {
  final String clientType;
  const GCPAuthConfig({required this.clientType});
}

class FixedTokenAuthConfig implements AuthConfig {
  final String apiToken;

  const FixedTokenAuthConfig({required this.apiToken});
}
