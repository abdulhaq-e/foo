import 'dart:async';

import 'package:foo/core.dart';

class FakeAuthenticationService with AuthenticationService {
  final _asyncAuthController =
      StreamController<AuthenticationEvent>.broadcast();

  AuthenticationResponse? _lastAuthResponse;
  bool _isAuthenticated = false;

  @override
  Stream<AuthenticationEvent> get asyncAuthentication =>
      _asyncAuthController.stream;

  @override
  Future<void> initiateAuthentication() async {
    // No-op for testing
  }

  @override
  Future<AuthenticationResponse> authenticate() async {
    if (_lastAuthResponse != null) {
      return _lastAuthResponse!;
    }
    throw Exception('Not authenticated');
  }

  @override
  Future<void> logout() async {
    _isAuthenticated = false;
    _lastAuthResponse = null;
  }

  @override
  Future<AuthenticationResponse> refresh() async {
    if (_lastAuthResponse != null) {
      return _lastAuthResponse!;
    }
    throw Exception('Not authenticated');
  }

  // Test helpers
  void emitSuccessfulAuth(AuthenticationResponse response) {
    _lastAuthResponse = response;
    _isAuthenticated = true;
    _asyncAuthController.add(
      SuccessfulAuthenticationEvent(authenticationResponse: response),
    );
  }

  void emitFailedAuth([Object? error]) {
    _isAuthenticated = false;
    _asyncAuthController.add(FailedAuthenticationEvent(error: error));
  }

  void setAuthResponse(AuthenticationResponse response) {
    _lastAuthResponse = response;
    _isAuthenticated = true;
  }

  void dispose() {
    _asyncAuthController.close();
  }
}

class FakeAuthenticationStore extends AuthenticationStore {
  final _authStateController =
      StreamController<AuthenticationResponse?>.broadcast();
  AuthenticationResponse? _currentAuthData;

  int saveCallCount = 0;
  int clearCallCount = 0;
  List<AuthenticationResponse> savedResponses = [];

  @override
  Future<AuthenticationResponse?> getCurrentAuthenticationData() async {
    return _currentAuthData;
  }

  @override
  Stream<AuthenticationResponse?> get authenticationStateStream =>
      _authStateController.stream;

  @override
  Future<void> saveAuthenticationData(AuthenticationResponse response) async {
    saveCallCount++;
    savedResponses.add(response);
    _currentAuthData = response;
    _authStateController.add(response);
  }

  @override
  Future<void> clearAuthentication() async {
    clearCallCount++;
    _currentAuthData = null;
    _authStateController.add(null);
  }

  // Test helpers
  void emitAuthenticationChange(AuthenticationResponse? response) {
    _currentAuthData = response;
    _authStateController.add(response);
  }

  void dispose() {
    _authStateController.close();
  }
}
