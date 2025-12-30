import 'package:foo/core.dart';
import 'saas_tenant_entity_id_provider.dart';

class AuthenticationInteractorSaasEntityIdProvider
    implements SaasTenantEntityIdProvider {
  final AuthenticationInteractor authenticationInteractor;

  AuthenticationInteractorSaasEntityIdProvider({
    required this.authenticationInteractor,
  });

  @override
  Future<String> getTenantId() async {
    final saasTenantEntityId = this.authenticationInteractor.saasTenantEntityId;
    if (saasTenantEntityId != null) {
      return saasTenantEntityId;
    }
    throw Exception("saasTenantEntityId is null in the interactor.");
  }
}
