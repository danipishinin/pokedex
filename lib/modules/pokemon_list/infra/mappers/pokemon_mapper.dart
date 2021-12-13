import 'package:pokedex/core/mappers/mapper.dart';
import 'package:pokedex/modules/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokedex/modules/pokemon_list/infra/dtos/evolution_dto.dart';
import 'package:pokedex/modules/pokemon_list/infra/dtos/pokemon_dto.dart';

import 'evolution_mapper.dart';

class PokemonMapper implements Mapper<PokemonDTO, Pokemon> {
  final _evoMapper = EvolutionMapper();
  @override
  Pokemon from([PokemonDTO? dto]) {
    List<EvolutionDTO>? nextEvoList = [];
    if (dto?.nextEvolution != null) {
      nextEvoList =
          dto!.nextEvolution!.map((e) => _evoMapper.from(e)).toList().cast();
    }

    List<EvolutionDTO>? prevEvoList = [];
    if (dto?.prevEvolution != null) {
      prevEvoList =
          dto!.prevEvolution!.map((e) => _evoMapper.from(e)).toList().cast();
    }

    return Pokemon(
      id: dto?.id,
      number: dto?.number ?? "",
      name: dto?.name ?? "",
      img: dto?.img ?? "",
      type: dto?.type ?? [],
      height: dto?.height ?? "",
      weight: dto?.weight ?? "",
      candy: dto?.candy ?? "",
      candyCount: dto?.candyCount ?? 0,
      egg: dto?.egg ?? "",
      spawnChance: dto?.spawnChance ?? 0.0,
      avgSpawns: dto?.avgSpawns ?? 0.0,
      spawnTime: dto?.spawnTime ?? "",
      multipliers: dto?.multipliers ?? [],
      weaknesses: dto?.weaknesses ?? [],
      nextEvolution: nextEvoList ?? [],
      prevEvolution: prevEvoList ?? [],
    );
  }

  @override
  PokemonDTO to([Pokemon? pokemon]) {
    List<EvolutionDTO> prevEvoDtoList = [];
    if (pokemon?.prevEvolution != null) {
      prevEvoDtoList = pokemon!.prevEvolution!
          .map((e) => _evoMapper.from(e))
          .toList()
          .cast();
    }

    List<EvolutionDTO> nextEvoDtoList = [];
    if (pokemon?.nextEvolution != null) {
      nextEvoDtoList = pokemon!.nextEvolution!
          .map((e) => _evoMapper.from(e))
          .toList()
          .cast();
    }

    return PokemonDTO(
      id: pokemon?.id,
      number: pokemon?.number ?? "",
      name: pokemon?.name ?? "",
      img: pokemon?.img ?? "",
      type: pokemon?.type ?? [],
      height: pokemon?.height ?? "",
      weight: pokemon?.weight ?? "",
      candy: pokemon?.candy ?? "",
      candyCount: pokemon?.candyCount ?? 0,
      egg: pokemon?.egg ?? "",
      spawnChance: pokemon?.spawnChance ?? 0.0,
      avgSpawns: pokemon?.avgSpawns ?? 0.0,
      spawnTime: pokemon?.spawnTime ?? "",
      multipliers: pokemon?.multipliers ?? [],
      weaknesses: pokemon?.weaknesses ?? [],
      nextEvolution: nextEvoDtoList ?? [],
      prevEvolution: prevEvoDtoList ?? [],
    );
  }
}
