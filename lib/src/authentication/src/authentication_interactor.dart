import 'dart:async';

import 'dependencies.dart';
import 'domain/domain.dart';

class AuthenticationInteractor {
  AuthenticationInteractor({
    required AuthenticationService authenticationService,
    required AuthenticationStore authenticationStore,
  }) {
    _authenticationService = authenticationService;
    _authenticationStore = authenticationStore;
    _asyncAuthResponseSubscription = _authenticationService.asyncAuthentication
        .listen((event) async {
          switch (event) {
            case SuccessfulAuthenticationEvent(:final authenticationResponse):
              // Update local state FIRST (before saving to store)
              // so the equality guard works correctly when store echoes back
              _token = authenticationResponse.token;
              _saasTenantEntityId = authenticationResponse.saasTenantEntityId;
              _additionalData = authenticationResponse.additionalData;
              await _authenticationStore.saveAuthenticationData(
                authenticationResponse,
              );
              _controller.add(AuthenticationStatus.authenticated);
              break;
            case FailedAuthenticationEvent():
              // Update local state FIRST (before clearing store)
              // so the equality guard works correctly when store echoes back
              _token = null;
              _saasTenantEntityId = null;
              _additionalData = null;
              await _authenticationStore.clearAuthentication();
              _controller.add(AuthenticationStatus.unauthenticated);
          }
        });

    // Listen to store changes (e.g., from other tabs) with equality guard
    _storeSubscription = _authenticationStore.authenticationStateStream
        .listen((authResponse) {
          // Equality Guard: Only update if the value is different
          final isDifferent = _isDifferentAuthState(authResponse);

          if (!isDifferent) {
            // Store echoed back the same value we just wrote, ignore it
            return;
          }

          // The store has a different value (e.g., from another tab), update
          if (authResponse != null) {
            _token = authResponse.token;
            _saasTenantEntityId = authResponse.saasTenantEntityId;
            _additionalData = authResponse.additionalData;
            _controller.add(AuthenticationStatus.authenticated);
          } else {
            _token = null;
            _saasTenantEntityId = null;
            _additionalData = null;
            _controller.add(AuthenticationStatus.unauthenticated);
          }
        });
  }

  AuthenticationInteractor._internal();

  late AuthenticationService _authenticationService;
  late AuthenticationStore _authenticationStore;

  final _controller = StreamController<AuthenticationStatus>.broadcast();
  late StreamSubscription<AuthenticationEvent> _asyncAuthResponseSubscription;
  late StreamSubscription<AuthenticationResponse?> _storeSubscription;
  String? _token;
  String? _saasTenantEntityId;
  Object? _additionalData;

  // Equality guard helper: checks if the incoming auth state is different
  bool _isDifferentAuthState(AuthenticationResponse? authResponse) {
    if (authResponse == null && _token == null) {
      return false; // Both are null/unauthenticated
    }
    if (authResponse == null || _token == null) {
      return true; // One is null, the other isn't
    }
    // Compare the actual values
    return authResponse.token != _token ||
        authResponse.saasTenantEntityId != _saasTenantEntityId ||
        authResponse.additionalData != _additionalData;
  }

  Future<void> logout() async {
    // Update local state FIRST (before clearing store)
    // so the equality guard works correctly when store echoes back
    _token = null;
    _saasTenantEntityId = null;
    _additionalData = null;
    await _authenticationService.logout();
    await _authenticationStore.clearAuthentication();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> refresh() async {
    final authenticationResponse = await _authenticationService.refresh();
    // Update local state FIRST (before saving to store)
    // so the equality guard works correctly when store echoes back
    _token = authenticationResponse.token;
    _saasTenantEntityId = authenticationResponse.saasTenantEntityId;
    _additionalData = authenticationResponse.additionalData;
    await _authenticationStore.saveAuthenticationData(authenticationResponse);
    _controller.add(AuthenticationStatus.authenticated);
  }

  Stream<AuthenticationStatus> get status async* {
    final cachedResponse = await _authenticationStore.getCurrentAuthenticationData();
    if (cachedResponse != null) {
      _token = cachedResponse.token;
      _additionalData = cachedResponse.additionalData;
      _saasTenantEntityId = cachedResponse.saasTenantEntityId;
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  String? get token => _token;
  String? get saasTenantEntityId => _saasTenantEntityId;
  Object? get additionalData => _additionalData;

  void dispose() {
    _controller.close();
    _asyncAuthResponseSubscription.cancel();
    _storeSubscription.cancel();
  }
}
