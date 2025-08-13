import 'package:flutter/material.dart';
import '../tokens/figma_color_tokens.dart' as t;

// Canonical Material ColorScheme built from Figma color roles.
// Keep this as the single source of truth for app colors in Flutter.

// const Color _brandPurple = Color(t.ColorTokensLight.brand_purple_500);

ColorScheme sdsLightColorScheme() {
  return ColorScheme(
    brightness: Brightness.light,
    primary: Color(t.ColorTokensLight.brand_purple_500), // Purple 500
    primaryContainer: Color(t.ColorTokensLight.brand_purple_700),
    onPrimary: Colors.white,
    secondary: const Color(0xFF5E5C57), // neutral 700
    onSecondary: Colors.white,
    surface: Color(t.ColorTokensLight.background_default_secondary),
    onSurface: Color(t.ColorTokensLight.text_default_default),
    background: Color(t.ColorTokensLight.background_default_default),
    onBackground: Color(t.ColorTokensLight.text_default_default),
    error: Color(t.ColorTokensLight.background_danger_default),
    onError: Colors.white,
    surfaceVariant: Color(t.ColorTokensLight.background_default_tertiary),
    onSurfaceVariant: Color(t.ColorTokensLight.text_default_secondary),
    outline: Color(t.ColorTokensLight.border_default_secondary),
    shadow: Colors.black12,
    scrim: const Color(0xCC000000),
    inverseSurface: Color(t.ColorTokensLight.text_default_default),
    onInverseSurface: Colors.white,
    tertiary: Color(t.ColorTokensLight.background_positive_default),
    onTertiary: Colors.white,
    inversePrimary: Color(t.ColorTokensLight.brand_purple_500),
  );
}

ColorScheme sdsDarkColorScheme() {
  return ColorScheme(
    brightness: Brightness.dark,
    primary: Color(t.ColorTokensDark.brand_purple_500),
    onPrimary: Colors.white,
    secondary: const Color(0xFFB6B4B0),
    onSecondary: Colors.black,
    surface: Color(t.ColorTokensDark.background_default_secondary),
    onSurface: Color(t.ColorTokensDark.text_default_default),
    background: Color(t.ColorTokensDark.background_default_default),
    onBackground: Color(t.ColorTokensDark.text_default_default),
    error: Color(t.ColorTokensDark.background_danger_default),
    onError: Colors.white,
    surfaceVariant: Color(t.ColorTokensDark.background_default_tertiary),
    onSurfaceVariant: Color(t.ColorTokensDark.text_default_secondary),
    outline: Color(t.ColorTokensDark.border_default_secondary),
    shadow: Colors.black,
    scrim: const Color(0xCC000000),
    inverseSurface: Color(t.ColorTokensDark.text_default_default),
    onInverseSurface: Colors.black,
    tertiary: Color(t.ColorTokensDark.background_positive_default),
    onTertiary: Colors.white,
    inversePrimary: Color(t.ColorTokensDark.brand_purple_500),
  );
}
