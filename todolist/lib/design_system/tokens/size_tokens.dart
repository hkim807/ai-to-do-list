import 'package:flutter/material.dart';

/// Spacing scale (from Size.json Space/100..600)
@immutable
class SpacingTokens extends ThemeExtension<SpacingTokens> {
  final double s100, s200, s300, s400, s600;
  const SpacingTokens({
    this.s100 = 4,  // Space/100
    this.s200 = 8,  // Space/200
    this.s300 = 12, // Space/300
    this.s400 = 16, // Space/400
    this.s600 = 24, // Space/600
  });

  EdgeInsets all(double v) => EdgeInsets.all(v);
  EdgeInsets get insetXS => EdgeInsets.all(s100);
  EdgeInsets get insetSM => EdgeInsets.all(s200);
  EdgeInsets get insetMD => EdgeInsets.all(s300);
  EdgeInsets get insetLG => EdgeInsets.all(s400);
  EdgeInsets get insetXL => EdgeInsets.all(s600);

  @override
  SpacingTokens copyWith({double? s100, double? s200, double? s300, double? s400, double? s600}) =>
      SpacingTokens(
        s100: s100 ?? this.s100,
        s200: s200 ?? this.s200,
        s300: s300 ?? this.s300,
        s400: s400 ?? this.s400,
        s600: s600 ?? this.s600,
      );

  @override
  SpacingTokens lerp(ThemeExtension<SpacingTokens>? other, double t) {
    if (other is! SpacingTokens) return this;
    return SpacingTokens(
      s100: lerpDouble(s100, other.s100, t)!,
      s200: lerpDouble(s200, other.s200, t)!,
      s300: lerpDouble(s300, other.s300, t)!,
      s400: lerpDouble(s400, other.s400, t)!,
      s600: lerpDouble(s600, other.s600, t)!,
    );
  }
}

double? lerpDouble(num? a, num? b, double t) =>
    a == null && b == null ? null : ((a ?? 0) * (1 - t) + (b ?? 0) * t).toDouble();

/// Corner radius (from Size.json Radius/100..400)
@immutable
class RadiusTokens extends ThemeExtension<RadiusTokens> {
  final double r100, r200, r400;
  const RadiusTokens({this.r100 = 4, this.r200 = 8, this.r400 = 16});

  BorderRadius get brSM => BorderRadius.circular(r100);
  BorderRadius get brMD => BorderRadius.circular(r200);
  BorderRadius get brLG => BorderRadius.circular(r400);

  @override
  RadiusTokens copyWith({double? r100, double? r200, double? r400}) =>
      RadiusTokens(r100: r100 ?? this.r100, r200: r200 ?? this.r200, r400: r400 ?? this.r400);

  @override
  RadiusTokens lerp(ThemeExtension<RadiusTokens>? other, double t) {
    if (other is! RadiusTokens) return this;
    return RadiusTokens(
      r100: lerpDouble(r100, other.r100, t)!,
      r200: lerpDouble(r200, other.r200, t)!,
      r400: lerpDouble(r400, other.r400, t)!,
    );
  }
}

/// Elevation depth (from Size.json Depth/… – map to Material elevations)
@immutable
class ElevationTokens extends ThemeExtension<ElevationTokens> {
  /// Map your Depth/0, 025, 100… to sensible Material elevations.
  final double e0, e1, e2, e3, e4, e6, e8;
  const ElevationTokens({
    this.e0 = 0,  // Depth/0
    this.e1 = 1,  // Depth/025
    this.e2 = 2,  // Depth/050
    this.e3 = 3,  // Depth/075
    this.e4 = 4,  // Depth/100
    this.e6 = 6,  // Depth/150
    this.e8 = 8,  // Depth/200
  });

  @override
  ElevationTokens copyWith({double? e0, double? e1, double? e2, double? e3, double? e4, double? e6, double? e8}) =>
      ElevationTokens(
        e0: e0 ?? this.e0, e1: e1 ?? this.e1, e2: e2 ?? this.e2,
        e3: e3 ?? this.e3, e4: e4 ?? this.e4, e6: e6 ?? this.e6, e8: e8 ?? this.e8,
      );

  @override
  ElevationTokens lerp(ThemeExtension<ElevationTokens>? other, double t) {
    if (other is! ElevationTokens) return this;
    return ElevationTokens(
      e0: lerpDouble(e0, other.e0, t)!, e1: lerpDouble(e1, other.e1, t)!,
      e2: lerpDouble(e2, other.e2, t)!, e3: lerpDouble(e3, other.e3, t)!,
      e4: lerpDouble(e4, other.e4, t)!, e6: lerpDouble(e6, other.e6, t)!,
      e8: lerpDouble(e8, other.e8, t)!,
    );
  }
}