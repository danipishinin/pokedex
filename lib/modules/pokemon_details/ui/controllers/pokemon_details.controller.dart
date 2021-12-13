import 'package:pokedex/modules/pokemon_list/domain/usecases/usecase_ui.dart';

class PokemonDetailsController {
  UseCaseUI _useCaseUI = UseCaseUI();

  getColorCard(String type) {
    return _useCaseUI.getColorByType(type);
  }
}
