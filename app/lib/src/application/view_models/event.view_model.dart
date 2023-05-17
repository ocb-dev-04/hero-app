import 'package:app/src/application/view_models/base/shared.view_model.dart';

class EventViewModel extends SharedViewModel {
  DateTime start;
  DateTime end;

  EventViewModel({
    required super.id,
    required super.title,
    required this.start,
    required this.end,
  });

  factory EventViewModel.fromJson(Map<String, dynamic> json) => EventViewModel(
      id: json["id"],
      title: json["title"],
      start: DateTime.parse(json["start"]),
      end: DateTime.parse(json["end"]));
}
