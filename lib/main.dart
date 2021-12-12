import 'package:flutter/material.dart';
import 'package:pokedex/modules/pokemon_list/ui/pages/pokemon_list.page.dart';
import 'package:pokedex/modules/splashscreen/ui/pages/splashscreen_page.dart';

import 'core/styles/raised_button_style.dart';
import 'modules/pokemon_details/ui/pages/pokemon_details.page.dart';

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
      initialRoute: '/',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
      ),
      routes: {
        '/': (context) => SplashScreenPage(),
        '/pokemon-list': (context) => PokemonListPage(),
        '/pokemon-details': (context) => PokemonDetailsPage()
      },
    );
  }
}
