part of 'gcp_authentication.bloc.dart';

abstract class GCPAuthenticationState {}

class GCPAuthenticationInitial extends GCPAuthenticationState {}

class SupportedAuthMethodsLoading extends GCPAuthenticationState {}

class SupportedAuthMethodsLoaded extends GCPAuthenticationState {
  final SupportedGCPAuthMethods supportedMethods;

  SupportedAuthMethodsLoaded({required this.supportedMethods});
}

class SupportedAuthMethodsError extends GCPAuthenticationState {
  final Object error;

  SupportedAuthMethodsError({required this.error});
}
