import 'package:flutter/material.dart';

/// Families (from your Typography Primitives.json)
class FontFamilies {
  static const serif = 'Gambarino';        // Family Serif
  static const sans  = 'Switzer Variable'; // Family Sans
  static const mono  = 'Roboto Mono';      // Family Mono
}

/// Weights (from your Typography Primitives.json)
class FontWeights {
  static const thin       = FontWeight.w100;
  static const extraLight = FontWeight.w200;
  static const light      = FontWeight.w300;
  static const regular    = FontWeight.w400; // Weight Regular
  static const medium     = FontWeight.w500;
  static const semiBold   = FontWeight.w600;
  static const bold       = FontWeight.w700; // Weight Bold
  static const extraBold  = FontWeight.w800;
  static const black      = FontWeight.w900;
}

/// Size scale (from your Scale 10..03 values)
class TypeScale {
  static const s10 = 72.0;
  static const s09 = 64.0;
  static const s08 = 48.0;
  static const s07 = 40.0; // used by Title Page / Size Small in your JSON
  static const s06 = 32.0; // used by Subtitle / Size Base
  static const s05 = 24.0;
  static const s04 = 20.0;
  static const s03 = 16.0; // used by Body / Size Medium & Code / Base
  static const s02 = 14.0;
  static const s01 = 12.0;
}