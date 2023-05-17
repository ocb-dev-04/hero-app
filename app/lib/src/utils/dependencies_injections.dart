import 'package:get_it/get_it.dart';

// contracts
import 'package:app/src/domain/abstractions/application/services/heroes_services.contract.dart';

// implementations
import 'package:app/src/application/services/heroes_service.impl.dart';

// utils
import 'package:app/src/utils/logger.dart';

/// Using get it how dependency injection
class DependenciesInjections {
  final getIt = GetIt.instance;

  void setup() {
    getIt.registerLazySingleton<HeroesServicesContract>(() => HeroesService());

    DebugLogger.show('--- Dependencies injected... ready to go');
  }
}
