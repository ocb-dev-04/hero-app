import 'package:app/src/application/view_models/character.view_model.dart';
import 'package:app/src/domain/abstractions/application/services/heroes_services.contract.dart';
import 'package:app/src/presentation/extensions/global_error_handler.dart';
import 'package:app/src/utils/logger.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  late HeroesServicesContract _heroService;

  bool _loadding = true;
  bool _error = false;

  bool get loading => _loadding;
  bool get error => _error;

  List<CharacterViewModel>? _charactersList;
  List<CharacterViewModel> get charactersList => _charactersList ?? [];

  HomeProvider({required HeroesServicesContract heroesService}) {
    _heroService = heroesService;
  }

  Future<void> getCharacters() async {
    try {
      _charactersList = await _heroService.getCharacters();
    } catch (e) {
      _error = true;
      GlobalErrorHandler.handleError(e, fileName: 'home_provider');
    } finally {
      stopLoading();
    }
  }

  void startLoading() {
    _loadding = true;
    notifyListeners();
  }

  void stopLoading() {
    _loadding = false;
    notifyListeners();
  }
}
