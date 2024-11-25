import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primary = Color(0xffB7935F);
  static const Color primaryDark = Color(0xff141A2E);
  static const Color accent = Color(0xff242424);
  static const Color transparent = Color(0xff00000000);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: transparent,
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      backgroundColor: transparent,
      iconTheme: const IconThemeData(
        color: primary,
      ),
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        color: accent,
        fontWeight: FontWeight.w300,
        fontSize: 40,
      ),
    ),
    textTheme: TextTheme(bodyMedium: GoogleFonts.elMessiri(fontSize: 25)),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: transparent,
    primaryColor: primaryDark,
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: transparent,
    //   centerTitle: true,
    //   titleTextStyle: TextStyle(
    //     color: accent,
    //     fontWeight: FontWeight.w300,
    //     fontSize: 30,
    //   ),
    // ),
    // textTheme: const TextTheme(
    //   bodySmall: TextStyle(
    //     fontSize: 30,
    //     fontWeight: FontWeight.w300,
    //     color: accent,
    //   ),
    // ),
  );
}
