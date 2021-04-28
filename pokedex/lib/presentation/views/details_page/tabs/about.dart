import 'package:flutter/material.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/models/pokemon.dart';
import 'package:pokedex/extensions/string_capitalization.dart';

class PokeDetailsAbout extends StatelessWidget {
  final Pokemon pokemon;

  const PokeDetailsAbout({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 15),
        child: Table(
          border: TableBorder.all(
            width: 0,
            style: BorderStyle.none,
          ),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(1 / 2),
            1: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            infoRow("Species", pokemon.species.name.capitalize()),
            infoRow("Height", "${(pokemon.height * 10).toString()} cm"),
            infoRow("Weight", "${(pokemon.weight / 10).toString()} kg"),
            infoRow(
              "Abilities",
              pokemon.abilities.map((ability) {
                return ability.name.capitalize();
              }).join(", "),
            ),
          ],
        ),
      ),
    );
  }
}

TableRow infoRow(String rowLabel, String rowValue) {
  return TableRow(
    children: [
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            rowLabel,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            rowValue,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    ],
  );
}
