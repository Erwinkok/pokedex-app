import 'package:flutter/material.dart';
import 'package:pokedex/data/models/pokemon.dart';
import 'package:pokedex/presentation/views/details_page/widgets/pokemon_name.dart';
import 'package:pokedex/presentation/views/details_page/widgets/types.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PokemonName(pokemon: pokemon),
        Types(pokemon: pokemon),
      ],
    );
  }
}
