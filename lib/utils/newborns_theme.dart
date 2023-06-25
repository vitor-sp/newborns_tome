import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewbornsTome {
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.italiana(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      height: 0.75,
    ),
    displayMedium: GoogleFonts.italiana(
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.italiana(
      color: Colors.white,
    ),
    headlineLarge: GoogleFonts.italiana(
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.italiana(
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.italiana(
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.italiana(
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.italiana(
      color: Colors.white,
    ),
    titleSmall: GoogleFonts.italiana(
      color: Colors.white,
    ),
    labelLarge: GoogleFonts.italiana(
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.italiana(
      color: Colors.white,
    ),
    labelSmall: GoogleFonts.italiana(
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.italiana(
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.italiana(
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.italiana(
      color: Colors.white,
    ),
  );

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.italiana(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.alphabetic,
      height: 0.75,
    ),
    displayMedium: GoogleFonts.italiana(
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.italiana(
      color: Colors.black,
    ),
    headlineLarge: GoogleFonts.italiana(
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.italiana(
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.italiana(
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.italiana(
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.italiana(
      color: Colors.black,
    ),
    titleSmall: GoogleFonts.italiana(
      color: Colors.black,
    ),
    labelLarge: GoogleFonts.italiana(
      color: Colors.black,
    ),
    labelMedium: GoogleFonts.italiana(
      color: Colors.black,
    ),
    labelSmall: GoogleFonts.italiana(
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.italiana(
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.italiana(
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.italiana(
      color: Colors.black,
    ),
  );

  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            return Colors.black;
          }),
        ),
        textTheme: lightTextTheme,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black);
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: darkTextTheme,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.white,
    );
  }
}
