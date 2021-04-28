import 'package:flutter/material.dart';
import 'package:pokedex/data/models/pokemon.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';

class PokemonStore extends ChangeNotifier {
  final PokemonRepository _repository = PokemonRepository();
  final List<Pokemon> _pokemonList = List.empty(growable: true);

  int _pokedexPage = 1;
  bool _loading = false;
  Pokemon? _currentPokemon;

  bool get isLoading => _loading;
  List<Pokemon> get getPokemonList => _pokemonList;
  Pokemon? get getCurrentPokemon => _currentPokemon;

  void setCurrentPokemonById(int pokemonId) {
    _currentPokemon = _pokemonList.singleWhere(
      (pokemon) => pokemon.id == pokemonId,
    );
  }

  void setCurrentPokemon(Pokemon pokemon) {
    _currentPokemon = pokemon;
  }

  Future<Pokemon?> getPokemon(int pokemonId) async {
    try {
      return await _repository.getPokemon(pokemonId);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future getPokedex() async {
    for (var i = 1; i <= 20; i++) {
      try {
        addPokemon(await _repository.getPokemon(_pokedexPage));
        _pokedexPage++;
      } catch (error) {
        print(error.toString());
      }
    }
  }

  void addPokemon(Pokemon pokemon) {
    _pokemonList.add(pokemon);
    notifyListeners();
  }

  void setLoading(value) {
    _loading = value;
  }
}
