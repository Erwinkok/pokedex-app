import 'package:flutter/material.dart';
import 'package:pokedex/config/api.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/models/pokemon.dart';
import 'package:pokedex/extensions/string_capitalization.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -50,
          right: -50,
          width: 180,
          height: 180,
          child: Opacity(
            opacity: 0.1,
            child: Image.asset(
              "assets/images/background-logo-light.png",
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          width: 100,
          height: 100,
          child: Hero(
            tag: 'pokemon_image${pokemon.id}',
            child: Image.network(
              "${Api.imageBaseUrl}${pokemon.id}.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name.capitalize(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                clipBehavior: Clip.none,
                itemCount: pokemon.types.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (pokemon.types.length == 0) {
                    return Container();
                  }

                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(100),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      margin: EdgeInsets.only(bottom: 5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 3.0,
                          horizontal: 10.0,
                        ),
                        child: Text(
                          pokemon.types[index].name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
