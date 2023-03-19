import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTheme = ThemeData.dark().copyWith(
  useMaterial3: false,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.lightBlue.shade100,
    secondary: Colors.amber.shade700,
    tertiary: Colors.lightBlue.shade900,
    background: const Color.fromARGB(255, 0, 24, 40),
    onSurface: Colors.grey.shade700,
    outline: Colors.white70,
    shadow: Colors.grey.shade200,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white70,
    size: 24,
  ),
  primaryIconTheme: IconThemeData(
    color: Colors.grey.shade900,
    size: 24,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.lightBlue.shade100,
    titleTextStyle: GoogleFonts.ibmPlexSansJp(
      color: Colors.black54,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    toolbarTextStyle: GoogleFonts.ibmPlexSansJp(
      color: Colors.black54,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.black54,
      size: 24,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black54,
      size: 24,
    ),
    centerTitle: true,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Color.fromARGB(255, 0, 24, 40),
  ),
  scaffoldBackgroundColor: Colors.grey.shade800,
  cardColor: Colors.grey.shade900,
  disabledColor: Colors.grey.shade400,
  textTheme: Typography.material2021().black.copyWith(
        displayLarge: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 96,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 80,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 64,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 40,
        ),
        headlineSmall: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 32,
        ),
        titleLarge: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 28,
        ),
        titleMedium: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 24,
        ),
        titleSmall: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 20,
        ),
        bodyLarge: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 18,
          textStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        bodyMedium: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 16,
          textStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        bodySmall: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 14,
          textStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        labelLarge: GoogleFonts.ibmPlexSansJp(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: GoogleFonts.ibmPlexSansJp(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    isDense: true,
  ),
);
