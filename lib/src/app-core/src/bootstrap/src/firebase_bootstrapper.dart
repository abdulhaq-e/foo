import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseBootstrapper {
  final Map<String, FirebaseOptions> envOptions;
  FirebaseBootstrapper({required this.envOptions});

  Future<void> bootstrapIfNeeded(DotEnv env) async {
    if (env.get("AUTH_PROVIDER") != "GCP_IDENTITY_PLATFORM") {
      return;
    }

    String firebaseOptionsFile = env.get("FIREBASE_OPTIONS");
    FirebaseOptions options = this.envOptions[firebaseOptionsFile]!;
    await Firebase.initializeApp(options: options);
  }
}
