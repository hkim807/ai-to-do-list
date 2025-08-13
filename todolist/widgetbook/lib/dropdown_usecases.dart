import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/dropdown.dart';

@widgetbook.UseCase(name: 'Default', type: DsDropdown)
Widget dropdownDefault(BuildContext context) {
  String? value = 'Career';
  final items = ['Career', 'Health', 'Relationships', 'Personal Growth']
      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
      .toList();
  return StatefulBuilder(builder: (context, setState) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: DsDropdown<String>(
        label: 'Select area',
        hint: 'Choose one',
        value: value,
        items: items,
        onChanged: (v) => setState(() => value = v),
      ),
    );
  });
}


