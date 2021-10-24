import 'dart:convert';

import 'package:pokedex/modules/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokedex/modules/pokemon_list/infra/dtos/evolutionDTO.dart';

class PokemonDTO extends Pokemon {
  PokemonDTO.fromMap(Map<String, dynamic> json) : super(
      id: json['id'],
      number: json['num'],
      name: json['name'],
      img: json['img'],
      type: List<String>.from(json['type']),
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      candyCount: json['candy_count'],
      egg: json['egg'],
      spawnChance: json['spawn_chance'],
      avgSpawns: json['avg_spawns'],
      spawnTime: json['spawn_time'],
      multipliers: List<double>.from(json['multipliers']),
      weaknesses: List<String>.from(json['weaknesses']),
      nextEvolution: List<EvolutionDTO>.from(
          json['next_evolution']?.map((x) => EvolutionDTO.fromMap(x))),
  );

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
      'next_evolution': nextEvolution?.map((x) => x.toMap())?.toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory PokemonDTO.fromJson(String source) =>
      PokemonDTO.fromMap(json.decode(source));
}
