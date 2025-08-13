import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/button.dart';

@widgetbook.UseCase(name: 'Neutral - Default', type: DsButton)
Widget neutralDefault(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: DsButton(label: 'Sign up', variant: DsButtonVariant.neutral),
  );
}

@widgetbook.UseCase(name: 'Neutral - Disabled', type: DsButton)
Widget neutralDisabled(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: DsButton(
      label: 'Sign up',
      variant: DsButtonVariant.neutral,
      enabled: false,
    ),
  );
}

@widgetbook.UseCase(name: 'Subtle - Default', type: DsButton)
Widget subtleDefault(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: DsButton(label: 'Sign up', variant: DsButtonVariant.subtle),
  );
}

@widgetbook.UseCase(name: 'Subtle - Disabled', type: DsButton)
Widget subtleDisabled(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: DsButton(
      label: 'Sign up',
      variant: DsButtonVariant.subtle,
      enabled: false,
    ),
  );
}

@widgetbook.UseCase(name: 'All Variants Grid', type: DsButton)
Widget allVariantsGrid(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            // DsButton(label: 'Sign up', variant: DsButtonVariant.primary),
            DsButton(label: 'Sign up', variant: DsButtonVariant.neutral),
            DsButton(label: 'Sign up', variant: DsButtonVariant.subtle),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            DsButton(
              label: 'Sign up',
              iconLeft: Icon(Icons.code, size: 20),
              variant: DsButtonVariant.subtle,
              enabled: false,
            ),
            DsButton(
              label: 'Sign up',
              iconLeft: Icon(Icons.code, size: 20),
              variant: DsButtonVariant.neutral,
              enabled: false,
            ),
            DsButton(
              label: 'Sign up',
              iconLeft: Icon(Icons.code, size: 20),
              variant: DsButtonVariant.subtle,
              enabled: false,
            ),
          ],
        ),
      ],
    ),
  );
}
