import 'package:flutter/material.dart';

class CardColors {
  Color? getColorByType(String type) {
    final colorSwatch = 400;
    switch (type) {
      case 'Normal':
        return Colors.brown[colorSwatch];
      case 'Fire':
        return Colors.red[colorSwatch];
      case 'Water':
        return Colors.blue[colorSwatch];
      case 'Grass':
        return Colors.green[colorSwatch];
      case 'Electric':
        return Colors.amber[colorSwatch];
      case 'Ice':
        return Colors.cyanAccent[colorSwatch];
      case 'Fighting':
        return Colors.deepOrange[colorSwatch];
      case 'Poison':
        return Colors.purple[colorSwatch];
      case 'Ground':
        return Colors.orange[colorSwatch];
      case 'Flying':
        return Colors.indigo[colorSwatch];
      case 'Psychic':
        return Colors.pink[colorSwatch];
      case 'Bug':
        return Colors.lightGreen[colorSwatch];
      case 'Rock':
        return Colors.grey[colorSwatch];
      case 'Ghost':
        return Colors.indigo[colorSwatch];
      case 'Dark':
        return Colors.brown[colorSwatch];
      case 'Dragon':
        return Colors.indigo[colorSwatch];
      case 'Steel':
        return Colors.blueGrey[colorSwatch];
      case 'Fairy':
        return Colors.pinkAccent[colorSwatch];
      default:
        return Colors.grey[colorSwatch];
    }
  }
}
