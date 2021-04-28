import 'package:flutter/material.dart';
import 'package:pokedex/data/models/pokemon.dart';

class PokemonMoves extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonMoves({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(pokemon.moves.first.name);

    List<Widget> moveWidgets = List.empty(growable: true);

    pokemon.moves.forEach((move) {
      var moveWidget = new Row(
        children: [
          Text(move.name),
          Text(move.learnedAtLevel.toString()),
          Text(move.url),
        ],
      );
      moveWidgets.add(moveWidget);
    });

    return Container(
      padding: EdgeInsets.all(20),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        shrinkWrap: false,
        primary: true,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: moveWidgets,
              );
            }),
          ),
        ],
      ),
    );
  }
}
