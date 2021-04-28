import 'package:flutter/material.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/models/pokemon.dart';
import 'package:pokedex/presentation/views/details_page/tabs/about.dart';
import 'package:pokedex/presentation/views/details_page/tabs/evolutions.dart';
import 'package:pokedex/presentation/views/details_page/tabs/moves.dart';
import 'package:pokedex/presentation/views/details_page/tabs/stats.dart';

import '../pokemon_detail_page.dart';

class InfoTabs extends StatelessWidget {
  const InfoTabs({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 3.5,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: PokemonDetailInformation(pokemon: pokemon),
      ),
    );
  }
}

class PokemonDetailInformation extends StatefulWidget {
  const PokemonDetailInformation({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  _PokemonDetailInformationState createState() =>
      _PokemonDetailInformationState();
}

class _PokemonDetailInformationState extends State<PokemonDetailInformation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    _pageController = new PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: TabBar(
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              controller: _tabController,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w700,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.blue,
              unselectedLabelColor: AppColors.grey,
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    "About",
                    style: TextStyle(fontSize: 16, color: AppColors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Base Stats",
                    style: TextStyle(fontSize: 16, color: AppColors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Evolution",
                    style: TextStyle(fontSize: 16, color: AppColors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Moves",
                    style: TextStyle(fontSize: 16, color: AppColors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          _tabController.animateTo(
            index,
            duration: Duration(milliseconds: 300),
          );
        },
        controller: _pageController,
        children: [
          PokeDetailsAbout(pokemon: widget.pokemon),
          PokemonDetailsStats(pokemon: widget.pokemon),
          PokemonEvolutions(pokemon: widget.pokemon),
          PokemonMoves(pokemon: widget.pokemon),
        ],
      ),
    );
  }
}
