import 'package:flutter/material.dart';
import 'package:pokedex/data/models/pokemon.dart';

class PokemonEvolutions extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonEvolutions({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(pokemon.species.name);
    return Container(
      padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 15),
      child: Text("Evolutions"),
    );
  }
}
