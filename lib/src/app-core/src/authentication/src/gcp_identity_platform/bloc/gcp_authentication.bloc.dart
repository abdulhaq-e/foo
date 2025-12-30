import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

import '../internal.dart';

part 'gcp_authentication.state.dart';
part 'gcp_authentication.events.dart';

// BLoC
class GCPAuthenticationBloc
    extends Bloc<GCPAuthenticationEvent, GCPAuthenticationState> {
  final SupportedGCPAuthMethodsQueryHandler _supportedMethodsQueryHandler;
  final GcpIdentityPlatformAuthenticationService _authService;
  final SaasTenantDomainResolver _domainResolver;
  final GCPAuthenticationDelegate? _delegate;

  GCPAuthenticationBloc({
    required SupportedGCPAuthMethodsQueryHandler supportedMethodsQueryHandler,
    required GcpIdentityPlatformAuthenticationService authService,
    required SaasTenantDomainResolver domainResolver,
    GCPAuthenticationDelegate? delegate,
  }) : _supportedMethodsQueryHandler = supportedMethodsQueryHandler,
       _authService = authService,
       _delegate = delegate,
       _domainResolver = domainResolver,
       super(GCPAuthenticationInitial()) {
    on<LoadSupportedAuthMethods>(_onLoadSupportedAuthMethods);
    on<AuthenticateWithEmailPassword>(_onAuthenticateWithEmailPassword);
    on<AuthenticateWithOIDC>(_onAuthenticateWithOIDC);
    on<StartAuthenticationStreamListener>(_onStartAuthenticationStreamListener);

    add(StartAuthenticationStreamListener());
  }

  Future<void> _onLoadSupportedAuthMethods(
    LoadSupportedAuthMethods event,
    Emitter<GCPAuthenticationState> emit,
  ) async {
    emit(SupportedAuthMethodsLoading());
    try {
      final domain = _domainResolver.resolveDomain();
      final supportedMethods = await _supportedMethodsQueryHandler(
        SupportedGCPAuthMethodsQuery(saasTenantDomain: domain),
      );
      _authService.setTenantId(supportedMethods.tenantId);
      emit(SupportedAuthMethodsLoaded(supportedMethods: supportedMethods));
    } catch (error) {
      emit(SupportedAuthMethodsError(error: error));
    }
  }

  Future<void> _onStartAuthenticationStreamListener(
    StartAuthenticationStreamListener event,
    Emitter<GCPAuthenticationState> emit,
  ) async {
    await emit.forEach(
      _authService.asyncAuthentication,
      onData: (AuthenticationEvent authEvent) {
        if (authEvent is SuccessfulAuthenticationEvent) {
          _delegate?.onAuthenticationSuccess();
          return AuthenticationSuccess();
        } else if (authEvent is FailedAuthenticationEvent) {
          _delegate?.onAuthenticationError(authEvent.error ?? "");
          return AuthenticationError(error: authEvent.error ?? "");
        }
        return state; // Return current state for unknown events
      },
    );
  }

  Future<void> _onAuthenticateWithEmailPassword(
    AuthenticateWithEmailPassword event,
    Emitter<GCPAuthenticationState> emit,
  ) async {
    emit(AuthenticationInProgress());
    try {
      await _authService.authenticateWith(
        method: AuthMethod.emailPassword,
        parameters: {
          'email': event.email,
          'password': event.password,
          'isSignUp': event.isSignUp,
        },
      );
      // Success/failure will be handled by the authentication event stream
    } catch (error) {
      // Only handle immediate errors (e.g., validation, network issues during auth initiation)
      emit(AuthenticationError(error: error));
      _delegate?.onAuthenticationError(error);
    }
  }

  Future<void> _onAuthenticateWithOIDC(
    AuthenticateWithOIDC event,
    Emitter<GCPAuthenticationState> emit,
  ) async {
    emit(AuthenticationInProgress());
    try {
      await _authService.authenticateWith(
        method: AuthMethod.oidc,
        parameters: {
          'providerId': event.providerId,
          'oidcParameters': event.parameters,
        },
      );
      // Success/failure will be handled by the authentication event stream
    } catch (error) {
      // Only handle immediate errors (e.g., validation, network issues during auth initiation)
      emit(AuthenticationError(error: error));
      _delegate?.onAuthenticationError(error);
    }
  }
}
