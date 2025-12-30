abstract class AuthConfig {}

class GCPAuthConfig implements AuthConfig {
  const GCPAuthConfig();
}

class FixedTokenAuthConfig implements AuthConfig {
  final String apiToken;

  const FixedTokenAuthConfig({required this.apiToken});
}
