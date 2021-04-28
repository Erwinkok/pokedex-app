import 'package:flutter/material.dart';
import 'package:pokedex/presentation/views/details_page/widgets/basic_info.dart';
import 'package:pokedex/presentation/views/details_page/widgets/info_tabs.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/data/models/pokemon.dart';
import 'package:pokedex/business_logic/pokemon_store.dart';
import 'package:pokedex/presentation/views/details_page/tabs/about.dart';
import 'package:pokedex/presentation/views/details_page/tabs/stats.dart';
import 'package:pokedex/presentation/views/details_page/widgets/types.dart';
import 'package:pokedex/presentation/views/details_page/widgets/pokebal_background.dart';
import 'package:pokedex/presentation/views/details_page/widgets/pokemon_image.dart';
import 'package:pokedex/presentation/views/details_page/widgets/pokemon_name.dart';

import 'package:pokedex/config/theme.dart';

class PokemonDetailPage extends StatefulWidget {
  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    var pokemon = context.select<PokemonStore, Pokemon?>(
      (store) => store.getCurrentPokemon,
    );

    if (pokemon == null) {
      Navigator.of(context).pop();
    }

    var backgroudColor = AppColors.getColorForType(pokemon!.types.first.name);

    return Scaffold(
      backgroundColor: backgroudColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroudColor,
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_back),
          color: AppColors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.favorite_border),
            color: AppColors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) => PokemonStore(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PokebalBackground(),
            BasicInfo(pokemon: pokemon),
            InfoTabs(pokemon: pokemon),
            PokemonImage(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
