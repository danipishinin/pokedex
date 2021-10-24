import 'dart:convert';

import 'package:pokedex/modules/pokemon_list/domain/entities/evolution.dart';

class EvolutionDTO extends Evolution {
  EvolutionDTO.fromMap(Map<String, dynamic> json)
      : super(
          number: json['num'],
          name: json['name'],
        );

  Map<String, dynamic> toMap() {
    return {
      'num': number,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  factory EvolutionDTO.fromJson(String source) =>
      EvolutionDTO.fromMap(json.decode(source));
}
