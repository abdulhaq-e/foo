import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart' hide User;

enum AuthMethod { emailPassword, oidc }

class GcpIdentityPlatformException implements Exception {
  String cause;
  GcpIdentityPlatformException(this.cause);
}

class GcpIdentityPlatformAuthenticationService
    implements AuthenticationService {
  final List<String> scopes = <String>['email'];
  late FirebaseAuth _firebaseAuth;
  final _controller = StreamController<AuthenticationEvent>.broadcast();
  StreamSubscription<User?>? _firebaseAuthChangesSubscription;
  bool _isSigningOutDueToBackendFailure = false;

  final BackendAuthCallbackCommandHandling _backendAuthCallbackCommandHandler;
  final SaasTenantDomainResolver _domainResolver;
  final String _clientType;

  GcpIdentityPlatformAuthenticationService({
    required BackendAuthCallbackCommandHandling
    backendAuthCallbackCommandHandler,
    required SaasTenantDomainResolver domainResolver,
    required String clientType,
  }) : _backendAuthCallbackCommandHandler = backendAuthCallbackCommandHandler,
       _domainResolver = domainResolver,
       _clientType = clientType {
    _firebaseAuth = FirebaseAuth.instance;
    _firebaseAuthChangesSubscription = _firebaseAuth.authStateChanges().listen(
      _handleAuthenticationEvent,
    );
    // .onError(_handleAuthenticationError);
  }

  void setTenantId(String tenantId) {
    _firebaseAuth.tenantId = tenantId;
  }

  bool _redirectResultChecked = false;

  /// Reports a failed redirect sign-in (see `signInWithOIDC(forceRedirect:)`)
  /// as a [FailedAuthenticationEvent].
  ///
  /// A redirect failure is only available through `getRedirectResult`, not
  /// through `authStateChanges`. Call this after [setTenantId] and after
  /// something listens to [asyncAuthentication], or the event is lost.
  /// A successful redirect needs nothing here: `authStateChanges` reports it.
  /// Runs once; later calls and non-web platforms do nothing.
  Future<void> checkRedirectResult() async {
    if (!kIsWeb || _redirectResultChecked) return;
    _redirectResultChecked = true;
    try {
      await _firebaseAuth.getRedirectResult();
    } on FirebaseAuthException catch (e) {
      _controller.add(
        FailedAuthenticationEvent(
          error: GcpIdentityPlatformException(
            'OIDC redirect sign in failed: ${e.message}',
          ),
        ),
      );
    }
  }

  @override
  Future<AuthenticationResponse> authenticate() async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    _firebaseAuth.signOut();
  }

  @override
  Stream<AuthenticationEvent> get asyncAuthentication async* {
    yield* _controller.stream;
  }

  void _handleAuthenticationEvent(User? user) async {
    if (_isSigningOutDueToBackendFailure && user == null) {
      _isSigningOutDueToBackendFailure = false;
      return;
    }
    await _handlePostAuthStateChange(user);
  }

  void _handleAuthenticationError(dynamic error) {}

  Future<AuthenticationResponse> _processAuthentication(
    User user, {
    bool forceRefresh = false,
  }) async {
    final token = await user.getIdToken(forceRefresh);
    if (token == null) {
      throw GcpIdentityPlatformException(
        "Account not authenticated (null) or idToken is null",
      );
    }

    final domain = _domainResolver.resolveDomain();
    final response = await _backendAuthCallbackCommandHandler(
      BackendAuthCallbackCommand(
        token: "Bearer $token",
        authProvider: "GCP_IDENTITY_PLATFORM",
        saasTenantDomain: domain,
        clientType: _clientType,
      ),
    );

    return AuthenticationResponse(
      token: token,
      saasTenantEntityId: response.saasTenantEntityId,
      additionalData: null,
    );
  }

  Future<void> _handlePostAuthStateChange(User? user) async {
    if (user == null) {
      final error = GcpIdentityPlatformException(
        "User object is now null, user is logged out!",
      );
      _controller.add(FailedAuthenticationEvent(error: error));
      return;
    }

    try {
      final authResponse = await _processAuthentication(user);
      _controller.add(
        SuccessfulAuthenticationEvent(authenticationResponse: authResponse),
      );
    } catch (e) {
      final error = GcpIdentityPlatformException(
        "Backend authentication callback error ${e}",
      );
      _controller.add(FailedAuthenticationEvent(error: error));
      _isSigningOutDueToBackendFailure = true;
      await _firebaseAuth.signOut();
    }
  }

  @override
  Future<void> initiateAuthentication() async {
    throw UnimplementedError('Use specific auth methods instead');
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw GcpIdentityPlatformException(
        'Email/Password sign in failed: ${e.message}',
      );
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw GcpIdentityPlatformException(
        'Email/Password sign up failed: ${e.message}',
      );
    }
  }

  /// Signs in with an OIDC provider.
  ///
  /// On web this uses a popup by default. Set [forceRedirect] to use a
  /// full-page redirect instead, e.g. when the page is served with
  /// `Cross-Origin-Opener-Policy: same-origin`, which breaks popup sign-in.
  /// After a redirect the page reloads, and the signed-in user arrives through
  /// `authStateChanges` as usual.
  Future<void> signInWithOIDC({
    required String providerId,
    Map<String, String>? parameters,
    bool forceRedirect = false,
  }) async {
    try {
      final provider = OAuthProvider(providerId);
      Map<String, String> customParameters = {'prompt': 'select_account'};
      if (parameters != null) {
        customParameters.addAll(parameters);
      }
      provider.setCustomParameters(customParameters);
      if (kIsWeb && !forceRedirect) {
        await _firebaseAuth.signInWithPopup(provider);
      } else {
        await _firebaseAuth.signInWithRedirect(provider);
      }
    } on FirebaseAuthException catch (e) {
      throw GcpIdentityPlatformException('OIDC sign in failed: ${e.message}');
    }
  }

  Future<void> authenticateWith({
    required AuthMethod method,
    Map<String, dynamic>? parameters,
  }) async {
    switch (method) {
      case AuthMethod.emailPassword:
        final email = parameters?['email'] as String?;
        final password = parameters?['password'] as String?;
        final isSignUp = parameters?['isSignUp'] as bool? ?? false;

        if (email == null || password == null) {
          throw GcpIdentityPlatformException('Email and password are required');
        }

        if (isSignUp) {
          await createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
        } else {
          await signInWithEmailAndPassword(email: email, password: password);
        }

      case AuthMethod.oidc:
        final providerId = parameters?['providerId'] as String?;
        final oidcParameters =
            parameters?['oidcParameters'] as Map<String, String>?;
        final forceRedirect = parameters?['forceRedirect'] as bool? ?? false;
        if (providerId == null) {
          throw GcpIdentityPlatformException(
            'Provider ID is required for OIDC',
          );
        }
        await signInWithOIDC(
          providerId: providerId,
          parameters: oidcParameters,
          forceRedirect: forceRedirect,
        );
    }
  }

  @override
  Future<AuthenticationResponse> refresh() async {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      throw GcpIdentityPlatformException("No authenticated user");
    }

    return await _processAuthentication(user, forceRefresh: true);
  }
}
