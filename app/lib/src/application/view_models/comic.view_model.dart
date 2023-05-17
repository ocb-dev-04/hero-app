import 'package:app/src/application/view_models/base/shared.view_model.dart';

class ComicViewModel extends SharedViewModel {
  int digitalId;
  String description;

  ComicViewModel({
    required super.id,
    required super.title,
    required this.digitalId,
    required this.description,
  });

  factory ComicViewModel.fromJson(Map<String, dynamic> json) => ComicViewModel(
      id: json["id"],
      digitalId: json["digitalId"],
      title: json["title"],
      description: json["description"] ?? '');
}
