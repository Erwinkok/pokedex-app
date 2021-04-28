import 'package:flutter/material.dart';
import 'package:pokedex/config/api.dart';
import 'package:pokedex/data/models/pokemon.dart';

class PokemonImage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonImage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Hero(
          tag: 'pokemon_image${pokemon.id}',
          child: FadeInImage.assetNetwork(
            image: "${Api.imageBaseUrl}${pokemon.id}.png",
            placeholder: "",
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
