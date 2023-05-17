import 'package:flutter/material.dart';

import 'package:app/app.dart';
import 'package:app/src/utils/init/initial_settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialSettings().init();

  runApp(const App());
}
