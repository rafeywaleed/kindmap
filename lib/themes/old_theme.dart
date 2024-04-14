import 'package:flutter/material.dart';

abstract class LightColors {
  static final primary = Color(#D6E5151E as int);
  static final secondary = Color(#FFFFFF as int);
  static final tertiary = Color(#FAC6C3 as int);
  static final primaryText = Color(#FAC6C3 as int);
  static final secondaryBackground = Color(#F1F4F8 as int);
}

abstract class DarkColors {
  static final primary = Color(#FFFFFF as int);
  static final secondary = Color(#D6E5151E as int);
  static const tertiary = Color.fromARGB(100, 94, 94, 94);
  static final primaryText = Color(#FFFFFF as int);
  static const secondaryBackground = Color.fromARGB(100, 20, 24, 27);
}

class CustomTheme {
  static final lightBase = ThemeData.light();
  static final darkBase = ThemeData.dark();

  ThemeData get light => ThemeData(
        brightness: Brightness.light,
      );

  ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
      );
}
