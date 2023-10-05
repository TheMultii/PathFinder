import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData pathfinderThemeData(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFDF2143),
      primary: const Color(0xFFDF2143),
      background: const Color.fromARGB(255, 18, 18, 18),
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.ralewayTextTheme(
      Theme.of(context).textTheme.apply(
            bodyColor: const Color.fromARGB(255, 248, 248, 248),
            displayColor: const Color.fromARGB(255, 248, 248, 248),
          ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Color.fromARGB(100, 100, 100, 100),
      selectionHandleColor: Color(0xFFDF2143),
    ),
    useMaterial3: true,
  );
}
