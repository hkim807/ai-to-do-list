import 'package:flutter/material.dart';

class AppTypography {
  static TextTheme textTheme(Color onSurface) {
    return const TextTheme(
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      titleMedium:    TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      bodyMedium:     TextStyle(fontSize: 14, height: 1.5),
      labelLarge:     TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ).apply(
      bodyColor: onSurface,
      displayColor: onSurface,
    );
  }
}