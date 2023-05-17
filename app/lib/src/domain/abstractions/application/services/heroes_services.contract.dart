import 'package:app/src/application/view_models/character.view_model.dart';
import 'package:app/src/application/view_models/comic.view_model.dart';
import 'package:app/src/application/view_models/event.view_model.dart';
import 'package:app/src/application/view_models/serie.view_model.dart';
import 'package:app/src/application/view_models/story.view_model.dart';

abstract class HeroesServicesContract {
  Future<List<CharacterViewModel>> getCharacters();

  Future<List<ComicViewModel>> getComicsByCharacters(int characerId);
  Future<List<EventViewModel>> getEventsCharacters(int characterId);
  Future<List<SerieViewModel>> getSeriesCharacters(int characterId);
  Future<List<StoryViewModel>> getStoriesCharacters(int characterId);
}
