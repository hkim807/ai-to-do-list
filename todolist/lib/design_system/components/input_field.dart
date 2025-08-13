import 'package:flutter/material.dart';

/// Design system text input field with label, placeholder, error, and disabled states.
class DsTextField extends StatelessWidget {
  const DsTextField({
    super.key,
    required this.label,
    this.placeholder,
    this.enabled = true,
    this.errorText,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  final String label;
  final String? placeholder;
  final bool enabled;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final borderRadius = BorderRadius.circular(16);
    final outlineColor = errorText != null ? cs.error : cs.outline;

    OutlineInputBorder outline(Color color) => OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: color),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(color: cs.onSurface),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: placeholder,
            filled: true,
            fillColor: theme.inputDecorationTheme.fillColor ?? cs.surface,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            border: outline(outlineColor),
            enabledBorder: outline(outlineColor),
            disabledBorder: outline(cs.outline.withOpacity(0.6)),
            focusedBorder: outline(cs.primary),
            errorText: errorText,
            errorBorder: outline(cs.error),
            focusedErrorBorder: outline(cs.error),
          ),
        ),
      ],
    );
  }
}


