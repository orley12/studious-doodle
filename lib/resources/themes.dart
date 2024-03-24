import 'package:flutter/material.dart';

import 'color_schemes.dart';
import 'strings.dart';
import 'text_theme.dart';

class Themes {
  const Themes._();

  static final light = ThemeData(
    useMaterial3: true,
    textTheme: textTheme,
    brightness: Brightness.light, // status bar brightness
    fontFamily: Strings.euclidCircularA,
    colorScheme: ColorSchemes.lightColorScheme,
  );
  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark, // status bar brightness
    fontFamily: Strings.euclidCircularA,
    colorScheme: ColorSchemes.darkColorScheme,
  );
}
