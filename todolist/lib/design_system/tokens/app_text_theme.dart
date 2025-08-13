import 'package:flutter/material.dart';
import 'typography_tokens.dart';

class AppTextTheme {
  static TextTheme build(Color onSurface) {
    return TextTheme(
      displayLarge:   TypographyTokens.titlePage(onSurface), // optional map
      headlineMedium: TypographyTokens.subtitle(onSurface),
      titleLarge:     TypographyTokens.headingM(onSurface),
      bodyLarge:      TypographyTokens.body(onSurface),
      bodyMedium:     TypographyTokens.body(onSurface),
      labelLarge:     TypographyTokens.labelL(onSurface),
      // you can add more slots as you define more roles
    );
  }
}