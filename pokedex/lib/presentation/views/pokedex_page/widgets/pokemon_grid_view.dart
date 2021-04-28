import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/business_logic/pokemon_store.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/models/pokemon.dart';
import 'package:pokedex/presentation/views/details_page/pokemon_detail_page.dart';
import 'package:pokedex/presentation/views/pokedex_page/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonGridView extends StatefulWidget {
  @override
  _PokemonGridViewState createState() => _PokemonGridViewState();
}

class _PokemonGridViewState extends State<PokemonGridView> {
  late final ScrollController _controller;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      var provider = Provider.of<PokemonStore>(context, listen: false);
      if (provider.isLoading == false) {
        provider.getPokedex();
      }
    }
  }

  @override
  void initState() {
    _controller = new ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var store = context.watch<PokemonStore>();

    if (store.getPokemonList.length <= 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      child: Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          clipBehavior: Clip.none,
          child: GridView.builder(
            controller: _controller,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 2,
            ),
            itemCount: store.getPokemonList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Pokemon pokemon = store.getPokemonList[index];

              return Container(
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.getColorForType(
                    pokemon.types.first.name,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: GestureDetector(
                  child: PokemonCard(pokemon: pokemon),
                  onTap: () {
                    store.setCurrentPokemon(pokemon);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PokemonDetailPage();
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
