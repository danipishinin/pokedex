import 'package:pokedex/modules/pokemon_list/infra/dtos/pokemon_dto.dart';

abstract class PokemonRepository {
  Future<List<PokemonDTO>> findAllPokemons();
}
