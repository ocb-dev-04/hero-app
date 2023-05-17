import 'package:app/src/application/view_models/character.view_model.dart';
import 'package:app/src/application/view_models/comic.view_model.dart';
import 'package:app/src/application/view_models/event.view_model.dart';
import 'package:app/src/application/view_models/serie.view_model.dart';
import 'package:app/src/application/view_models/story.view_model.dart';
import 'package:app/src/domain/abstractions/application/services/heroes_services.contract.dart';
import 'package:app/src/domain/abstractions/infrastructure/data/remote/http_repository.contract.dart';
import 'package:app/src/domain/models/base_http_response.model.dart';
import 'package:app/src/infrastructure/data/remote/http/http_repository.impl.dart';
import 'package:app/src/utils/constants/http.dart';

/// [HeroesServicesContract] implementation
class HeroesService implements HeroesServicesContract {
  late HttpRepositoryContract _httpRepository;

  HeroesService() {
    _httpRepository = HttpRepository.instance;
  }

  @override
  Future<List<CharacterViewModel>> getCharacters() async {
    final parsed = await _requestData(KHttpConstants.charactersCollection);
    return parsed.results!.map((e) => CharacterViewModel.fromJson(e)).toList();
  }

  @override
  Future<List<ComicViewModel>> getComicsByCharacters(int characterId) async {
    final parsed = await _requestData(KHttpConstants.characterComicDetails
        .replaceAll("@characterId", characterId.toString()));
    return parsed.results!.map((e) => ComicViewModel.fromJson(e)).toList();
  }

  @override
  Future<List<EventViewModel>> getEventsCharacters(int characterId) async {
    final parsed = await _requestData(KHttpConstants.characterEventDetails
        .replaceAll("@characterId", characterId.toString()));
    return parsed.results!.map((e) => EventViewModel.fromJson(e)).toList();
  }

  @override
  Future<List<SerieViewModel>> getSeriesCharacters(int characterId) async {
    final parsed = await _requestData(KHttpConstants.characterSeriesDetails
        .replaceAll("@characterId", characterId.toString()));
    return parsed.results!.map((e) => SerieViewModel.fromJson(e)).toList();
  }

  @override
  Future<List<StoryViewModel>> getStoriesCharacters(int characterId) async {
    final parsed = await _requestData(KHttpConstants.characterStoriesDetails
        .replaceAll("@characterId", characterId.toString()));
    return parsed.results!.map((e) => StoryViewModel.fromJson(e)).toList();
  }

  Future<BaseHttpResponse> _requestData(String path) async {
    final result = await _httpRepository.get(path: path);
    return BaseHttpResponse.fromJson(result.data['data']);
  }
}
