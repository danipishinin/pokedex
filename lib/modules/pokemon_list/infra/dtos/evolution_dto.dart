import 'dart:convert';

class EvolutionDTO {
  final String? number;
  final String? name;

  EvolutionDTO({
    this.number,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
    };
  }

  factory EvolutionDTO.fromMap(Map<String, dynamic> map) {
    return EvolutionDTO(
      number: map['number'] != null ? map['number'] : null,
      name: map['name'] != null ? map['name'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionDTO.fromJson(String source) =>
      EvolutionDTO.fromMap(json.decode(source));

  EvolutionDTO copyWith({
    String? number,
    String? name,
  }) {
    return EvolutionDTO(
      number: number ?? this.number,
      name: name ?? this.name,
    );
  }
}
