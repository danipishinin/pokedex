import 'package:pokedex/modules/pokemon_list/domain/usecases/usecase_ui.dart';
import 'package:pokedex/modules/pokemon_list/infra/dtos/pokemon_dto.dart';
import 'package:pokedex/modules/pokemon_list/infra/repositories/pokemon_repository_impl.dart';

class PokemonListController {
  PokemonRepositoryImpl _repository = PokemonRepositoryImpl();
  List<PokemonDTO>? pokemonList;
  UseCaseUI _useCaseUI = UseCaseUI();

  getPokemonList() async {
    try {
      var result = await _repository.findAllPokemons();
      if (result.isNotEmpty) {
        return pokemonList = result;
      } else {
        return pokemonList = [];
      }
    } catch (e) {
      print('ERROR [???] - FALHA AO BUSCAR POKEMONS');
    } finally {
      print('${pokemonList?.length} POKEMONS ENCONTRADOS');
    }
  }

  getColorCard(String type) {
    return _useCaseUI.getColorByType(type);
  }
}
