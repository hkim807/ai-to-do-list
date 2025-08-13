import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/tokens/size_tokens.dart';
import 'package:todolist/design_system/tokens/typography.dart';
import 'package:todolist/design_system/theme/color_scheme.dart';

@widgetbook.UseCase(name: 'Design Tokens Catalog', type: Scaffold)
Widget designTokensCatalog(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: [
          _buildColorSchemeSection(context, 'ColorScheme – Light', sdsLightColorScheme()),
          const SizedBox(height: 32),
          _buildColorSchemeSection(context, 'ColorScheme – Dark', sdsDarkColorScheme()),
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

Widget _buildColorSchemeSection(BuildContext context, String title, ColorScheme cs) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: 16),
      Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          _colorSwatch('primary', cs.primary),
          _colorSwatch('onPrimary', cs.onPrimary),
          _colorSwatch('background', cs.background),
          _colorSwatch('onBackground', cs.onBackground),
          _colorSwatch('surface', cs.surface),
          _colorSwatch('onSurface', cs.onSurface),
          _colorSwatch('surfaceVariant', cs.surfaceVariant),
          _colorSwatch('onSurfaceVariant', cs.onSurfaceVariant),
          _colorSwatch('outline', cs.outline),
          _colorSwatch('error', cs.error),
          _colorSwatch('tertiary', cs.tertiary),
          _colorSwatch('onTertiary', cs.onTertiary),
        ],
      ),
    ],
  );
}

Widget _colorSwatch(String name, Color color) {
  return Container(
    width: 120,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
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
              Text(
                name,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              Text(
                '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildTypographySection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Typography', style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Headline Large', style: Theme.of(context).textTheme.headlineLarge),
          Text('Headline Medium', style: Theme.of(context).textTheme.headlineMedium),
          Text('Headline Small', style: Theme.of(context).textTheme.headlineSmall),
          Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
          Text('Title Medium', style: Theme.of(context).textTheme.titleMedium),
          Text('Title Small', style: Theme.of(context).textTheme.titleSmall),
          Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
          Text('Body Medium', style: Theme.of(context).textTheme.bodyMedium),
          Text('Body Small', style: Theme.of(context).textTheme.bodySmall),
          Text('Label Large', style: Theme.of(context).textTheme.labelLarge),
          Text('Label Medium', style: Theme.of(context).textTheme.labelMedium),
          Text('Label Small', style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    ],
  );
}

Widget _buildSpacingSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Spacing Scale', style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: 16),
      Row(
        children: [
          _spacingSwatch('s100', 4),
          const SizedBox(width: 16),
          _spacingSwatch('s200', 8),
          const SizedBox(width: 16),
          _spacingSwatch('s300', 12),
          const SizedBox(width: 16),
          _spacingSwatch('s400', 16),
          const SizedBox(width: 16),
          _spacingSwatch('s600', 24),
        ],
      ),
    ],
  );
}

Widget _spacingSwatch(String name, double size) {
  return Column(
    children: [
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.blue.shade300,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        '$name\n${size.toInt()}px',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}

Widget _buildRadiusSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Border Radius', style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: 16),
      Row(
        children: [
          _radiusSwatch('r100', 4),
          const SizedBox(width: 16),
          _radiusSwatch('r200', 8),
          const SizedBox(width: 16),
          _radiusSwatch('r400', 16),
        ],
      ),
    ],
  );
}

Widget _radiusSwatch(String name, double radius) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        '$name\n${radius.toInt()}px',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}

Widget _buildElevationSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Elevation', style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: 16),
      Row(
        children: [
          _elevationSwatch('e0', 0),
          const SizedBox(width: 16),
          _elevationSwatch('e1', 1),
          const SizedBox(width: 16),
          _elevationSwatch('e2', 2),
          const SizedBox(width: 16),
          _elevationSwatch('e4', 4),
          const SizedBox(width: 16),
          _elevationSwatch('e8', 8),
        ],
      ),
    ],
  );
}

Widget _elevationSwatch(String name, double elevation) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
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
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}
