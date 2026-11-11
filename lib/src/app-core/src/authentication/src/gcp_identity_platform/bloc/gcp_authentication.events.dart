part of 'gcp_authentication.bloc.dart';

// Events
abstract class GCPAuthenticationEvent {}

class LoadSupportedAuthMethods extends GCPAuthenticationEvent {}

class AuthenticateWithEmailPassword extends GCPAuthenticationEvent {
  final String email;
  final String password;
  final bool isSignUp;

  AuthenticateWithEmailPassword({
    required this.email,
    required this.password,
    this.isSignUp = false,
  });
}

class AuthenticateWithOIDC extends GCPAuthenticationEvent {
  final String providerId;
  final Map<String, String>? parameters;

  /// On web, sign in with a full-page redirect instead of a popup.
  final bool forceRedirect;

  AuthenticateWithOIDC({
    required this.providerId,
    this.parameters,
    this.forceRedirect = false,
  });
}

class StartAuthenticationStreamListener extends GCPAuthenticationEvent {}

class AuthenticationInProgress extends GCPAuthenticationState {}

class AuthenticationSuccess extends GCPAuthenticationState {}

class AuthenticationError extends GCPAuthenticationState {
  final Object error;

  AuthenticationError({required this.error});
}
