import 'package:flutter/material.dart';

class ColorSchemes {
  const ColorSchemes._();

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFEFA23D),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFA5957E),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFB3261E),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF), // FAF5EC
    onSurface: Color(0xFFA5957E),
    surfaceVariant: Color(0xFFEFA23D),
    inverseSurface: Colors.black,
    onSurfaceVariant: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF684dbc),
    onInverseSurface: Color(0xFFf5f5f5),
    background: Color(0xFFFAF5EC),
    onBackground: Color(0xFF232220),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD0BCFF),
    onPrimary: Color(0xFF381E72),
    secondary: Color(0xFFCCC2DC),
    onSecondary: Color(0xFF332D41),
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF),
    background: Color(0xFF1C1B1F),
    onBackground: Color(0xFFE6E1E5),
    surface: Color(0xFF1C1B1F),
    onSurface: Color(0xFFE6E1E5),
    surfaceVariant: Color(0xFF49454F),
    onSurfaceVariant: Color(0xFFCAC4D0),
    inverseSurface: Color(0xFFE6E1E5),
    inversePrimary: Color(0xFF6750A4),
  );
}
