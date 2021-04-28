import 'package:flutter/material.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/presentation/views/home_page/widgets/heading.dart';
import 'package:pokedex/presentation/views/home_page/widgets/quick_nav_card.dart';
import 'package:pokedex/presentation/views/home_page/widgets/search_field.dart';
import 'package:pokedex/presentation/views/pokedex_page/pokedex.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(text: "What pokemon\nare you looking for?"),
            SearchField(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: GridView(
                clipBehavior: Clip.none,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 4 / 2,
                ),
                children: [
                  QuickNavCard(
                    text: "Pokedex",
                    color: AppColors.green,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Pokedex(),
                        ),
                      );
                    },
                  ),
                  QuickNavCard(
                    text: "Moves",
                    color: AppColors.red,
                    onTap: () {},
                  ),
                  QuickNavCard(
                    text: "Abilities",
                    color: AppColors.blue,
                    onTap: () {},
                  ),
                  QuickNavCard(
                    text: "Items",
                    color: AppColors.yellow,
                    onTap: () {},
                  ),
                  QuickNavCard(
                    text: "Locations",
                    color: AppColors.purple,
                    onTap: () {},
                  ),
                  QuickNavCard(
                    text: "Type Charts",
                    color: AppColors.brown,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
