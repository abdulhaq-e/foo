import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:foo/app-core.dart';
import 'package:foo/core.dart';

class BootstrapContext {
  final DotEnv env;
  final AppConfig appConfig;
  final Environment environment;
  final ServiceRegistry serviceRegistry;

  BootstrapContext({
    required this.env,
    required this.appConfig,
    required this.environment,
    required this.serviceRegistry,
  });
}
