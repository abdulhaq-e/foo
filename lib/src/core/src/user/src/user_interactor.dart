import 'dart:async';

import 'package:foo/core.dart';

import 'dependencies.dart';
import 'domain/domain.dart';

class UserInteractor {
  UserInteractor({
    required Stream<AuthenticationStatus> authenticationStatusStream,
    required UserQueryHandling Function() userQueryHandlerFactory,
    required UserStore userStore,
  }) {
    _userQueryHandlerFactory = userQueryHandlerFactory;
    _userStore = userStore;

    _authStatusSubscription = authenticationStatusStream.listen((status) async {
      switch (status) {
        case AuthenticationStatus.authenticated:
          await _fetchAndSaveUser();
          break;
        case AuthenticationStatus.unauthenticated:
          await _userStore.clearUserData();
          _currentUser = null;
          _controller.add(null);
          break;
        case AuthenticationStatus.unknown:
          break;
      }
    });
  }

  late UserQueryHandling Function() _userQueryHandlerFactory;
  late UserStore _userStore;

  final _controller = StreamController<User?>.broadcast();
  late StreamSubscription<AuthenticationStatus> _authStatusSubscription;
  User? _currentUser;

  Future<void> _fetchAndSaveUser() async {
    try {
      final userQueryHandler = _userQueryHandlerFactory();
      final user = await userQueryHandler(());
      await _userStore.saveUser(user);
      _currentUser = user;
      _controller.add(user);
    } catch (error) {
      _currentUser = null;
      _controller.add(null);
    }
  }

  Future<void> refreshUser() async {
    await _fetchAndSaveUser();
  }

  Stream<User?> get userStream async* {
    final cachedUser = await _userStore.getCurrentUser();
    if (cachedUser != null) {
      _currentUser = cachedUser;
      yield cachedUser;
    } else {
      await refreshUser();
      yield* _controller.stream;
    }
    yield* _controller.stream;
  }

  User? get currentUser => _currentUser;

  bool hasPermission(String permission) {
    return _currentUser?.permissions.contains(permission) ?? false;
  }

  bool hasAnyPermission(List<String> permissions) {
    if (_currentUser == null) return false;
    return permissions.any(
      (permission) => _currentUser!.permissions.contains(permission),
    );
  }

  bool hasAllPermissions(List<String> permissions) {
    if (_currentUser == null) return false;
    return permissions.every(
      (permission) => _currentUser!.permissions.contains(permission),
    );
  }

  void dispose() {
    _controller.close();
    _authStatusSubscription.cancel();
  }
}
