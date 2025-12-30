import 'dart:async';

import 'package:under_chamber/core/authentication/authentication.dart';

class FixedTokenAuthenticationService implements AuthenticationService {
  final String apiToken;
  bool _isLoggedIn = false;

  FixedTokenAuthenticationService({required this.apiToken});

  final _controller = StreamController<AuthenticationEvent>.broadcast();

  @override
  Future<void> logout() async {
    _isLoggedIn = false;
  }

  @override
  Stream<AuthenticationEvent> get asyncAuthentication async* {
    yield* _controller.stream;
  }

  @override
  Future<AuthenticationResponse> authenticate() async {
    _isLoggedIn = true;
    final response = AuthenticationResponse(
      token: apiToken,
      saasTenantEntityId: "",
    );
    _controller.add(
      SuccessfulAuthenticationEvent(authenticationResponse: response),
    );
    return response;
  }

  @override
  Future<void> initiateAuthentication() async {
    await authenticate();
  }

  @override
  Future<String?> refreshToken() async {
    return null;
  }
}
