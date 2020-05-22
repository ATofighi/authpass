import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPassTheme {
//  static const Color linkColor = Colors.blueAccent;
  static const int _primaryColorValue = 0xFF626bc6;
  static const Color primaryColor = Color(_primaryColorValue);
  static const Color linkColor = primaryColor;
  static const MaterialColor primarySwatch =
      MaterialColor(_primaryColorValue, <int, Color>{
    50: Color(0xFFecedf8),
    100: Color(0xFFd0d3ee),
    200: Color(0xffb1b5e3),
    300: Color(0xFF9197d7),
    400: Color(0xFF7a81cf),
    500: Color(0xFF626bc6),
    600: Color(0xFF5a63c0),
    700: Color(0xFF5058b9),
    800: Color(0xFF464eb1),
    900: Color(0xFF343ca4),
  });
}

abstract class Breakpoints {
  static const TABLET_WIDTH = 720;
}

// during development use getters :-)
//ThemeData get authPassLightTheme => createTheme();
//ThemeData get authPassDarkTheme => createDarkTheme();
final authPassLightTheme = createTheme();
final authPassDarkTheme = createDarkTheme();

ThemeData _customize(ThemeData base) {
  final pageTransitionBuilders = {...const PageTransitionsTheme().builders};
  pageTransitionBuilders[TargetPlatform.macOS] =
      const FadeUpwardsPageTransitionsBuilder();
  return base.copyWith(
    pageTransitionsTheme:
        PageTransitionsTheme(builders: pageTransitionBuilders),
  );
}

ThemeData createTheme() {
  return _customize(ThemeData(
    primarySwatch: AuthPassTheme.primarySwatch,
    typography: _getTypography(),
  ));
}

Typography _getTypography() {
  if (defaultTargetPlatform == TargetPlatform.macOS) {
    return Typography.material2018(
      platform: defaultTargetPlatform,
      black: GoogleFonts.interTextTheme(Typography.blackCupertino),
      white: GoogleFonts.interTextTheme(Typography.whiteCupertino),
    );
  } else {
    return Typography.material2018(platform: defaultTargetPlatform);
  }
}

ThemeData createDarkTheme() {
  final colorScheme = ColorScheme.dark(
    primary: AuthPassTheme.primaryColor,
    secondary: AuthPassTheme.primarySwatch[300],
    secondaryVariant: AuthPassTheme.primarySwatch[500],
  );
  return _customize(ThemeData(
    primaryColor: colorScheme.primary,
    textSelectionHandleColor: AuthPassTheme.primarySwatch[800],
//    textSelectionColor: Colors.red,
    toggleableActiveColor: colorScheme.primary,
//    cursorColor: Colors.red,
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    primarySwatch: AuthPassTheme.primarySwatch,
    accentColor: AuthPassTheme.primaryColor,
    selectedRowColor: colorScheme.surface,
    typography: _getTypography(),
  ));
}
