import 'package:http/http.dart' as http;
import 'package:pokedex/config/api.dart';

class PokemonApi {
  Future<http.Response> getRawPokemon(int pokemonId) async {
    var uri = Uri.https(Api.baseUrl, Api.apiVersion + "/pokemon/$pokemonId");
    return await http.Client().get(uri);
  }
}
