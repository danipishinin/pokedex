import 'package:pokedex/modules/pokemon_list/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/modules/pokemon_list/external/datasources/pokemon_datasource_impl.dart';
import 'package:pokedex/modules/pokemon_list/infra/dtos/pokemon_dto.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonDataSourceImpl _datasource = PokemonDataSourceImpl();

  @override
  Future<List<PokemonDTO>> findAllPokemons() async {
    var response = await _datasource.findAll();
    if (response.length > 0) {
      print('SUCCESS - [200] ${response.length} POKEMONS ENCONTRADOS');
      return response;
    }
    return throw new Exception('ERRO [404] - NENHUM POKEMON ENCONTRADO');
  }
}
