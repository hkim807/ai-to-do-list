import 'package:flutter/material.dart';
import 'color_scheme.dart';
import '../tokens/app_text_theme.dart';
import '../tokens/size_tokens.dart';

ThemeData buildLightTheme() {
  final cs = sdsLightColorScheme();
  return ThemeData(
    useMaterial3: true,
    colorScheme: cs,
    scaffoldBackgroundColor: cs.background,
    textTheme: AppTextTheme.build(cs.onSurface),
    extensions: const [
      SpacingTokens(),         // 4,8,12,16,24
      RadiusTokens(),          // 4,8,16
      ElevationTokens(),       // 0..8
    ],
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cs.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: cs.outline),
      ),
    ),
  );
}

ThemeData buildDarkTheme() {
  final cs = sdsDarkColorScheme();
  return ThemeData(
    useMaterial3: true,
    colorScheme: cs,
    scaffoldBackgroundColor: cs.background,
    textTheme: AppTextTheme.build(cs.onSurface),
    extensions: const [
      SpacingTokens(),
      RadiusTokens(),
      ElevationTokens(),
    ],
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cs.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: cs.outline),
      ),
    ),
  );
}