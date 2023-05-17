import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String publicKey = '';
  static String privateKey = '';

  static void setEnvValues() {
    publicKey = dotenv.get('pub_key');
    privateKey = dotenv.get('priv_key');
  }
}
