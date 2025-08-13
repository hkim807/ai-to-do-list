import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/choice_chip.dart';

@widgetbook.UseCase(name: 'Selected', type: DsChoiceChip)
Widget selectedChip(BuildContext context) {
  return Center(
    child: DsChoiceChip(
      label: 'Career/Study',
      selected: true,
      onChanged: (_) {},
    ),
  );
}

@widgetbook.UseCase(name: 'Unselected', type: DsChoiceChip)
Widget unselectedChip(BuildContext context) {
  return Center(
    child: DsChoiceChip(
      label: 'Health & Fitness',
      selected: false,
      onChanged: (_) {},
    ),
  );
}

@widgetbook.UseCase(name: 'Table', type: DsChoiceChip)
Widget tableChip(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        DsChoiceChip(label: 'Career/Study', selected: true),
        SizedBox(height: 12),
        DsChoiceChip(label: 'Health & Fitness', selected: false),
        SizedBox(height: 12),
        DsChoiceChip(label: 'Relationships', selected: false),
        SizedBox(height: 12),
        DsChoiceChip(label: 'Personal Growth', selected: true),
        SizedBox(height: 12),
        DsChoiceChip(label: 'Other (write in)', selected: false),
      ],
    ),
  );
}


