import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/app-core.dart';

import 'internal.dart';

class GCPAuthenticationComposer {
  static Widget composeGCPAuthenticationWidget({
    required SupportedGCPAuthMethodsQueryHandler supportedMethodsQueryHandler,
    required SaasTenantDomainResolver domainResolver,
    required GcpIdentityPlatformAuthenticationService authService,
    GCPAuthenticationDelegate? delegate,
  }) {
    return BlocProvider(
      create: (context) => GCPAuthenticationBloc(
        supportedMethodsQueryHandler: supportedMethodsQueryHandler,
        domainResolver: domainResolver,
        authService: authService,
        delegate: delegate,
      ),
      child: GCPAuthenticationWidget(),
    );
  }
}
