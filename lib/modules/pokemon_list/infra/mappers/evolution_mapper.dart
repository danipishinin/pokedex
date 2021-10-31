import 'package:pokedex/core/mappers/mapper.dart';
import 'package:pokedex/modules/pokemon_list/domain/entities/evolution.dart';
import 'package:pokedex/modules/pokemon_list/infra/dtos/evolution_dto.dart';

class EvolutionMapper implements Mapper<EvolutionDTO, Evolution> {
  @override
  Evolution from([EvolutionDTO? dto]) {
    return Evolution(
      number: dto?.number ?? "",
      name: dto?.name ?? "",
    );
  }

  @override
  EvolutionDTO to([Evolution? evo]) {
    return EvolutionDTO(
      number: evo?.number ?? "",
      name: evo?.name ?? "",
    );
  }
}
