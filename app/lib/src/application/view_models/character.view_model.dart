class CharacterViewModel {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceUri;

  CharacterViewModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.modified,
      required this.thumbnail,
      required this.resourceUri});

  factory CharacterViewModel.fromJson(Map<String, dynamic> json) =>
      CharacterViewModel(
          id: json["id"],
          name: json["name"],
          description: json["description"],
          modified: json["modified"],
          thumbnail: Thumbnail.fromJson(json["thumbnail"]),
          resourceUri: json["resourceURI"]);
}

class Thumbnail {
  String path;
  String extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );
}
