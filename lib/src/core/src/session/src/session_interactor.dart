import 'dart:async';

import 'package:foo/core.dart';

import 'session_state.dart';

/// Unified session interactor that composes AuthenticationInteractor
/// and UserInteractor to provide atomic session state (authenticated = has user).
///
/// This ensures the router never sees a user as authenticated without user data,
/// eliminating race conditions.
class SessionInteractor {
  SessionInteractor({
    required AuthenticationInteractor authenticationInteractor,
    required UserInteractor userInteractor,
  }) {
    _authenticationInteractor = authenticationInteractor;
    _userInteractor = userInteractor;

    _initialize();
  }

  late AuthenticationInteractor _authenticationInteractor;
  late UserInteractor _userInteractor;

  final _controller = StreamController<SessionState>.broadcast();
  StreamSubscription<AuthenticationStatus>? _authSubscription;
  StreamSubscription<User?>? _userSubscription;

  AuthenticationStatus _authStatus = AuthenticationStatus.unknown;
  User? _user;

  SessionState _currentState = SessionState(status: SessionStatus.unknown);

  void _initialize() {
    _userSubscription = _userInteractor.userStream.listen((user) {
      _user = user;
      _updateState();
    });

    _authSubscription = _authenticationInteractor.status.listen((status) {
      _authStatus = status;

      if (status == AuthenticationStatus.unauthenticated) {
        _user = null;
      }

      _updateState();
    });
  }

  void _updateState() {
    final newState = _computeState();

    if (newState.status != _currentState.status ||
        newState.user != _currentState.user) {
      _currentState = newState;
      _controller.add(_currentState);
    }
  }

  SessionState _computeState() {
    switch (_authStatus) {
      case AuthenticationStatus.unknown:
        return SessionState(status: SessionStatus.unknown);

      case AuthenticationStatus.unauthenticated:
        return SessionState(status: SessionStatus.unauthenticated);

      case AuthenticationStatus.authenticated:
        if (_user == null) {
          return SessionState(
            status: SessionStatus.loading,
            token: _authenticationInteractor.token,
            saasTenantEntityId: _authenticationInteractor.saasTenantEntityId,
            additionalData: _authenticationInteractor.additionalData,
          );
        }

        return SessionState(
          status: SessionStatus.authenticated,
          user: _user,
          token: _authenticationInteractor.token,
          saasTenantEntityId: _authenticationInteractor.saasTenantEntityId,
          additionalData: _authenticationInteractor.additionalData,
        );
    }
  }

  Stream<SessionState> get state async* {
    yield _currentState;
    yield* _controller.stream;
  }

  /// Current session state (synchronous access)
  SessionState get currentState => _currentState;

  bool get isReady => _currentState.isReady;
  bool get isAuthenticated => _currentState.isAuthenticated;
  User? get user => _currentState.user;
  String? get token => _currentState.token;
  String? get saasTenantEntityId => _currentState.saasTenantEntityId;

  Future<void> logout() async {
    await _authenticationInteractor.logout();
  }

  void dispose() {
    _authSubscription?.cancel();
    _userSubscription?.cancel();
    _controller.close();
  }
}
