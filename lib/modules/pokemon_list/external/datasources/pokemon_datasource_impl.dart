import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/modules/pokemon_list/infra/datasources/pokemon_datasource.dart';
import 'package:pokedex/modules/pokemon_list/infra/dtos/pokemonDTO.dart';

class PokemonDataSourceImpl implements PokemonDatasource {
  var options = BaseOptions(
    baseUrl: './pokedex.json',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  Dio dio = Dio();

  PokemonDataSourceImpl() {
    dio = Dio(options);
  }

  @override
  Future<List<PokemonDTO>> findAll() async {
    var response = await dio.get(dio.options.baseUrl);

    final List<PokemonDTO> pokemonList = [];
    var json = jsonDecode(response.data);
    var rawList = json["pokemon"];

    for (var map in rawList) {
      pokemonList.add(PokemonDTO.fromMap(map));
    }

    return pokemonList;
  }
}
