import 'package:flutter/material.dart';

import 'package:app/src/presentation/routes/routes_names.dart';
import 'package:app/src/presentation/modules/home/home.view.dart';
import 'package:app/src/presentation/modules/heroes/heroes_details/heroes_details.view.dart';

abstract class RoutesDefinition {
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesNames.home: (context) => const HomeView(),
    RoutesNames.heroDetails: (context) => const HeroesDetailsView(),
  };
}
