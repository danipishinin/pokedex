import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.green,
      child: Text('Hello World'),
    );
  }
}
