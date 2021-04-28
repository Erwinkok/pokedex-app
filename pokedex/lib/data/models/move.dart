class Move {
  late String name;
  late String url;
  late int learnedAtLevel;

  Move({
    required this.name,
    required this.url,
    required this.learnedAtLevel,
  });

  Move.fromJson(Map<String, dynamic> json) {
    name = json['move']['name'];
    url = json['move']['url'];
    learnedAtLevel = json['version_group_details'][0]['level_learned_at'];
  }
}
