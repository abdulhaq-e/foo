import 'package:api_tools/api_tools.dart';
import 'package:foo/core.dart';

class AuthenticationInteractorTokenProvider implements TokenProvider {
  final AuthenticationInteractor authenticationInteractor;

  AuthenticationInteractorTokenProvider({
    required this.authenticationInteractor,
  });

  @override
  Future<String> getToken() async {
    final token = this.authenticationInteractor.token;
    if (token != null) {
      return token;
    }
    throw Exception("Token is null in the interactor.");
  }

  @override
  Future<void> refreshToken() async {
    await authenticationInteractor.refresh();
  }
}
