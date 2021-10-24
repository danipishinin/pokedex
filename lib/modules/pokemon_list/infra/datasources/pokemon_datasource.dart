import 'package:pokedex/modules/pokemon_list/infra/dtos/pokemonDTO.dart';

abstract class PokemonDatasource {
  Future<List<PokemonDTO>> findAll();
}
