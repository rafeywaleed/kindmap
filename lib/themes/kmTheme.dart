// import 'package:flutter/material.dart';

// class CustomColors {
//   late Color primary;
//   late Color secondary;
//   late Color tertiary;
//   late Color alternate;
//   late Color primaryText;
//   late Color secondaryText;
//   late Color primaryBackground;
//   late Color secondaryBackground;
//   late Color accent1;
//   late Color accent2;
//   late Color accent3;
//   late Color accent4;
//   late Color success;
//   late Color warning;
//   late Color error;
//   late Color info;
//   late Color primaryBtnText;
//   late Color lineColor;
//   late Color backgroundComponents;
// }

// class KMTheme {
//   static final lightTheme = ThemeData(
//     brightness: Brightness.light,
//   );

//   static final darkTheme = ThemeData(
//     brightness: Brightness.dark,
//   );

//   static of(BuildContext context) {}
// }

// class LightColors extends CustomColors {
//   LightColors() {
//     primary = const Color(0xD6E5151E);
//     secondary = const Color(0xFFFFFFFF);
//     tertiary = const Color(0xFFFAC6C3);
//     alternate = const Color(0xFFC28C89);
//     primaryText = const Color(0xFF14181B);
//     secondaryText = const Color(0xFF57636C);
//     primaryBackground = const Color(0xFFF1F4F8);
//     secondaryBackground = const Color(0xFFFFFFFF);
//     accent1 = const Color(0xFF4C4B39EF);
//     accent2 = const Color(0xFF4D39D2C0);
//     accent3 = const Color(0xFF4DEE8B60);
//     accent4 = const Color(0xFFCCFFFFFF);
//     success = const Color(0xFF249689);
//     error = const Color(0xFFFF5963);
//     warning = const Color(0xFFF9CF58);
//     info = const Color(0xFFFFFFFF);
//     primaryBtnText = const Color(0xFFFFFFFF);
//     lineColor = const Color(0xFFFFE0E3E7);
//     backgroundComponents = const Color(0xFF1D2428);
//   }
// }

// class DarkColors extends CustomColors {
//   DarkColors() {
//     primary = const Color(0xFFFFFFFF);
//     secondary = const Color(0xD6E5151E);
//     tertiary = const Color(0xFF5E5E5E);
//     alternate = const Color(0xFF0A0808);
//     primaryText = const Color(0xFFFFFFFF);
//     secondaryText = const Color(0xFF95A1AC);
//     primaryBackground = const Color(0xFF1D2428);
//     secondaryBackground = const Color(0xFF14181B);
//     accent1 = const Color(0xFF4C4B39EF);
//     accent2 = const Color(0xFF4D39D2C0);
//     accent3 = const Color(0xFF4DEE8B60);
//     accent4 = const Color(0xFFB2262D34);
//     success = const Color(0xFF249689);
//     warning = const Color(0xFFFF5963);
//     error = const Color(0xFFF9CF58);
//     info = const Color(0xFFFFFFFF);
//     primaryBtnText = const Color(0xFFFFFFFF);
//     lineColor = const Color(0xFF22282F);
//     backgroundComponents = const Color(0xFF1B2428);
//   }
// }

import 'package:flutter/material.dart';

class CustomColors {
  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;
  late Color primaryBtnText;
  late Color lineColor;
  late Color backgroundComponents;

  CustomColors.light() {
    // primary = Colors.blue; // Define your light theme colors here
    // secondary = Colors.green;
    // tertiary = Colors.pink;
    // // Initialize other colors...
    primary = const Color(0xD6E5151E);
    secondary = const Color(0xFFFFFFFF);
    tertiary = const Color(0xFFFAC6C3);
    alternate = const Color(0xFFC28C89);
    primaryText = const Color(0xFF14181B);
    secondaryText = const Color(0xFF57636C);
    primaryBackground = const Color(0xFFF1F4F8);
    secondaryBackground = const Color(0xFFFFFFFF);
    accent1 = const Color(0xFF4C4B39EF);
    accent2 = const Color(0xFF4D39D2C0);
    accent3 = const Color(0xFF4DEE8B60);
    accent4 = const Color(0xFFCCFFFFFF);
    success = const Color(0xFF249689);
    error = const Color(0xFFFF5963);
    warning = const Color(0xFFF9CF58);
    info = const Color(0xFFFFFFFF);
    primaryBtnText = Color(0xFFFFFFFFFF);
    lineColor = Color(0xFFFFE0E3E7);
    backgroundComponents = Color(0xFF1D2428);
  }

  CustomColors.dark() {
    // primary = Colors.indigo; // Define your dark theme colors here
    // secondary = Colors.deepPurple;
    // tertiary = Colors.grey;
    // // Initialize other colors...

    primary = const Color(0xFFFFFFFF);
    secondary = const Color(0xD6E5151E);
    tertiary = const Color(0xFF5E5E5E);
    alternate = const Color(0xFF0A0808);
    primaryText = const Color(0xFFFFFFFF);
    secondaryText = const Color(0xFF95A1AC);
    primaryBackground = const Color(0xFF1D2428);
    secondaryBackground = const Color(0xFF14181B);
    accent1 = const Color(0xFF4C4B39EF);
    accent2 = const Color(0xFF4D39D2C0);
    accent3 = const Color(0xFF4DEE8B60);
    accent4 = const Color(0xFFB2262D34);
    success = const Color(0xFF249689);
    warning = const Color(0xFFFF5963);
    error = const Color(0xFFF9CF58);
    info = const Color(0xFFFFFFFF);
    primaryBtnText = Color(0xFFFFFFFF);
    lineColor = Color(0xFF22282F);
    backgroundComponents = Color(0xFF1B2428);
  }
}

class KMTheme {
  static bool _isDark = false;

  static final _lightColors = CustomColors.light();
  static final _darkColors = CustomColors.dark();

  static Color get _currentColor {
    final brightness = WidgetsBinding.instance!.window.platformBrightness;
    return brightness == Brightness.dark
        ? _darkColors.tertiary
        : _lightColors.tertiary;
  }

  static CustomColors get colors {
    final brightness = WidgetsBinding.instance!.window.platformBrightness;
    return brightness == Brightness.dark ? _darkColors : _lightColors;
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
    );
  }

  static ThemeData get currentTheme {
    // final brightness = WidgetsBinding.instance!.window.platformBrightness;
    // return brightness == Brightness.dark ? darkTheme : lightTheme;
    return _isDark ? darkTheme : lightTheme;
  }

  static ThemeMode get currentThemeMode {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  static void toggleTheme() {
    _isDark = !_isDark;
  }
}

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
