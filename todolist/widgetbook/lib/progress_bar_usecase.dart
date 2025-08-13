import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/progress_bar.dart';

@widgetbook.UseCase(name: 'Default', type: DsProgressBar)
Widget progressDefault(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: DsProgressBar(value: 0.4),
  );
}


