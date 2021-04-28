import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/data/models/pokemon.dart';
import 'package:pokedex/data/providers/pokemon_api.dart';

class PokemonRepository {
  late final PokemonApi _pokemonApi;

  PokemonRepository() {
    this._pokemonApi = new PokemonApi();
  }

  Future<Pokemon> getPokemon(int pokemonId) async {
    final rawPokemon = await _pokemonApi.getRawPokemon(pokemonId);

    if (rawPokemon.statusCode != 200) {
      throw ErrorDescription("Pokemon not found");
    }

    final Pokemon pokemon = Pokemon.fromJson(json.decode(rawPokemon.body));

    return pokemon;
  }
}
