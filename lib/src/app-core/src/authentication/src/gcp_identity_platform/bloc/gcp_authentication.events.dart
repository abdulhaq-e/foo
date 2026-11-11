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

/// [supportedMethods] keeps the sign-in form on screen while signing in;
/// null if the methods had not loaded yet.
class AuthenticationInProgress extends GCPAuthenticationState {
  final SupportedGCPAuthMethods? supportedMethods;

  AuthenticationInProgress({this.supportedMethods});
}

class AuthenticationSuccess extends GCPAuthenticationState {}

/// [supportedMethods] lets the sign-in form come back so the user can retry;
/// null if the methods had not loaded yet.
class AuthenticationError extends GCPAuthenticationState {
  final Object error;
  final SupportedGCPAuthMethods? supportedMethods;

  AuthenticationError({required this.error, this.supportedMethods});
}
