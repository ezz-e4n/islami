import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFFB7935F);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: black),
      titleTextStyle: GoogleFonts.elMessiri(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: black,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w200,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: transparent,
      elevation: 0,
    ),
  );
}
