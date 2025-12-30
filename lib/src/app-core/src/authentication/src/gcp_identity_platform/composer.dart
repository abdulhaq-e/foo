import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:under_chamber/app/src/dependencies/saas_tenant/saas_tenant_domain_resolver.dart';
import 'package:under_chamber/core/core.dart';

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
