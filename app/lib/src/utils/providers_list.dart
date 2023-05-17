import 'package:app/src/domain/abstractions/application/services/heroes_services.contract.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:app/src/presentation/providers/hero_provider.dart';
import 'package:app/src/presentation/providers/home_provider.dart';

class ProviderList {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<HeroProvider>(
      create: (_) => HeroProvider(
        heroesService: GetIt.instance.get<HeroesServicesContract>(),
      ),
    ),
    ChangeNotifierProvider<HomeProvider>(
      create: (_) => HomeProvider(
        heroesService: GetIt.instance.get<HeroesServicesContract>(),
      ),
    ),
  ];
}
