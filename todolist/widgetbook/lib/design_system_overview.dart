import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/button.dart';
import 'package:todolist/design_system/components/input_field.dart';
import 'package:todolist/design_system/components/primary_button.dart';

@widgetbook.UseCase(name: 'Design System – Overview', type: Scaffold)
Widget designSystemOverview(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: [
          _themeSection(context, 'Light Theme', ThemeData.light()),
          const SizedBox(height: 32),
          _themeSection(context, 'Dark Theme', ThemeData.dark()),
        ],
      ),
    ),
  );
}

Widget _themeSection(BuildContext context, String title, ThemeData theme) {
  Widget cell(Widget child) => Padding(
    padding: const EdgeInsets.all(12),
    child: Center(child: child),
  );

  return Theme(
    data: theme,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(3),
            2: FlexColumnWidth(3),
          },
          border: TableBorder.all(color: Colors.black12),
          children: [
            const TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Component',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Default',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Disabled',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                cell(const Text('Button – Primary')),
                cell(const DsPrimaryButton(label: 'Sign up')),
                cell(const DsPrimaryButton(label: 'Sign up', enabled: false)),
              ],
            ),
            TableRow(
              children: [
                cell(const Text('Button – Neutral')),
                cell(
                  const DsButton(
                    label: 'Sign up',
                    variant: DsButtonVariant.neutral,
                  ),
                ),
                cell(
                  const DsButton(
                    label: 'Sign up',
                    variant: DsButtonVariant.neutral,
                    enabled: false,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                cell(const Text('Button – Subtle')),
                cell(
                  const DsButton(
                    label: 'Sign up',
                    variant: DsButtonVariant.subtle,
                  ),
                ),
                cell(
                  const DsButton(
                    label: 'Sign up',
                    variant: DsButtonVariant.subtle,
                    enabled: false,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                cell(const Text('Text Field')),
                cell(
                  const DsTextField(label: 'YOUR EMAIL', placeholder: 'Email'),
                ),
                cell(
                  const DsTextField(
                    label: 'YOUR EMAIL',
                    placeholder: 'Email',
                    enabled: false,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                cell(const Text('Text Field – Error')),
                cell(
                  const DsTextField(
                    label: 'YOUR EMAIL',
                    placeholder: 'Email',
                    errorText: 'Required',
                  ),
                ),
                cell(const SizedBox.shrink()),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
