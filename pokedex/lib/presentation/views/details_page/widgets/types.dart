import 'package:flutter/material.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/models/pokemon.dart';

class Types extends StatelessWidget {
  final Pokemon pokemon;

  const Types({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pokemon.types.length == 0) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: pokemon.types.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(100),
                borderRadius: BorderRadius.circular(30.0),
              ),
              margin: EdgeInsets.only(right: 5),
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
    );
  }
}
