import 'package:flutter/material.dart';
import 'choice_chip.dart' show DsChipColor;

class DsCheckChip extends StatelessWidget {
  const DsCheckChip({
    super.key,
    required this.label,
    this.selected = false,
    this.enabled = true,
    this.onChanged,
    this.color = DsChipColor.neutral,
  });

  final String label;
  final bool selected;
  final bool enabled;
  final ValueChanged<bool>? onChanged;
  final DsChipColor color;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    Color getChipColor() {
      if (!enabled) return cs.surfaceVariant;
      switch (color) {
        case DsChipColor.brand:
          return selected ? cs.primary : cs.surfaceVariant;
        case DsChipColor.neutral:
          return selected ? cs.surfaceVariant : cs.surface;
        case DsChipColor.positive:
          return selected ? cs.tertiary : cs.surfaceVariant;
        case DsChipColor.warning:
          return selected ? cs.error : cs.surfaceVariant;
        case DsChipColor.danger:
          return selected ? cs.error : cs.surfaceVariant;
      }
    }

    Color getBorderColor() {
      if (!enabled) return cs.outline.withOpacity(0.6);
      switch (color) {
        case DsChipColor.brand:
          return selected ? cs.primary : cs.outline;
        case DsChipColor.neutral:
          return cs.outline;
        case DsChipColor.positive:
          return selected ? cs.tertiary : cs.outline;
        case DsChipColor.warning:
          return selected ? cs.error : cs.outline;
        case DsChipColor.danger:
          return selected ? cs.error : cs.outline;
      }
    }

    Color getTextColor() {
      if (!enabled) return cs.onSurface.withOpacity(0.38);
      switch (color) {
        case DsChipColor.brand:
          return selected ? cs.onPrimary : cs.onSurface;
        case DsChipColor.neutral:
          return cs.onSurface;
        case DsChipColor.positive:
          return selected ? cs.onTertiary : cs.onSurface;
        case DsChipColor.warning:
          return selected ? cs.onError : cs.onSurface;
        case DsChipColor.danger:
          return selected ? cs.onError : cs.onSurface;
      }
    }

    Color getCheckmarkColor() {
      if (!enabled) return cs.onSurface.withOpacity(0.38);
      switch (color) {
        case DsChipColor.brand:
          return selected ? cs.onPrimary : cs.outline;
        case DsChipColor.neutral:
          return selected ? cs.onSurface : cs.outline;
        case DsChipColor.positive:
          return selected ? cs.onTertiary : cs.outline;
        case DsChipColor.warning:
          return selected ? cs.onError : cs.outline;
        case DsChipColor.danger:
          return selected ? cs.onError : cs.outline;
      }
    }

    return FilterChip(
      label: Text(label, style: TextStyle(color: getTextColor())),
      selected: selected,
      onSelected: enabled ? onChanged : null,
      selectedColor: getChipColor(),
      disabledColor: getChipColor(),
      backgroundColor: getChipColor(),
      showCheckmark: true,
      checkmarkColor: getCheckmarkColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9999),
        side: BorderSide(color: getBorderColor(), width: selected ? 2 : 1),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}


