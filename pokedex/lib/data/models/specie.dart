class Specie {
  late String name;
  late String url;

  Specie({
    required this.name,
    required this.url,
  });

  Specie.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
