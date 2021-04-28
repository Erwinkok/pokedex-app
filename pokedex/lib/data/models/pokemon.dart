import './ability.dart';
import './move.dart';
import './specie.dart';
import './stat.dart';
import './type.dart';

class Pokemon {
  late int id;
  late int order;
  late int height;
  late int weight;
  late String name;
  late Specie species;
  List<Move> moves = List.empty(growable: true);
  List<Type> types = List.empty(growable: true);
  List<Stat> stats = List.empty(growable: true);
  List<Ability> abilities = List.empty(growable: true);

  Pokemon({
    required this.id,
    required this.order,
    required this.name,
    required this.height,
    required this.weight,
    required this.species,
    required this.moves,
    required this.types,
    required this.stats,
    required this.abilities,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    weight = json['weight'];
    height = json['height'];
    species = new Specie.fromJson(json['species']);

    json['moves'].forEach((v) {
      moves.add(new Move.fromJson(v));
    });

    json['types'].forEach((v) {
      types.add(new Type.fromJson(v));
    });

    json['stats'].forEach((v) {
      stats.add(new Stat.fromJson(v));
    });

    json['abilities'].forEach((ability) {
      abilities.add(new Ability.fromJson(ability));
    });
  }
}
