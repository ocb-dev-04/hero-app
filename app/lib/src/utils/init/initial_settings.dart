import 'package:app/src/utils/dependencies_injections.dart';
import 'package:app/src/utils/env_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class InitialSettings {
  Future<void> init() async {
    DependenciesInjections().setup();

    await dotenv.load(fileName: "assets/.env");
    EnvConfig.setEnvValues();
  }
}
