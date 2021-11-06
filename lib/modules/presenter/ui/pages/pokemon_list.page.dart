import 'package:flutter/material.dart';
import 'package:pokedex/modules/presenter/ui/components/card_pokemon/card_pokemon_component.dart';
import 'package:pokedex/modules/presenter/ui/controllers/pokemon_list.controller.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  PokemonListController _controller = PokemonListController();
  @override
  Widget build(BuildContext context) {
    _controller.getPokemonList();
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _controller.pokemonList?.length ?? 0,
          itemBuilder: (context, i) {
            return Container(
                child: CardPokemon(
              elements: _controller.pokemonList![i].type,
              name: _controller.pokemonList![i].name,
              srcImg: _controller.pokemonList![i].img,
            ));
          },
        ),
      ),
    );
  }
}

//Text('${_controller.pokemonList![i].name} POKEMON')
