class Ability {
  late String name;
  late String url;

  Ability({
    required this.name,
    required this.url,
  });

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['ability']['name'];
    url = json['ability']['url'];
  }
}
