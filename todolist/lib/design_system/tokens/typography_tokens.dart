import 'package:flutter/material.dart';
import 'typography_primitives.dart';

/// Colour is supplied by the active theme (onSurface), so styles remain themeable.
class TypographyTokens {
  // Title Hero
  static TextStyle titleHero(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif, // Gambarino
        fontWeight: FontWeights.bold,   // 700
        fontSize: TypeScale.s10,        // 72
        height: 1.05,
        color: onSurface,
      );

  // Title Page
  static TextStyle titlePageL(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.bold,
        fontSize: TypeScale.s09, // 64
        height: 1.08,
        color: onSurface,
      );

  static TextStyle titlePage(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.bold,
        fontSize: TypeScale.s08, // 48
        height: 1.1,
        color: onSurface,
      );

  static TextStyle titlePageS(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.bold,
        fontSize: TypeScale.s07, // 40
        height: 1.12,
        color: onSurface,
      );

  // Subtitle
  static TextStyle subtitleL(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.regular, // 400
        fontSize: TypeScale.s07, // 40
        height: 1.15,
        color: onSurface,
      );

  static TextStyle subtitle(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.regular,
        fontSize: TypeScale.s06, // 32
        height: 1.18,
        color: onSurface,
      );

  static TextStyle subtitleS(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.regular,
        fontSize: TypeScale.s05, // 24
        height: 1.2,
        color: onSurface,
      );

  // Subheading
  static TextStyle subheadingS(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.semiBold,
        fontSize: TypeScale.s03, // 16
        height: 1.25,
        color: onSurface,
      );

  static TextStyle subheadingM(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.semiBold,
        fontSize: TypeScale.s04, // 20
        height: 1.25,
        color: onSurface,
      );

  static TextStyle subheadingL(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.semiBold,
        fontSize: TypeScale.s05, // 24
        height: 1.25,
        color: onSurface,
      );

  // Heading
  static TextStyle headingS(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.semiBold, // 600
        fontSize: TypeScale.s04, // 20
        height: 1.22,
        color: onSurface,
      );

  static TextStyle headingM(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.semiBold,
        fontSize: TypeScale.s05, // 24
        height: 1.22,
        color: onSurface,
      );

  static TextStyle headingL(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.serif,
        fontWeight: FontWeights.semiBold,
        fontSize: TypeScale.s06, // 32
        height: 1.2,
        color: onSurface,
      );

  // Body
  static TextStyle bodyS(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.sans,
        fontWeight: FontWeights.regular, // 400
        fontSize: TypeScale.s02, // 14
        height: 1.5,
        color: onSurface,
      );

  static TextStyle body(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.sans,
        fontWeight: FontWeights.regular,
        fontSize: TypeScale.s03, // 16
        height: 1.5,
        color: onSurface,
      );

  static TextStyle bodyL(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.sans,
        fontWeight: FontWeights.regular,
        fontSize: TypeScale.s04, // 20
        height: 1.5,
        color: onSurface,
      );

  static TextStyle bodyStrong(Color onSurface) => body(onSurface).copyWith(
        fontWeight: FontWeights.semiBold, // 600
      );

  static TextStyle bodyItalic(Color onSurface) => body(onSurface).copyWith(
        fontStyle: FontStyle.italic,
      );

  // Code
  static TextStyle codeS(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.mono,
        fontWeight: FontWeights.regular,
        fontSize: TypeScale.s02, // 14
        height: 1.45,
        letterSpacing: 0.2,
        color: onSurface,
      );

  static TextStyle code(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.mono,
        fontWeight: FontWeights.regular,
        fontSize: TypeScale.s03, // 16
        height: 1.45,
        letterSpacing: 0.2,
        color: onSurface,
      );

  static TextStyle codeL(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.mono,
        fontWeight: FontWeights.regular,
        fontSize: TypeScale.s04, // 20
        height: 1.45,
        letterSpacing: 0.2,
        color: onSurface,
      );

  // Label
  static TextStyle labelL(Color onSurface) => TextStyle(
        fontFamily: FontFamilies.sans,
        fontWeight: FontWeights.semiBold,
        fontSize: TypeScale.s03, // 16
        height: 1.2,
        color: onSurface,
      );
}