import 'package:flutter/material.dart';

class ColorConstants {
  static const themeColor = Color.fromRGBO(104, 41, 118, 1);
  static Map<int, Color> swatchColor = {
    50: themeColor.withOpacity(0.1),
    100: themeColor.withOpacity(0.2),
    200: themeColor.withOpacity(0.3),
    300: themeColor.withOpacity(0.4),
    400: themeColor.withOpacity(0.5),
    500: themeColor.withOpacity(0.6),
    600: themeColor.withOpacity(0.7),
    700: themeColor.withOpacity(0.8),
    800: themeColor.withOpacity(0.9),
    900: themeColor.withOpacity(1),
  };
  static const primaryColor = Color.fromRGBO(67, 54, 255, 1);
  static const primaryColorLight = Color(0xA34336FF);
  static const secondaryAccentColor = Color(0xFFEA2894);
  static const textColor = Color.fromRGBO(28, 28, 30, 0.72);
  static const textColorBlack = Color.fromRGBO(28, 28, 30, 1);
  static const greyColor = Color(0xffaeaeae);
  static const greyColor2 = Color(0xffE8E8E8);
  static const successColor = Color.fromRGBO(0, 174, 17, 1);
  static const successLightColor = Color.fromRGBO(234, 251, 231, 1);

  static const Color snackBarText = Colors.white;
  static const Color snackBar = Color.fromRGBO(104, 41, 118, 1);

  static const Color successSnackBarText = Colors.white;
  static const Color successSnackBar = Color.fromRGBO(19, 212, 39, 1);

  static const Color errorSnackBarText = Colors.white;
  static const Color errorSnackBar = Colors.red;

  static const Color progressbar = Colors.white;
  static const Color iconColor = Color.fromRGBO(28, 28, 30, 0.54);
  static const Color textColorGrey = Color(0xff747373);

  static const loader_color1 = Color.fromRGBO(205, 7, 118, 1);
  static const loader_color2 = Color.fromRGBO(205, 7, 118, 0.9);
  static const loader_color3 = Color.fromRGBO(205, 7, 118, 0.8);
  static const loader_color4 = Color.fromRGBO(205, 7, 118, 0.7);
  static const loader_color5 = Color.fromRGBO(205, 7, 118, 0.6);
  static const loader_color6 = Color.fromRGBO(205, 7, 118, 0.5);
  static const loader_color7 = Color.fromRGBO(205, 7, 118, 0.4);
  static const loader_color8 = Color.fromRGBO(205, 7, 118, 0.3);
  static const loader_color9 = Color.fromRGBO(205, 7, 118, 0.22);
  static const loader_color10 = Color.fromRGBO(205, 7, 118, 0.18);
  static const loader_color11 = Color.fromRGBO(205, 7, 118, 0.08);
}
