import 'package:api_tools/api_tools.dart';
import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

import 'bootrap_context.dart';

class UserSessionBootstrapper {
  UserSessionBootstrapper();

  Future<void> bootstrap({required BootstrapContext bootstrapContext}) async {
    final serviceRegistry = bootstrapContext.serviceRegistry;

    final apiClient = serviceRegistry.get<APIClient>(name: 'authenticated');
    final authenticationInteractor = serviceRegistry
        .get<AuthenticationInteractor>();
    final userQueryHandler = userRemoteQueryHandler(apiClient);
    final userStore = SecureUserStore(storageKey: 'USER_STORE');
    final userInteractor = UserInteractor(
      authenticationStatusStream: authenticationInteractor.status,
      userQueryHandler: userQueryHandler,
      userStore: userStore,
    );

    final sessionInteractor = SessionInteractor(
      authenticationInteractor: authenticationInteractor,
      userInteractor: userInteractor,
    );

    serviceRegistry.register(userInteractor);
    serviceRegistry.register(sessionInteractor);
  }
}
