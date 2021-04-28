import 'package:flutter/material.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/models/pokemon.dart';
import 'package:pokedex/data/models/stat.dart';
import 'package:pokedex/extensions/string_capitalization.dart';

class PokemonDetailsStats extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsStats({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 15),
        child: Table(
          border: TableBorder.all(width: 0, style: BorderStyle.none),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(2 / 6),
            1: FlexColumnWidth(1 / 6),
            2: FlexColumnWidth(3 / 6),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: tableRows(context, pokemon.stats),
        ),
      ),
    );
  }

  List<TableRow> tableRows(BuildContext context, List<Stat> stats) {
    List<TableRow> rows = List.empty(growable: true);

    stats.forEach((stat) {
      var row = TableRow(
        children: [
          TableCell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                stat.name.capitalize(),
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          TableCell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Text(
                stat.baseStat.toString().capitalize(),
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TableCell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              // margin: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.lightGrey,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 5,
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          var statPercentage =
                              (double.parse(stat.baseStat.toString()) / 100);
                          var statWidth = constraints.maxWidth * statPercentage;

                          return Container(
                            width: statWidth,
                            height: 5,
                            color: statPercentage > 0.5
                                ? AppColors.green
                                : AppColors.red,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      );

      rows.add(row);
    });

    return rows;
  }
}
