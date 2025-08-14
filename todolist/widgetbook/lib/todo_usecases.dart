import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/checkbox.dart';
import 'package:todolist/design_system/components/tag.dart';
import 'package:todolist/design_system/components/task_item.dart';

@widgetbook.UseCase(name: 'Checkbox', type: DsCheckbox)
Widget checkboxUsecase(BuildContext context) {
  return Center(
    child: DsCheckbox(value: true, onChanged: (_) {}, label: 'Complete task'),
  );
}

@widgetbook.UseCase(name: 'Tag – colors', type: DsTag)
Widget tagUsecase(BuildContext context) {
  return Wrap(
    spacing: 12,
    children: const [
      DsTag(label: 'Brand', color: DsTagColor.brand),
      DsTag(label: 'Neutral', color: DsTagColor.neutral),
      DsTag(label: 'Positive', color: DsTagColor.positive),
      DsTag(label: 'Warning', color: DsTagColor.warning),
      DsTag(label: 'Danger', color: DsTagColor.danger),
    ],
  );
}

@widgetbook.UseCase(name: 'Task item', type: DsTaskItem)
Widget taskItemUsecase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        DsTaskItem(
          label: 'Finish design system integration',
          selected: false,
          color: DsChipColor.brand,
        ),
        SizedBox(height: 12),
        DsTaskItem(
          label: 'Write tests',
          selected: true,
          color: DsChipColor.positive,
        ),
      ],
    ),
  );
}
