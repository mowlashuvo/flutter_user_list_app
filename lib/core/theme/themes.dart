import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/color_constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: 'Inter',
    textTheme: textTheme(),
    cardColor: Colors.white,
    primaryColor: const Color.fromRGBO(67, 54, 255, 1),
    splashColor: const Color(0xA34336FF),
    primaryColorLight: const Color(0xA34336FF),
    primaryColorDark: const Color.fromRGBO(0, 37, 234, 1),
    // accentColor: const Color(0x7A1C1C1E),
    hintColor: const Color.fromRGBO(28, 28, 30, 0.72),
    // bottomAppBarColor: const Color.fromRGBO(201, 32, 106, 1),
    // backgroundColor: Colors.grey.shade100,
    useMaterial3: true,
  );
}

TextTheme textTheme() {
  Colors.transparent;
  return TextTheme(
    bodyLarge: GoogleFonts.outfit(
      fontSize: 16,
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.outfit(
      fontSize: 16,
      color: ColorConstants.primaryColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.outfit(
      fontSize: 12,
      color: ColorConstants.textColorGrey,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.outfit(
      fontSize: 18,
      color: ColorConstants.textColorGrey,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.outfit(
      fontSize: 18,
      color: ColorConstants.textColorBlack,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.outfit(
      fontSize: 18,
      color: ColorConstants.textColorGrey,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      color: ColorConstants.textColorBlack,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: GoogleFonts.outfit(
      fontSize: 14,
      color: ColorConstants.textColorBlack,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.outfit(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      color: const Color(0xFFEA2894),
      fontWeight: FontWeight.w500,
    ),
    displaySmall: GoogleFonts.outfit(
      // textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 16,
      color: ColorConstants.textColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: GoogleFonts.outfit(
      // textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 16,
      color: ColorConstants.primaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    ),
    displayLarge: GoogleFonts.outfit(
      // textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 18,
      color: ColorConstants.textColorBlack,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    ),
  );
}
