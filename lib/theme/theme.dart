import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  brightness: Brightness.dark,
  background: const Color.fromARGB(255, 56, 49, 66),
);

final textTheme = GoogleFonts.nunitoTextTheme().copyWith(
    titleSmall: GoogleFonts.nunito(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.nunito(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.nunito(
      fontWeight: FontWeight.bold,
    ),
    
    );


final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: textTheme,
);