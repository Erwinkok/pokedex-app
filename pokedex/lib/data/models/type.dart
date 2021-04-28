class Type {
  late int slot;
  late String name;
  late String url;

  Type({
    required this.slot,
    required this.name,
    required this.url,
  });

  Type.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    name = json['type']['name'];
    url = json['type']['url'];
  }
}
