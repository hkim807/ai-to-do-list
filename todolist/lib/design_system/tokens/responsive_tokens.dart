
import 'package:flutter/material.dart';

enum DeviceSize { mobile, tablet, desktop }

class Breakpoints {
  // From Responsive.json (Device Width): mobile 375, tablet 768, desktop 1200
  static const mobileMax = 599.0;   // < 600 = mobile
  static const tabletMax = 1023.0;  // 600..1023 = tablet, >=1024 = desktop
}

extension BuildContextResponsive on BuildContext {
  DeviceSize get deviceSize {
    final w = MediaQuery.of(this).size.width;
    if (w <= Breakpoints.mobileMax) return DeviceSize.mobile;
    if (w <= Breakpoints.tabletMax) return DeviceSize.tablet;
    return DeviceSize.desktop;
  }

  /// Optional: a scale derived from your Responsive.json “Scale”
  /// Desktop 1.0, Tablet 1.0, Mobile 1.25
  double get responsiveScale {
    switch (deviceSize) {
      case DeviceSize.mobile: return 1.25;
      case DeviceSize.tablet: return 1.0;
      case DeviceSize.desktop: return 1.0;
    }
  }
}