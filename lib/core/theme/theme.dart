import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return ColorScheme.fromSeed(
      seedColor: Color(0xff1c6960),
      brightness: Brightness.light,
      primary: Color(0xff1c6960),
      surfaceTint: Color(0xff1c6960),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff86cdc1),
      onPrimaryContainer: Color(0xff00584f),
      secondary: Color(0xff4a635f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc9e6df),
      onSecondaryContainer: Color(0xff4e6863),
      tertiary: Color(0xff665687),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcab7ef),
      onTertiaryContainer: Color(0xff554676),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff7faf8),
      onSurface: Color(0xff191c1b),
      onSurfaceVariant: Color(0xff3f4947),
      outline: Color(0xff6f7977),
      outlineVariant: Color(0xffbec9c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3130),
      inversePrimary: Color(0xff8cd4c8),
      primaryFixed: Color(0xffa8f0e3),
      onPrimaryFixed: Color(0xff00201c),
      primaryFixedDim: Color(0xff8cd4c8),
      onPrimaryFixedVariant: Color(0xff005048),
      secondaryFixed: Color(0xffcce8e2),
      onSecondaryFixed: Color(0xff05201c),
      secondaryFixedDim: Color(0xffb0ccc6),
      onSecondaryFixedVariant: Color(0xff324b47),
      tertiaryFixed: Color(0xffeaddff),
      onTertiaryFixed: Color(0xff211240),
      tertiaryFixedDim: Color(0xffd1bdf6),
      onTertiaryFixedVariant: Color(0xff4e3f6e),
      surfaceDim: Color(0xffd8dbd9),
      surfaceBright: Color(0xfff7faf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f4f2),
      surfaceContainer: Color(0xffeceeec),
      surfaceContainerHigh: Color(0xffe6e9e7),
      surfaceContainerHighest: Color(0xffe0e3e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ThemeData lightTheme() {
    return themeData(lightScheme());
  }

  static ThemeData darkTheme() {
    return themeData(darkScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003e37),
      surfaceTint: Color(0xff1c6960),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2f786e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff223b36),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff58726d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d2e5c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff756597),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7faf8),
      onSurface: Color(0xff0e1211),
      onSurfaceVariant: Color(0xff2e3836),
      outline: Color(0xff4b5452),
      outlineVariant: Color(0xff656f6d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3130),
      inversePrimary: Color(0xff8cd4c8),
      primaryFixed: Color(0xff2f786e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0b5f56),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff58726d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff405a55),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff756597),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5c4d7d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4c7c5),
      surfaceBright: Color(0xfff7faf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f4f2),
      surfaceContainer: Color(0xffe6e9e7),
      surfaceContainerHigh: Color(0xffdbdddb),
      surfaceContainerHighest: Color(0xffcfd2d0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00332d),
      surfaceTint: Color(0xff1c6960),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00534a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff17302d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff354e49),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff322451),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff504171),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7faf8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff242e2c),
      outlineVariant: Color(0xff414b49),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3130),
      inversePrimary: Color(0xff8cd4c8),
      primaryFixed: Color(0xff00534a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003a34),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff354e49),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1e3733),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff504171),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff392a58),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb6b9b8),
      surfaceBright: Color(0xfff7faf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff1ef),
      surfaceContainer: Color(0xffe0e3e1),
      surfaceContainerHigh: Color(0xffd2d5d3),
      surfaceContainerHighest: Color(0xffc4c7c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return ColorScheme.fromSeed(
      seedColor: Color(0xffa2e9dd),
      brightness: Brightness.dark,
      primary: Color(0xffa2e9dd),
      surfaceTint: Color(0xff8cd4c8),
      onPrimary: Color(0xff003731),
      primaryContainer: Color(0xff86cdc1),
      onPrimaryContainer: Color(0xff00584f),
      secondary: Color(0xffb0ccc6),
      onSecondary: Color(0xff1c3531),
      secondaryContainer: Color(0xff354e49),
      onSecondaryContainer: Color(0xffa2beb8),
      tertiary: Color(0xffe4d5ff),
      onTertiary: Color(0xff372856),
      tertiaryContainer: Color(0xffcab7ef),
      onTertiaryContainer: Color(0xff554676),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101413),
      onSurface: Color(0xffe0e3e1),
      onSurfaceVariant: Color(0xffbec9c6),
      outline: Color(0xff899390),
      outlineVariant: Color(0xff3f4947),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e3e1),
      inversePrimary: Color(0xff1c6960),
      primaryFixed: Color(0xffa8f0e3),
      onPrimaryFixed: Color(0xff00201c),
      primaryFixedDim: Color(0xff8cd4c8),
      onPrimaryFixedVariant: Color(0xff005048),
      secondaryFixed: Color(0xffcce8e2),
      onSecondaryFixed: Color(0xff05201c),
      secondaryFixedDim: Color(0xffb0ccc6),
      onSecondaryFixedVariant: Color(0xff324b47),
      tertiaryFixed: Color(0xffeaddff),
      onTertiaryFixed: Color(0xff211240),
      tertiaryFixedDim: Color(0xffd1bdf6),
      onTertiaryFixedVariant: Color(0xff4e3f6e),
      surfaceDim: Color(0xff101413),
      surfaceBright: Color(0xff363a39),
      surfaceContainerLowest: Color(0xff0b0f0e),
      surfaceContainerLow: Color(0xff191c1b),
      surfaceContainer: Color(0xff1d201f),
      surfaceContainerHigh: Color(0xff272b2a),
      surfaceContainerHighest: Color(0xff323534),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa2eadd),
      surfaceTint: Color(0xff8cd4c8),
      onPrimary: Color(0xff002b26),
      primaryContainer: Color(0xff86cdc1),
      onPrimaryContainer: Color(0xff003932),
      secondary: Color(0xffc6e2dc),
      onSecondary: Color(0xff102a26),
      secondaryContainer: Color(0xff7b9691),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe5d6ff),
      onTertiary: Color(0xff2c1d4a),
      tertiaryContainer: Color(0xffcab7ef),
      onTertiaryContainer: Color(0xff382957),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101413),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4dfdb),
      outline: Color(0xffaab4b1),
      outlineVariant: Color(0xff889290),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e3e1),
      inversePrimary: Color(0xff005249),
      primaryFixed: Color(0xffa8f0e3),
      onPrimaryFixed: Color(0xff001512),
      primaryFixedDim: Color(0xff8cd4c8),
      onPrimaryFixedVariant: Color(0xff003e37),
      secondaryFixed: Color(0xffcce8e2),
      onSecondaryFixed: Color(0xff001512),
      secondaryFixedDim: Color(0xffb0ccc6),
      onSecondaryFixedVariant: Color(0xff223b36),
      tertiaryFixed: Color(0xffeaddff),
      onTertiaryFixed: Color(0xff170635),
      tertiaryFixedDim: Color(0xffd1bdf6),
      onTertiaryFixedVariant: Color(0xff3d2e5c),
      surfaceDim: Color(0xff101413),
      surfaceBright: Color(0xff414544),
      surfaceContainerLowest: Color(0xff050807),
      surfaceContainerLow: Color(0xff1b1e1d),
      surfaceContainer: Color(0xff252928),
      surfaceContainerHigh: Color(0xff303332),
      surfaceContainerHighest: Color(0xff3b3e3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb5fef1),
      surfaceTint: Color(0xff8cd4c8),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff89d0c4),
      onPrimaryContainer: Color(0xff000e0c),
      secondary: Color(0xffd9f6ef),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffadc8c2),
      onSecondaryContainer: Color(0xff000e0c),
      tertiary: Color(0xfff6ecff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcdbaf2),
      onTertiaryContainer: Color(0xff11012f),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff101413),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2ef),
      outlineVariant: Color(0xffbac5c2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e3e1),
      inversePrimary: Color(0xff005249),
      primaryFixed: Color(0xffa8f0e3),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff8cd4c8),
      onPrimaryFixedVariant: Color(0xff001512),
      secondaryFixed: Color(0xffcce8e2),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb0ccc6),
      onSecondaryFixedVariant: Color(0xff001512),
      tertiaryFixed: Color(0xffeaddff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd1bdf6),
      onTertiaryFixedVariant: Color(0xff170635),
      surfaceDim: Color(0xff101413),
      surfaceBright: Color(0xff4d5150),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d201f),
      surfaceContainer: Color(0xff2d3130),
      surfaceContainerHigh: Color(0xff383c3b),
      surfaceContainerHighest: Color(0xff444746),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  static ThemeData themeData(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        // textTheme: textThemeData(),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  // static TextTheme textThemeData() {
  //   return TextTheme(
  //     bodyLarge: GoogleFonts.montserrat(
  //       fontSize: 16,
  //       color: const Color.fromRGBO(255, 255, 255, 1),
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w600,
  //     ),
  //     bodyMedium: GoogleFonts.montserrat(
  //       fontSize: 16,
  //       color: ColorConstants.primaryColor,
  //       fontWeight: FontWeight.w400,
  //     ),
  //     bodySmall: GoogleFonts.montserrat(
  //       fontSize: 12,
  //       color: ColorConstants.textColorGrey,
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w400,
  //     ),
  //     titleLarge: GoogleFonts.montserrat(
  //       fontSize: 18,
  //       color: ColorConstants.textColorGrey,
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w600,
  //     ),
  //     titleMedium: GoogleFonts.montserrat(
  //       fontSize: 18,
  //       color: ColorConstants.textColorBlack,
  //       fontWeight: FontWeight.w600,
  //     ),
  //     titleSmall: GoogleFonts.montserrat(
  //       fontSize: 18,
  //       color: ColorConstants.textColorGrey,
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w500,
  //     ),
  //     labelLarge: GoogleFonts.inter(
  //       fontSize: 14,
  //       color: ColorConstants.textColorBlack,
  //       fontWeight: FontWeight.w400,
  //     ),
  //     labelMedium: GoogleFonts.montserrat(
  //       fontSize: 14,
  //       color: ColorConstants.textColorBlack,
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w600,
  //     ),
  //     labelSmall: GoogleFonts.montserrat(
  //       fontSize: 14,
  //       fontStyle: FontStyle.normal,
  //       color: const Color(0xFFEA2894),
  //       fontWeight: FontWeight.w500,
  //     ),
  //     displaySmall: GoogleFonts.montserrat(
  //       // textStyle: Theme.of(context).textTheme.headline4,
  //       fontSize: 16,
  //       color: ColorConstants.textColor,
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w400,
  //     ),
  //     displayMedium: GoogleFonts.montserrat(
  //       // textStyle: Theme.of(context).textTheme.headline4,
  //       fontSize: 16,
  //       color: ColorConstants.primaryColor,
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w700,
  //     ),
  //     displayLarge: GoogleFonts.montserrat(
  //       // textStyle: Theme.of(context).textTheme.headline4,
  //       fontSize: 18,
  //       color: ColorConstants.textColorBlack,
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w700,
  //     ),
  //   );
  // }

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
