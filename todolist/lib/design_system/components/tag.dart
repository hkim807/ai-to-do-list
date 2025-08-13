import 'package:flutter/material.dart';

enum DsTagColor { brand, neutral, positive, warning, danger }

class DsTag extends StatelessWidget {
  const DsTag({super.key, required this.label, this.color = DsTagColor.neutral});

  final String label;
  final DsTagColor color;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    Color bg() {
      switch (color) {
        case DsTagColor.brand:
          return cs.primary.withOpacity(0.12);
        case DsTagColor.neutral:
          return cs.surfaceVariant;
        case DsTagColor.positive:
          return cs.tertiary.withOpacity(0.12);
        case DsTagColor.warning:
          return cs.error.withOpacity(0.12);
        case DsTagColor.danger:
          return cs.error.withOpacity(0.12);
      }
    }

    Color fg() {
      switch (color) {
        case DsTagColor.brand:
          return cs.primary;
        case DsTagColor.neutral:
          return cs.onSurfaceVariant;
        case DsTagColor.positive:
          return cs.tertiary;
        case DsTagColor.warning:
          return cs.error;
        case DsTagColor.danger:
          return cs.error;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg(),
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: fg(), fontWeight: FontWeight.w600),
      ),
    );
  }
}


