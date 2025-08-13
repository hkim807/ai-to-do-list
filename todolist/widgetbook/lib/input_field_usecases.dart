import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/input_field.dart';

@widgetbook.UseCase(name: 'Default', type: DsTextField)
Widget inputDefault(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: DsTextField(
      label: 'YOUR EMAIL',
      placeholder: 'Email',
    ),
  );
}

@widgetbook.UseCase(name: 'Placeholder', type: DsTextField)
Widget inputPlaceholder(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: DsTextField(
      label: 'YOUR EMAIL',
      placeholder: 'Email',
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: DsTextField)
Widget inputDisabled(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: DsTextField(
      label: 'YOUR EMAIL',
      placeholder: 'Email',
      enabled: false,
    ),
  );
}

@widgetbook.UseCase(name: 'Error', type: DsTextField)
Widget inputError(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: DsTextField(
      label: 'YOUR EMAIL',
      placeholder: 'Email',
      errorText: 'Required',
    ),
  );
}


