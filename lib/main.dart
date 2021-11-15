import 'package:flutter/material.dart';
import 'package:pokedex/modules/splashscreen/ui/pages/splashscreen_page.dart';

import 'core/styles/raised_button_style.dart';

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
      home: SplashScreen(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
      ),
    );
  }
}
