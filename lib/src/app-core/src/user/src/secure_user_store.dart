import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foo/core.dart';

class SecureUserStore implements UserStore {
  final String _storageKey;
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  SecureUserStore({required String storageKey}) : _storageKey = storageKey;

  final _controller = StreamController<User?>.broadcast();
  User? _cachedUser;

  @override
  Future<User?> getCurrentUser() async {
    if (_cachedUser != null) {
      return _cachedUser;
    }

    try {
      final userData = await _secureStorage.read(key: _storageKey);
      if (userData != null) {
        final userJson = jsonDecode(userData) as Map<String, dynamic>;
        _cachedUser = User.fromJson(userJson);
        return _cachedUser;
      }
    } catch (e) {
      // If there's an error reading or parsing, clear the data
      await clearUserData();
    }

    return null;
  }

  @override
  Future<void> saveUser(User user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await _secureStorage.write(key: _storageKey, value: userJson);
      _cachedUser = user;
      _controller.add(user);
    } catch (e) {
      throw Exception('Failed to save user data: $e');
    }
  }

  @override
  Future<void> clearUserData() async {
    try {
      await _secureStorage.delete(key: _storageKey);
      _cachedUser = null;
      _controller.add(null);
    } catch (e) {
      // Even if deletion fails, clear the cache
      _cachedUser = null;
      _controller.add(null);
    }
  }

  @override
  Stream<User?> get userStream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
