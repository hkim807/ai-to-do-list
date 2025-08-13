import 'package:flutter/material.dart';
import 'package:todolist/design_system/tokens/spacing.dart';

enum DsButtonVariant { neutral, subtle }

class DsButton extends StatefulWidget {
  const DsButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = DsButtonVariant.neutral,
    this.enabled = true,
    this.iconLeft,
    this.iconRight,
  });

  final String label;
  final VoidCallback? onPressed;
  final DsButtonVariant variant;
  final bool enabled;
  final Widget? iconLeft;
  final Widget? iconRight;

  @override
  State<DsButton> createState() => _DsButtonState();
}

class _DsButtonState extends State<DsButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = cs.brightness == Brightness.dark;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    );

    ButtonStyle styleFor(DsButtonVariant v) {
      switch (v) {
        case DsButtonVariant.neutral:
          Color getBackgroundColor() {
            if (!widget.enabled) return cs.surface;
            if (_isHovered) {
              return isDark ? cs.surface : cs.surface.withOpacity(0.8);
            }
            return isDark ? cs.surface : cs.surface;
          }

          final base = OutlinedButton.styleFrom(
            foregroundColor: widget.enabled
                ? cs.onSurface
                : cs.onSurface.withOpacity(0.38),
            minimumSize: const Size(0, 52),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: SpacingTokens.space300,
            ),
            shape: shape,
            backgroundColor: getBackgroundColor(),
            side: BorderSide(
              color: widget.enabled ? cs.outline : cs.outline.withOpacity(0.6),
            ),
          );
          return base.copyWith(
            backgroundColor: WidgetStatePropertyAll(getBackgroundColor()),
          );

        case DsButtonVariant.subtle:
          Color getBackgroundColor() {
            if (!widget.enabled) return Colors.transparent;
            if (_isHovered) {
              return cs.surfaceVariant.withOpacity(0.3);
            }
            return Colors.transparent;
          }

          final base = TextButton.styleFrom(
            foregroundColor: widget.enabled
                ? cs.onSurface
                : cs.onSurface.withOpacity(0.38),
            minimumSize: const Size(0, 52),
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingTokens.space300,
            ),
            shape: shape,
            backgroundColor: getBackgroundColor(),
          );
          return base.copyWith(
            backgroundColor: WidgetStatePropertyAll(getBackgroundColor()),
          );
      }
    }

    final style = styleFor(widget.variant);

    // Build button content with optional icons
    Widget buildButtonContent() {
      final text = Text(
        widget.label,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      );

      if (widget.iconLeft != null && widget.iconRight != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.iconLeft!,
            const SizedBox(width: 8),
            text,
            const SizedBox(width: 8),
            widget.iconRight!,
          ],
        );
      } else if (widget.iconLeft != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [widget.iconLeft!, const SizedBox(width: 8), text],
        );
      } else if (widget.iconRight != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [text, const SizedBox(width: 8), widget.iconRight!],
        );
      }

      return text;
    }

    final child = buildButtonContent();

    Widget button;
    switch (widget.variant) {
      case DsButtonVariant.neutral:
        button = OutlinedButton(
          onPressed: widget.enabled ? widget.onPressed : null,
          style: style,
          child: child,
        );
        break;
      case DsButtonVariant.subtle:
        button = TextButton(
          onPressed: widget.enabled ? widget.onPressed : null,
          style: style,
          child: child,
        );
        break;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: button,
    );
  }
}
