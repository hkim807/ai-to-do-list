/// Spacing scale tokens mapped from the Size collection (Space/*)
/// These are primitive values intended for consistent spacing across the app.
class SpacingTokens {
  // Positive space
  static const double space0 = 0.0;     // Space/0
  static const double space050 = 2.0;   // Space/050
  static const double space100 = 4.0;   // Space/100
  static const double space150 = 6.0;   // Space/150
  static const double space200 = 8.0;   // Space/200
  static const double space300 = 12.0;  // Space/300
  static const double space400 = 16.0;  // Space/400
  static const double space500 = 20.0;  // Space/500
  static const double space600 = 24.0;  // Space/600
  static const double space800 = 32.0;  // Space/800
  static const double space1200 = 48.0; // Space/1200
  static const double space1600 = 64.0; // Space/1600
  static const double space2400 = 96.0; // Space/2400
  static const double space4000 = 160.0; // Space/4000

  // Negative space
  static const double spaceNegative100 = -4.0;  // Space/Negative 100
  static const double spaceNegative200 = -8.0;  // Space/Negative 200
  static const double spaceNegative300 = -12.0; // Space/Negative 300
  static const double spaceNegative400 = -16.0; // Space/Negative 400
  static const double spaceNegative600 = -24.0; // Space/Negative 600
}

/// Backwards-compatible convenience object used by UI code.
/// Maps XS..XL to selected spacing tokens from SpacingTokens.
class Spacing {
  final double xs, sm, md, lg, xl;
  const Spacing({this.xs = SpacingTokens.space100, this.sm = SpacingTokens.space200, this.md = SpacingTokens.space300, this.lg = SpacingTokens.space400, this.xl = SpacingTokens.space600});
  static const base = Spacing();
}
