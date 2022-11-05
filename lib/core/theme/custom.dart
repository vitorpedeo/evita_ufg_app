// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:evita_ufg_app/core/theme/shimmer_colors.dart';

class CustomTheme {
  static const Color primaryColor = Color.fromRGBO(0, 114, 185, 1);
  static const Color accentColor = Color.fromRGBO(0, 114, 185, 0.2);

  static const Color primaryTextColor = Color.fromRGBO(45, 55, 72, 1);
  static const Color primaryDarkTextColor = Color.fromRGBO(237, 242, 247, 1);
  static const Color secondaryTextColor = Color.fromRGBO(113, 128, 150, 1);
  static const Color secondaryDarkTextColor = Color.fromRGBO(160, 174, 192, 1);
  static const Color tertiaryTextColor = Color.fromRGBO(45, 55, 88, 1);
  static const Color tertiaryDarkTextColor = Color.fromRGBO(237, 242, 247, 1);

  static const Color redColor = Color.fromRGBO(239, 35, 60, 1);
  static const Color yellowColor = Color.fromRGBO(255, 200, 60, 1);

  static final String fontFamily = GoogleFonts.inter().fontFamily!;

  static final ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.white,
    fontFamily: fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      secondary: accentColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: Color.fromRGBO(113, 128, 150, 1),
      ),
      fillColor: Color.fromRGBO(237, 242, 247, 1),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: primaryTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      bodyText1: TextStyle(
        color: secondaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        color: tertiaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      ShimmerColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    backgroundColor: const Color.fromRGBO(26, 32, 44, 1),
    fontFamily: fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      secondary: accentColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0.25),
      ),
      fillColor: Color.fromRGBO(255, 255, 255, 0.05),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: primaryDarkTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      bodyText1: TextStyle(
        color: secondaryDarkTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        color: tertiaryDarkTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    extensions: const <ThemeExtension<dynamic>>[
      ShimmerColors(
        baseColor: Color.fromRGBO(26, 32, 44, 1),
        highlightColor: Color.fromRGBO(74, 85, 104, 1),
      ),
    ],
  );
}
