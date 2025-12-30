import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfigLoader {
  const EnvConfigLoader();

  Future<DotEnv> load({required String flavourEnvFile}) async {
    var flavourEnv = DotEnv();
    await flavourEnv.load(fileName: flavourEnvFile);

    var overrideEnv = DotEnv();
    const loadOverride = String.fromEnvironment('LOAD_OVERRIDE_ENV') != '';

    if (loadOverride) {
      await overrideEnv.load(fileName: "override.env");
    } else {
      await overrideEnv.load(
        fileName: "should-be-empty-env.env",
        isOptional: true,
      );
    }

    var mainEnv = DotEnv();
    await mainEnv.load(
      isOptional: true,
      mergeWith: {...flavourEnv.env, ...overrideEnv.env},
    );

    return mainEnv;
  }
}
