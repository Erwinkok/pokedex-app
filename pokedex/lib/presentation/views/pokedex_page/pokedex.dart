import 'package:flutter/material.dart';
import 'package:pokedex/business_logic/pokemon_store.dart';
import 'package:pokedex/presentation/components/navigation_bar.dart';
import 'package:pokedex/presentation/views/pokedex_page/widgets/pokemon_grid_view.dart';
import 'package:provider/provider.dart';
import '../../../config/theme.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  Future fetchPokemonData() async {
    await Provider.of<PokemonStore>(context, listen: false).getPokedex();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    fetchPokemonData();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -(screenSize.width / 2.25),
                  right: -(screenSize.width / 2.5),
                  width: screenSize.width,
                  height: screenSize.width,
                  child: Opacity(
                    opacity: 0.1,
                    child: Image(
                      image: AssetImage("assets/images/background-logo.png"),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NavigationBar(),
                    Title("Pokédex"),
                  ],
                ),
              ],
            ),
            PokemonGridView(),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;

  Title(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
