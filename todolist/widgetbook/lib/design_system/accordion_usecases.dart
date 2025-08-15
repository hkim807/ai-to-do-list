import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/accordion.dart';

@widgetbook.UseCase(name: 'Accordion - Quadrants', type: Scaffold)
Widget accordionQuadrants(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF7F4ED),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            DsAccordionSection(
              title: 'Urgent & Important',
              leading: const Icon(Icons.wb_sunny_outlined, size: 22),
              onAddPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add task: Urgent & Important')),
                );
              },
              children: [
                dsTask(title: 'Product review'),
                dsTask(title: 'Prepare release notes'),
              ],
            ),
            const SizedBox(height: 16),
            DsAccordionSection(
              title: 'Not Urgent & Important',
              leading: const Icon(Icons.wb_cloudy_outlined, size: 22),
              initiallyExpanded: false,
              onAddPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Add task: Not Urgent & Important'),
                  ),
                );
              },
              children: [
                dsTask(title: 'Design system update'),
                dsTask(title: 'User research planning'),
              ],
            ),
            const SizedBox(height: 16),
            DsAccordionSection(
              title: 'Not Urgent & Not Important',
              leading: const Icon(Icons.ac_unit_outlined, size: 22),
              initiallyExpanded: false,
              onAddPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Add task: Not Urgent & Not Important'),
                  ),
                );
              },
              children: [
                dsTask(title: 'Tidy workspace'),
                dsTask(title: 'Inbox zero'),
              ],
            ),
            const SizedBox(height: 16),
            DsAccordionSection(
              title: 'Urgent & Not Important',
              leading: const Icon(Icons.ac_unit, size: 22),
              initiallyExpanded: false,
              onAddPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Add task: Urgent & Not Important'),
                  ),
                );
              },
              children: [
                dsTask(title: 'Quick fix: content typo'),
                dsTask(title: 'Ping teammate'),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Accordion - Empty State', type: Scaffold)
Widget accordionEmpty(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF7F4ED),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: DsAccordionSection(
          title: 'My Tasks',
          leading: const Icon(Icons.flag_outlined, size: 22),
          children: const [],
          onAddPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Add task: My Tasks')));
          },
        ),
      ),
    ),
  );
}
