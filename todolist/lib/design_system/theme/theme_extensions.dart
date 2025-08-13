import 'package:flutter/material.dart';

@immutable
class AppSpacing extends ThemeExtension<AppSpacing> {
  final double xs, sm, md, lg, xl;
  const AppSpacing({this.xs = 4, this.sm = 8, this.md = 12, this.lg = 16, this.xl = 24});

  @override
  AppSpacing copyWith({double? xs, double? sm, double? md, double? lg, double? xl}) =>
      AppSpacing(xs: xs ?? this.xs, sm: sm ?? this.sm, md: md ?? this.md, lg: lg ?? this.lg, xl: xl ?? this.xl);

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) => this;
}