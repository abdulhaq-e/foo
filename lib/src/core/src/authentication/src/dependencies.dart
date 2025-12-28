import 'domain/domain.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

sealed class AuthenticationEvent {}

class SuccessfulAuthenticationEvent extends AuthenticationEvent {
  final AuthenticationResponse authenticationResponse;

  SuccessfulAuthenticationEvent({required this.authenticationResponse});
}

class FailedAuthenticationEvent extends AuthenticationEvent {
  final Object? error;

  FailedAuthenticationEvent({required this.error});
}

abstract mixin class AuthenticationService {
  Future<void> initiateAuthentication();
  Future<AuthenticationResponse> authenticate();
  Stream<AuthenticationEvent> get asyncAuthentication;
  Future<void> logout();
  Future<AuthenticationResponse> refresh();
}

abstract class AuthenticationStore {
  Future<AuthenticationResponse?> getCurrentAuthenticationData();
  Stream<AuthenticationResponse?> get authenticationStateStream;
  Future<void> saveAuthenticationData(AuthenticationResponse response);
  Future<void> clearAuthentication();
}
