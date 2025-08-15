import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/primary_button.dart';

@widgetbook.UseCase(name: 'Primary – Default', type: DsPrimaryButton)
Widget primaryDefault(BuildContext context) => const DsPrimaryButton(label: 'Continue');

@widgetbook.UseCase(name: 'Primary – Disabled', type: DsPrimaryButton)
Widget primaryDisabled(BuildContext context) => const DsPrimaryButton(label: 'Continue', enabled: false);


