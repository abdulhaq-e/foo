import 'dart:async';

import 'package:foo/core.dart';

import 'authentication_test_doubles.dart';
import 'user_test_doubles.dart';

class FakeSessionInteractor extends SessionInteractor {
  final _controller = StreamController<SessionState>.broadcast();
  SessionState _fakeState = SessionState(status: SessionStatus.unknown);

  FakeSessionInteractor._({
    required super.authenticationInteractor,
    required super.userInteractor,
  });

  factory FakeSessionInteractor() {
    final authInteractor = AuthenticationInteractor(
      authenticationService: FakeAuthenticationService(),
      authenticationStore: FakeAuthenticationStore(),
    );
    final userInteractor = UserInteractor(
      authenticationStatusStream: Stream.empty(),
      userQueryHandler: (_) async => throw UnimplementedError(),
      userStore: FakeUserStore(),
    );
    return FakeSessionInteractor._(
      authenticationInteractor: authInteractor,
      userInteractor: userInteractor,
    );
  }

  void emit(SessionState state) {
    _fakeState = state;
    _controller.add(state);
  }

  @override
  Stream<SessionState> get state async* {
    yield _fakeState;
    yield* _controller.stream;
  }

  @override
  SessionState get currentState => _fakeState;

  @override
  bool get isReady => _fakeState.isReady;

  @override
  bool get isAuthenticated => _fakeState.isAuthenticated;

  @override
  User? get user => _fakeState.user;

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }
}
