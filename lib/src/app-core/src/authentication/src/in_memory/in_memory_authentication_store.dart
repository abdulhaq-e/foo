import 'package:foo/core.dart';

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
  Future<void> saveAuthenticationData(
    AuthenticationResponse authenticationResponse,
  ) async {
    _token = authenticationResponse.token;
    _saasTenantEntityId = authenticationResponse.saasTenantEntityId;
    _additionalAuthData = authenticationResponse.additionalData;
  }

  @override
  Future<void> clearAuthentication() async {
    _token = null;
    _saasTenantEntityId = null;
    _additionalAuthData = null;
  }

  @override
  // TODO: implement authenticationStateStream
  Stream<AuthenticationResponse?> get authenticationStateStream =>
      throw UnimplementedError();

  @override
  Future<AuthenticationResponse?> getCurrentAuthenticationData() async {
    if (_token != null && _saasTenantEntityId != null) {
      return AuthenticationResponse(
        token: _token!,
        additionalData: _additionalAuthData,
        saasTenantEntityId: _saasTenantEntityId!,
      );
    }

    throw Exception("No logged in user");
  }
}
