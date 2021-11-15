import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pokedex/modules/pokemon_list/ui/components/card_pokemon/card_pokemon_component.dart';
import 'package:pokedex/modules/pokemon_list/ui/controllers/pokemon_list.controller.dart';

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
        child: StaggeredGridView.extentBuilder(
          maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 0,
          itemCount: _controller.pokemonList?.length ?? 0,
          itemBuilder: (context, i) {
            return CardPokemon(
              elements: _controller.pokemonList![i].type,
              name: _controller.pokemonList![i].name,
              id: _controller.pokemonList![i].number,
            );
          },
          staggeredTileBuilder: (i) => StaggeredTile.fit(1),
        ),
      ),
    );
  }
}
