import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dependencies.dart';
import 'domain/domain.dart';

class SecureAuthenticationStore implements AuthenticationStore {
  static const String _authResponseStorageKey = 'UNDER_CHAMBER_AUTH_RESPONSE';
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  final _controller = StreamController<AuthenticationResponse?>.broadcast();
  AuthenticationResponse? _cachedResponse;

  @override
  Future<AuthenticationResponse?> getCurrentAuthenticationData() async {
    if (_cachedResponse != null) {
      return _cachedResponse;
    }

    try {
      final authData = await _secureStorage.read(key: _authResponseStorageKey);
      if (authData != null) {
        final authJson = jsonDecode(authData) as Map<String, dynamic>;
        _cachedResponse = AuthenticationResponse.fromJson(authJson);
        return _cachedResponse;
      }
    } catch (e) {
      // If there's an error reading or parsing, clear the data
      await clearAuthentication();
    }

    return null;
  }

  @override
  Stream<AuthenticationResponse?> get authenticationStateStream =>
      _controller.stream;

  @override
  Future<void> saveAuthenticationData(AuthenticationResponse response) async {
    try {
      final authJson = jsonEncode(response.toJson());
      await _secureStorage.write(key: _authResponseStorageKey, value: authJson);
      _cachedResponse = response;
      _controller.add(response);
    } catch (e) {
      throw Exception('Failed to save authentication data: $e');
    }
  }

  @override
  Future<void> clearAuthentication() async {
    try {
      await _secureStorage.delete(key: _authResponseStorageKey);
      _cachedResponse = null;
      _controller.add(null);
    } catch (e) {
      // Even if deletion fails, clear the cache
      _cachedResponse = null;
      _controller.add(null);
    }
  }

  void dispose() {
    _controller.close();
  }
}
