import 'package:app/src/application/view_models/base/shared.view_model.dart';

class SerieViewModel extends SharedViewModel {
  int startYear;
  int endYear;

  SerieViewModel({
    required super.id,
    required super.title,
    required this.startYear,
    required this.endYear,
  });

  factory SerieViewModel.fromJson(Map<String, dynamic> json) => SerieViewModel(
        id: json["id"],
        title: json["title"],
        startYear: json["startYear"],
        endYear: json["endYear"],
      );
}
