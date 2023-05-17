import 'package:app/src/application/view_models/base/shared.view_model.dart';

class StoryViewModel extends SharedViewModel {
  String description;

  StoryViewModel({
    required super.id,
    required super.title,
    required this.description,
  });

  factory StoryViewModel.fromJson(Map<String, dynamic> json) => StoryViewModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );
}
