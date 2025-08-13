import 'package:flutter/material.dart';

enum DsStrokeStyle { none, full, bottomOnly }

class DsPrimaryButton extends StatefulWidget {
  const DsPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.enabled = true,
    this.strokeStyle = DsStrokeStyle.bottomOnly,
    this.strokeWidth = 1,
    this.strokeColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool enabled;
  final DsStrokeStyle strokeStyle;
  final double strokeWidth;
  final Color? strokeColor;

  @override
  State<DsPrimaryButton> createState() => _DsPrimaryButtonState();
}

class _DsPrimaryButtonState extends State<DsPrimaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final borderRadius = BorderRadius.circular(999);

    Color background() {
      if (!widget.enabled) return cs.primary;
      if (_isHovered) return cs.primaryContainer;
      return cs.primary;
    }

    final button = ElevatedButton(
      onPressed: widget.enabled ? widget.onPressed : null,
      style:
          ElevatedButton.styleFrom(
            backgroundColor: background(),
            foregroundColor: cs.onPrimary,
            minimumSize: const Size(0, 52),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) => background(),
            ),
            foregroundColor: WidgetStateProperty.all(cs.onPrimary),
            elevation: WidgetStateProperty.resolveWith((states) {
              if (!widget.enabled || states.contains(WidgetState.pressed))
                return 0.0;
              return 2.0;
            }),
            overlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) return Colors.black;
              if (states.contains(WidgetState.hovered)) return Colors.black;
              return null;
            }),
            side: WidgetStateProperty.all(
              BorderSide(
                color: widget.strokeColor ?? Colors.black,
                width: widget.strokeWidth,
              ),
            ),
          ),
      child: Text(widget.label),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        // Container goes INSIDE MouseRegion
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 3),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: button,
      ),
    );
  }
}
