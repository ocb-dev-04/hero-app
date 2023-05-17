import 'package:app/src/application/view_models/character.view_model.dart';
import 'package:app/src/application/view_models/comic.view_model.dart';
import 'package:app/src/application/view_models/event.view_model.dart';
import 'package:app/src/application/view_models/serie.view_model.dart';
import 'package:app/src/application/view_models/story.view_model.dart';
import 'package:app/src/domain/abstractions/application/services/heroes_services.contract.dart';
import 'package:app/src/presentation/extensions/global_error_handler.dart';
import 'package:flutter/material.dart';

class HeroProvider extends ChangeNotifier {
  late HeroesServicesContract _heroServices;

  bool _loading = true;
  bool get loading => _loading;

  CharacterViewModel? selectedCharacter;
  List<ComicViewModel> comics = [];
  List<SerieViewModel> series = [];
  List<EventViewModel> events = [];
  List<StoryViewModel> stories = [];

  HeroProvider({required HeroesServicesContract heroesService}) {
    _heroServices = heroesService;
  }

  setSelectedCharacter(CharacterViewModel character) =>
      selectedCharacter = character;

  _stopLoading() {
    _loading = false;
    notifyListeners();
  }

  Future<void> loadRelatedData() async {
    await Future.wait([
      _loadCommicsByCharacter(),
      _loadEventsByCharacter(),
      _loadSeriesByCharacter(),
      _loadStoriesByCharacter()
    ]);
    _stopLoading();
  }

  Future<void> _loadCommicsByCharacter() async {
    try {
      comics = await _heroServices.getComicsByCharacters(selectedCharacter!.id);
    } catch (e) {
      GlobalErrorHandler.handleError(e, fileName: 'home_provider');
    }
  }

  Future<void> _loadEventsByCharacter() async {
    try {
      events = await _heroServices.getEventsCharacters(selectedCharacter!.id);
    } catch (e) {
      GlobalErrorHandler.handleError(e, fileName: 'home_provider');
    }
  }

  Future<void> _loadSeriesByCharacter() async {
    try {
      series = await _heroServices.getSeriesCharacters(selectedCharacter!.id);
    } catch (e) {
      GlobalErrorHandler.handleError(e, fileName: 'home_provider');
    }
  }

  Future<void> _loadStoriesByCharacter() async {
    try {
      stories = await _heroServices.getStoriesCharacters(selectedCharacter!.id);
    } catch (e) {
      GlobalErrorHandler.handleError(e, fileName: 'home_provider');
    }
  }
}
