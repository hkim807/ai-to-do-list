import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/check_chip.dart';
import 'package:todolist/design_system/components/choice_chip.dart';

@widgetbook.UseCase(name: 'Check Chip – Variants', type: DsCheckChip)
Widget checkChipVariants(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Wrap(
      spacing: 12,
      runSpacing: 12,
      children: const [
        DsCheckChip(label: 'Brand', color: DsChipColor.brand, selected: false),
        DsCheckChip(label: 'Brand', color: DsChipColor.brand, selected: true),
        DsCheckChip(label: 'Neutral', color: DsChipColor.neutral, selected: false),
        DsCheckChip(label: 'Neutral', color: DsChipColor.neutral, selected: true),
        DsCheckChip(label: 'Positive', color: DsChipColor.positive, selected: false),
        DsCheckChip(label: 'Positive', color: DsChipColor.positive, selected: true),
        DsCheckChip(label: 'Warning', color: DsChipColor.warning, selected: false),
        DsCheckChip(label: 'Warning', color: DsChipColor.warning, selected: true),
        DsCheckChip(label: 'Danger', color: DsChipColor.danger, selected: false),
        DsCheckChip(label: 'Danger', color: DsChipColor.danger, selected: true),
        DsCheckChip(label: 'Disabled', color: DsChipColor.neutral, selected: false, enabled: false),
        DsCheckChip(label: 'Disabled', color: DsChipColor.brand, selected: true, enabled: false),
      ],
    ),
  );
}


