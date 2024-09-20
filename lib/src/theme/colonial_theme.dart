
import 'package:flutter/material.dart';

import 'colors.dart';

  ThemeData colonialTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      primaryColor: const Color(0xFFE8B86D),
      hintColor: const Color(0xFFA1D6B2),
      cardColor: const Color(0xFFCEDF9F),
      fontFamily: 'RobotoSerif',
      useMaterial3: true,
      searchBarTheme: const SearchBarThemeData(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          surfaceTintColor: WidgetStatePropertyAll(Colors.white),
          overlayColor: WidgetStatePropertyAll(Colors.white),
          padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16.0))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonsColor, iconColor: Colors.white)));