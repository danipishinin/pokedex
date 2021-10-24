import 'package:pokedex/modules/pokemon_list/infra/dtos/evolutionDTO.dart';

class Pokemon {
  final int id;
  final String number;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final int candyCount;
  final String egg;
  final double spawnChance;
  final int avgSpawns;
  final String spawnTime;
  final List<double> multipliers;
  final List<String> weaknesses;
  final List<EvolutionDTO> nextEvolution;

  Pokemon({
    required this.id,
    required this.number,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
  });
}
