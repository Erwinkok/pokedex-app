class Stat {
  late int baseStat;
  late int effort;
  late String name;
  late String url;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.name,
    required this.url,
  });

  Stat.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    name = json['stat']['name'];
    url = json['stat']['url'];
  }
}
