import 'dart:async';

import 'package:foo/core.dart';

class FakeUserStore implements UserStore {
  @override
  Future<User?> getCurrentUser() async => null;

  @override
  Future<void> saveUser(User user) async {}

  @override
  Future<void> clearUserData() async {}

  @override
  Stream<User?> get userStream => const Stream.empty();
}
