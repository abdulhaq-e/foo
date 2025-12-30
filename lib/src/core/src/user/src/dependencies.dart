import 'dart:async';
import 'package:foo/core.dart';
import 'domain/domain.dart';

typedef UserQueryHandling = QueryHandling<void, User>;

abstract class UserStore {
  Future<User?> getCurrentUser();
  Future<void> saveUser(User user);
  Future<void> clearUserData();
  Stream<User?> get userStream;
}
