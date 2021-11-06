import 'package:flutter/material.dart';
import 'package:pokedex/modules/presenter/ui/pages/pokemon_list.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      home: PokemonListPage(),
      theme: ThemeData(
      ),
    );
  }
}
