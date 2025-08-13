import 'package:flutter/material.dart';

/// Pill-like selectable option with an optional leading tick, matching Figma spec.
enum DsChipColor { brand, neutral, positive, warning, danger }

class DsTaskItem extends StatelessWidget {
  const DsTaskItem({
    super.key,
    required this.label,
    required this.selected,
    this.enabled = true,
    this.onChanged,
    this.color = DsChipColor.brand,
  });

  final String label;
  final bool selected;
  final bool enabled;
  final ValueChanged<bool>? onChanged;
  final DsChipColor color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    // Accent color by variant
    Color accent;
    switch (color) {
      case DsChipColor.brand:
        accent = cs.primary;
        break;
      case DsChipColor.neutral:
        accent = cs.outline;
        break;
      case DsChipColor.positive:
        accent = cs.tertiary; // mapped to positive
        break;
      case DsChipColor.warning:
        accent = cs.secondary; // use secondary as warning proxy
        break;
      case DsChipColor.danger:
        accent = cs.error;
        break;
    }

    // Container background and border derived from ColorScheme
    final Color containerBg = theme.brightness == Brightness.light
        ? cs
              .surfaceVariant // light gray like #EDEDED
        : cs.surface; // dark surface

    final BorderSide border = BorderSide(
      color: selected ? accent : cs.outline.withOpacity(0.6),
      width: selected ? 2 : 1,
    );

    // Tick circle colors
    final Color tickBg = selected ? accent : Colors.transparent;
    final BorderSide tickBorder = BorderSide(
      color: selected ? accent : cs.outline.withOpacity(0.8),
      width: 2,
    );
    final Color tickIcon = selected
        ? (color == DsChipColor.neutral ? cs.onSurface : cs.onPrimary)
        : cs.onSurface.withOpacity(0.6);

    final radius = const BorderRadius.all(Radius.circular(9999));

    final Widget tick = Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: tickBg,
        border: tickBorder == BorderSide.none
            ? null
            : Border.fromBorderSide(tickBorder),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: selected
          ? Icon(Icons.check, size: 16, color: tickIcon)
          : const SizedBox.shrink(),
    );

    final labelWidget = Text(
      label,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: enabled ? cs.onSurface : cs.onSurface.withOpacity(0.38),
      ),
    );

    final content = Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          tick,
          const SizedBox(width: 16),
          Flexible(child: labelWidget),
        ],
      ),
    );

    final decorated = DecoratedBox(
      decoration: BoxDecoration(
        color: containerBg,
        borderRadius: radius,
        border: Border(
          top: border,
          left: border,
          right: border,
          bottom: BorderSide(
            color: border.color,
            width: (selected ? 2 : 1).toDouble(),
          ),
        ),
      ),
      child: content,
    );

    if (!enabled) return Opacity(opacity: 0.6, child: decorated);

    return InkWell(
      borderRadius: radius,
      onTap: onChanged == null ? null : () => onChanged!(!selected),
      child: decorated,
    );
  }
}
