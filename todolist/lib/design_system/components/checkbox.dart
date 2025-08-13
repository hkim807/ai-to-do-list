import 'package:flutter/material.dart';

class DsCheckbox extends StatelessWidget {
  const DsCheckbox({super.key, required this.value, this.onChanged, this.label});

  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final checkbox = Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: cs.primary,
      checkColor: cs.onPrimary,
      side: BorderSide(color: cs.outline, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    if (label == null) return checkbox;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        checkbox,
        const SizedBox(width: 8),
        Text(label!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: cs.onSurface)),
      ],
    );
  }
}


