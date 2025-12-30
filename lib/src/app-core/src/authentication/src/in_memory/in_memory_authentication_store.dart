import 'package:under_chamber/core/authentication/authentication.dart';

class InMemoryAuthenticationStore implements AuthenticationStore {
  static final InMemoryAuthenticationStore _singleton =
      InMemoryAuthenticationStore._internal();

  factory InMemoryAuthenticationStore() {
    return _singleton;
  }

  InMemoryAuthenticationStore._internal();

  String? _token;
  String? _saasTenantEntityId;
  Object? _additionalAuthData;

  @override
  Future<void> deleteAuthenticationData() async {
    _token = null;
    _saasTenantEntityId = null;
    _additionalAuthData = null;
  }

  @override
  Future<AuthenticationResponse> getAuthenticationData() async {
    if (_token != null && _saasTenantEntityId != null) {
      return AuthenticationResponse(
          token: _token!,
          additionalData: _additionalAuthData,
          saasTenantEntityId: _saasTenantEntityId!);
    }

    throw Exception("No logged in user");
  }

  @override
  Future<void> saveAuthenticationData(
      AuthenticationResponse authenticationResponse) async {
    _token = authenticationResponse.token;
    _saasTenantEntityId = authenticationResponse.saasTenantEntityId;
    _additionalAuthData = authenticationResponse.additionalData;
  }
}
