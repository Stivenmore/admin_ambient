class PodcastModel {
  final String description;
  final String? id;
  final String img;
  final String name;
  final String podcast;
  final String type;
  final String update;
  final String author;

  PodcastModel(
      {required this.description,
      this.id,
      required this.type,
      required this.img,
      required this.name,
      required this.podcast,
      required this.update,
      required this.author});

  factory PodcastModel.fromJson(Map map) {
    return PodcastModel(
        description: map["description"] as String? ?? "",
        id: map["id"] as String? ?? "",
        img: map["img"] as String? ?? "",
        name: map["name"] as String? ?? "",
        podcast: map["podcast"] as String? ?? "",
        update: map["update"] as String? ?? "",
        type: map["type"] as String? ?? "",
        author: map["author"] as String? ?? "...");
  }
}
