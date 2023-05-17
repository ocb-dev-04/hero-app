import 'package:app/src/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'package:provider/provider.dart';

import 'package:app/src/utils/themes.dart';
import 'package:app/src/utils/providers_list.dart';
import 'package:app/src/utils/constants/general.dart';
import 'package:app/src/presentation/routes/routes.dart';
import 'package:app/src/presentation/routes/routes_names.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.providers,
      child: MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: kDebugMode,
        title: KGeneral.appName,
        theme: CustomAppTheme.theme(context),
        routes: RoutesDefinition.routes,
        initialRoute: RoutesNames.home,
        supportedLocales: const [
          Locale('es'),
          Locale('en'),
        ],
        localizationsDelegates: [
          FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
              basePath: 'assets/i18n',
              forcedLocale: const Locale('es'),
            ),
            missingTranslationHandler: (key, locale) => DebugLogger.show(
                'Missing Key: $key, languageCode: ${locale!.languageCode}'),
          ),
        ],
      ),
    );
  }
}
