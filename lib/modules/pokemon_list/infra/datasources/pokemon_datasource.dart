import 'package:pokedex/modules/pokemon_list/infra/dtos/pokemon_dto.dart';

abstract class PokemonDatasource {
  Future<List<PokemonDTO>> findAll();
}
