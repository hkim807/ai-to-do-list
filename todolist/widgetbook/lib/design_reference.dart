import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Input Field – Figma reference', type: Image)
Widget inputDesignReference(BuildContext context) {
  return Center(
    child: InteractiveViewer(
      minScale: 0.5,
      maxScale: 3,
      child: Image.asset('assets/figma/input-field.png', fit: BoxFit.contain),
    ),
  );
}
