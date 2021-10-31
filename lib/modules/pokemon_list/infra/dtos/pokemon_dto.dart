import 'evolution_dto.dart';

class PokemonDTO {
  final int? id;
  final String? number;
  final String? name;
  final String? img;
  final List<String>? type;
  final String? height;
  final String? weight;
  final String? candy;
  final int? candyCount;
  final String? egg;
  final double? spawnChance;
  final double? avgSpawns;
  final String? spawnTime;
  final List<double>? multipliers;
  final List<String>? weaknesses;
  final List<EvolutionDTO>? nextEvolution;
  final List<EvolutionDTO>? prevEvolution;

  PokemonDTO({
    this.id,
    this.number,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
    this.prevEvolution,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'num': number,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'candy_count': candyCount,
      'egg': egg,
      'spawn_chance': spawnChance,
      'avg_spawns': avgSpawns,
      'spawn_time': spawnTime,
      'multipliers': multipliers,
      'weaknesses': weaknesses,
      'nextEvolution': nextEvolution?.map((x) => x.toMap()).toList(),
      'prevEvolution': prevEvolution?.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonDTO.fromMap(Map<String, dynamic> map) {
    List<String> type = [];
    List<double> multipliers = [];
    List<String> weaknesses = [];
    List<EvolutionDTO> nextEvolution = [];
    List<EvolutionDTO> prevEvolution = [];

    if (map["type"] != null) {
      type = List<String>.from(map['type']);
    }
    if (map["multipliers"] != null) {
      multipliers = List<double>.from(map['multipliers']);
    }
    if (map["weaknesses"] != null) {
      weaknesses = List<String>.from(map['weaknesses']);
    }
    if (map["next_evolution"] != null) {
      nextEvolution = List<EvolutionDTO>.from(
          map['next_evolution']?.map((x) => EvolutionDTO.fromMap(x)));
    }
    if (map["prev_evolution"] != null) {
      prevEvolution = List<EvolutionDTO>.from(
          map['prev_evolution']?.map((x) => EvolutionDTO.fromMap(x)));
    }

    return PokemonDTO(
      id: map['id'],
      number: map['num'] ?? "",
      name: map['name'] ?? "",
      img: map['img'] ?? "",
      type: type,
      height: map['height'] ?? "",
      weight: map['weight'] ?? "",
      candy: map['candy'] ?? "",
      candyCount: map['candy_count'] ?? 0,
      egg: map['egg'] ?? "",
      spawnChance:
          map['spawn_chance'] != null ? map["spawn_chance"] * 1.0 : 0.0,
      avgSpawns: map['avg_spawns'] != null ? map['avg_spawns'] * 1.0 : 0.0,
      spawnTime: map['spawn_time'] ?? "",
      multipliers: multipliers,
      weaknesses: weaknesses,
      nextEvolution: nextEvolution,
      prevEvolution: prevEvolution,
    );
  }
}
