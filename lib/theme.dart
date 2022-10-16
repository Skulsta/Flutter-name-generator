import 'package:flutter/material.dart';

class ThemeModeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

// const lightColorScheme = ColorScheme(
//   brightness: Brightness.light,
//   primary: Color.fromARGB(255, 255, 142, 22),
//   onPrimary: Color.fromARGB(255, 0, 0, 0),
//   primaryContainer: Color(0xFFFFDBCB),
//   onPrimaryContainer: Color(0xFF341100),
//   secondary: Color(0xFF006A68),
//   onSecondary: Color(0xFFFFFFFF),
//   secondaryContainer: Color(0xFF6FF7F3),
//   onSecondaryContainer: Color(0xFF00201F),
//   tertiary: Color(0xFF7B46A3),
//   onTertiary: Color(0xFFFFFFFF),
//   tertiaryContainer: Color(0xFFF2DAFF),
//   onTertiaryContainer: Color(0xFF2E004E),
//   error: Color(0xFFBA1A1A),
//   errorContainer: Color(0xFFFFDAD6),
//   onError: Color(0xFFFFFFFF),
//   onErrorContainer: Color(0xFF410002),
//   background: Color(0xFFF2FFFD),
//   onBackground: Color(0xFF00201F),
//   surface: Color(0xFFF2FFFD),
//   onSurface: Color(0xFF00201F),
//   surfaceVariant: Color(0xFFF4DED5),
//   onSurfaceVariant: Color(0xFF52443D),
//   outline: Color(0xFF85736C),
//   onInverseSurface: Color(0xFFAFFFFB),
//   inverseSurface: Color(0xFF003735),
//   inversePrimary: Color(0xFFFFB692),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFF984717),
// );

// const darkColorScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xFF4DDAD7),
//   onPrimary: Color.fromARGB(255, 255, 255, 255),
//   primaryContainer: Color(0xFF793000),
//   onPrimaryContainer: Color(0xFFFFDBCB),
//   secondary: Color(0xFF4DDAD7),
//   onSecondary: Color(0xFF003736),
//   secondaryContainer: Color(0xFF00504E),
//   onSecondaryContainer: Color(0xFF6FF7F3),
//   tertiary: Color(0xFFE1B6FF),
//   onTertiary: Color(0xFF491171),
//   tertiaryContainer: Color(0xFF612D89),
//   onTertiaryContainer: Color(0xFFF2DAFF),
//   error: Color(0xFFFFB4AB),
//   errorContainer: Color(0xFF93000A),
//   onError: Color(0xFF690005),
//   onErrorContainer: Color(0xFFFFDAD6),
//   background: Color(0xFF00201F),
//   onBackground: Color(0xFF6FF7F2),
//   surface: Color(0xFF00201F),
//   onSurface: Color(0xFF6FF7F2),
//   surfaceVariant: Color(0xFF52443D),
//   onSurfaceVariant: Color(0xFFD7C2B9),
//   outline: Color(0xFFA08D85),
//   onInverseSurface: Color(0xFF00201F),
//   inverseSurface: Color(0xFF6FF7F2),
//   inversePrimary: Color(0xFF984717),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFFFFB692),
// );

// choose background color based on dark mode
// Color getBackgroundColor(BuildContext context) {
//   return Theme.of(context).brightness == Brightness.dark ? darkColorScheme.background : lightColorScheme.background;
// }
