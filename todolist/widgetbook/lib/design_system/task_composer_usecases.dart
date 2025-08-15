import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/task_composer.dart';

@widgetbook.UseCase(name: 'Task Composer - Default', type: Scaffold)
Widget taskComposerDefault(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF7F4ED),
    body: Column(
      children: [
        const Spacer(),
        DsTaskComposer(
          onMicPressed: () => ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Mic pressed'))),
          onSend: (text, date, priority) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Send: $text'))),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Task Composer - With Values', type: Scaffold)
Widget taskComposerWithValues(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF7F4ED),
    body: Column(
      children: [
        const Spacer(),
        DsTaskComposer(
          initialText: 'KEB meeting',
          initialDate: DateTime.now(),
          initialPriority: DsPriority.low,
          onSend: (text, date, priority) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Send: $text'))),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Task Composer - Long Text', type: Scaffold)
Widget taskComposerLongText(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF7F4ED),
    body: Column(
      children: [
        const Spacer(),
        DsTaskComposer(
          initialText:
              'Research priority settings and update specs with detailed acceptance criteria',
          onSend: (text, date, priority) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Send: ${text.length} chars'))),
        ),
      ],
    ),
  );
}
