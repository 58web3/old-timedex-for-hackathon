import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _primaryColorCode = 0xff3396ff;
const _tertiaryColorCode = 0xffb6f4fa;
const _darkColorCode = 0xff2e2e2e;
const _disableColorCode = 0xffcccccc;
const _baseColorCode = 0xffffffff;
const _outlineColorCode = 0xff979797;

final lightTheme = ThemeData.light().copyWith(
  useMaterial3: false,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(_primaryColorCode),
    onPrimary: Colors.white.withAlpha(80),
    secondary: Colors.lightBlue.shade900,
    tertiary: const Color(_tertiaryColorCode),
    background: const Color(_baseColorCode),
    onSurface: Colors.grey.shade700,
    outline: const Color(_outlineColorCode),
    shadow: Colors.grey.shade700,
    scrim: Colors.grey,
  ),
  iconTheme: const IconThemeData(
    color: Colors.black54,
    size: 24,
  ),
  primaryIconTheme: const IconThemeData(
    color: Colors.white,
    size: 24,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFF1A3675),
    titleTextStyle: GoogleFonts.sen(
      color: const Color(_baseColorCode),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    toolbarTextStyle: GoogleFonts.sen(
      color: const Color(_baseColorCode),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: const IconThemeData(
      color: Color(_baseColorCode),
      size: 24,
    ),
    iconTheme: const IconThemeData(
      color: Color(_baseColorCode),
      size: 24,
    ),
    centerTitle: true,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Color.fromARGB(255, 222, 241, 255),
  ),
  scaffoldBackgroundColor: const Color(_baseColorCode),
  cardColor: const Color(_baseColorCode),
  canvasColor: Colors.grey.shade100,
  disabledColor: const Color(_disableColorCode),
  dividerColor: const Color(_disableColorCode),
  dialogBackgroundColor: const Color(_baseColorCode),
  textTheme: Typography.material2021().black.copyWith(
        displayLarge: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 72,
        ),
        displayMedium: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 64,
        ),
        displaySmall: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 56,
        ),
        headlineLarge: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 48,
        ),
        headlineMedium: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 40,
        ),
        headlineSmall: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 36,
        ),
        titleLarge: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 28,
        ),
        titleMedium: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 24,
        ),
        titleSmall: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 20,
        ),
        bodyLarge: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 18,
          textStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        bodyMedium: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 16,
          textStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        bodySmall: GoogleFonts.sen(
          color: const Color(_darkColorCode),
          fontSize: 14,
          textStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        labelLarge: GoogleFonts.sen(
          fontSize: 12,
          color: const Color(_darkColorCode),
        ),
        labelMedium: GoogleFonts.sen(
          fontSize: 11,
          color: const Color(_darkColorCode),
        ),
        labelSmall: GoogleFonts.sen(
          fontSize: 10,
          color: const Color(_darkColorCode),
        ),
      ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    isDense: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color(_primaryColorCode),
      foregroundColor: const Color(_baseColorCode),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: GoogleFonts.sen(
        color: const Color(_baseColorCode),
        fontSize: 24,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: const Color(_baseColorCode),
      foregroundColor: const Color(_primaryColorCode),
      side: const BorderSide(color: Color(_primaryColorCode), width: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: GoogleFonts.sen(fontSize: 24),
    ),
  ),
);
