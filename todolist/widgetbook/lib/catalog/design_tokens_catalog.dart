import 'package:flutter/material.dart';
import 'package:todolist/design_system/tokens/typography_primitives.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/tokens/size_tokens.dart';
import 'package:todolist/design_system/tokens/typography_tokens.dart';
import 'package:todolist/design_system/theme/color_scheme.dart';

@widgetbook.UseCase(name: 'Design Tokens Catalog', type: Scaffold)
Widget designTokensCatalog(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: [
          _buildColorSchemeSection(
            context,
            'ColorScheme – Light',
            sdsLightColorScheme(),
          ),
          const SizedBox(height: 32),
          _buildColorSchemeSection(
            context,
            'ColorScheme – Dark',
            sdsDarkColorScheme(),
          ),
          const SizedBox(height: 32),
          _buildTypographySection(context),
          const SizedBox(height: 32),
          _buildSpacingSection(context),
          const SizedBox(height: 32),
          _buildRadiusSection(context),
          const SizedBox(height: 32),
          _buildElevationSection(context),
        ],
      ),
    ),
  );
}

Widget _buildColorSchemeSection(
  BuildContext context,
  String title,
  ColorScheme cs,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TypographyTokens.headingL(cs.onSurface)),
      const SizedBox(height: 16),
      Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          _colorSwatch('primary', cs.primary, cs),
          _colorSwatch('onPrimary', cs.onPrimary, cs),
          _colorSwatch('background', cs.background, cs),
          _colorSwatch('onBackground', cs.onBackground, cs),
          _colorSwatch('surface', cs.surface, cs),
          _colorSwatch('onSurface', cs.onSurface, cs),
          _colorSwatch('surfaceVariant', cs.surfaceVariant, cs),
          _colorSwatch('onSurfaceVariant', cs.onSurfaceVariant, cs),
          _colorSwatch('outline', cs.outline, cs),
          _colorSwatch('error', cs.error, cs),
          _colorSwatch('tertiary', cs.tertiary, cs),
          _colorSwatch('onTertiary', cs.onTertiary, cs),
        ],
      ),
    ],
  );
}

Widget _colorSwatch(String name, Color color, ColorScheme cs) {
  return Container(
    width: 120,
    decoration: BoxDecoration(
      border: Border.all(color: cs.outline),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(name, style: TypographyTokens.subheadingS(cs.onSurface)),
              Text(
                '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
                style: TypographyTokens.bodyS(cs.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildTypographySection(BuildContext context) {
  final cs = Theme.of(context).colorScheme;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Typography', style: TypographyTokens.headingL(cs.onSurface)),
      const SizedBox(height: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title Hero', style: TextStyle(fontFamily: 'Gambarino')),
          const SizedBox(height: 8),
          Text('Title Page', style: TypographyTokens.titlePage(cs.onSurface)),
          const SizedBox(height: 8),
          Text('Subtitle', style: TypographyTokens.subtitle(cs.onSurface)),
          const SizedBox(height: 8),
          Text('Heading Large', style: TypographyTokens.headingL(cs.onSurface)),
          const SizedBox(height: 8),
          Text(
            'Heading Medium',
            style: TypographyTokens.headingM(cs.onSurface),
          ),
          const SizedBox(height: 8),
          Text('Heading Small', style: TypographyTokens.headingS(cs.onSurface)),
          const SizedBox(height: 8),
          Text('Body Large', style: TypographyTokens.bodyL(cs.onSurface)),
          const SizedBox(height: 8),
          Text('Body', style: TypographyTokens.body(cs.onSurface)),
          const SizedBox(height: 8),
          Text('Body Small', style: TypographyTokens.bodyS(cs.onSurface)),
          const SizedBox(height: 8),
          Text('Body Strong', style: TypographyTokens.bodyStrong(cs.onSurface)),
          const SizedBox(height: 8),
          Text('Body Italic', style: TypographyTokens.bodyItalic(cs.onSurface)),
          const SizedBox(height: 8),
          Text('Label Large', style: TypographyTokens.labelL(cs.onSurface)),
          const SizedBox(height: 8),
          Text('Code', style: TypographyTokens.code(cs.onSurface)),
        ],
      ),
    ],
  );
}

Widget _buildSpacingSection(BuildContext context) {
  final cs = Theme.of(context).colorScheme;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Spacing Scale', style: TypographyTokens.headingL(cs.onSurface)),
      const SizedBox(height: 16),
      Row(
        children: [
          _spacingSwatch('s100', 4, cs),
          const SizedBox(width: 16),
          _spacingSwatch('s200', 8, cs),
          const SizedBox(width: 16),
          _spacingSwatch('s300', 12, cs),
          const SizedBox(width: 16),
          _spacingSwatch('s400', 16, cs),
          const SizedBox(width: 16),
          _spacingSwatch('s600', 24, cs),
        ],
      ),
    ],
  );
}

Widget _spacingSwatch(String name, double size, ColorScheme cs) {
  return Column(
    children: [
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: cs.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        '$name\n${size.toInt()}px',
        textAlign: TextAlign.center,
        style: TypographyTokens.bodyS(cs.onSurface),
      ),
    ],
  );
}

Widget _buildRadiusSection(BuildContext context) {
  final cs = Theme.of(context).colorScheme;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Border Radius', style: TypographyTokens.headingL(cs.onSurface)),
      const SizedBox(height: 16),
      Row(
        children: [
          _radiusSwatch('r100', 4, cs),
          const SizedBox(width: 16),
          _radiusSwatch('r200', 8, cs),
          const SizedBox(width: 16),
          _radiusSwatch('r400', 16, cs),
        ],
      ),
    ],
  );
}

Widget _radiusSwatch(String name, double radius, ColorScheme cs) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: cs.tertiary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        '$name\n${radius.toInt()}px',
        textAlign: TextAlign.center,
        style: TypographyTokens.bodyS(cs.onSurface),
      ),
    ],
  );
}

Widget _buildElevationSection(BuildContext context) {
  final cs = Theme.of(context).colorScheme;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Elevation', style: TypographyTokens.headingL(cs.onSurface)),
      const SizedBox(height: 16),
      Row(
        children: [
          _elevationSwatch('e0', 0, cs),
          const SizedBox(width: 16),
          _elevationSwatch('e1', 1, cs),
          const SizedBox(width: 16),
          _elevationSwatch('e2', 2, cs),
          const SizedBox(width: 16),
          _elevationSwatch('e4', 4, cs),
          const SizedBox(width: 16),
          _elevationSwatch('e8', 8, cs),
        ],
      ),
    ],
  );
}

Widget _elevationSwatch(String name, double elevation, ColorScheme cs) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: cs.shadow.withOpacity(0.1),
              blurRadius: elevation * 2,
              offset: Offset(0, elevation),
            ),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Text(
        '$name\n${elevation.toInt()}px',
        textAlign: TextAlign.center,
        style: TypographyTokens.bodyS(cs.onSurface),
      ),
    ],
  );
}
