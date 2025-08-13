import 'package:flutter/material.dart';

class DsProgressBar extends StatelessWidget {
  const DsProgressBar({super.key, required this.value});
  final double value; // 0..1

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      height: 12,
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 3),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: value.clamp(0, 1),
          child: Container(
            decoration: BoxDecoration(
              color: cs.primary,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
