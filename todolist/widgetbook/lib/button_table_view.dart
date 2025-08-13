import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/button.dart';
import 'package:todolist/design_system/components/dropdown.dart';
import 'package:todolist/design_system/components/task_item.dart';
import 'package:todolist/design_system/components/task_input_dropdown.dart';

@widgetbook.UseCase(name: 'Button Design System Table', type: Scaffold)
Widget buttonDesignSystemTable(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Button Design System',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildButtonTable(context, 'Light Theme', false),
                  const SizedBox(height: 48),
                  _buildButtonTable(context, 'Dark Theme', true),
                  const SizedBox(height: 48),
                  _buildTaskDropdownSection(context, 'Light Theme', false),
                  const SizedBox(height: 48),
                  _buildTaskDropdownSection(context, 'Dark Theme', true),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildButtonTable(BuildContext context, String title, bool isDark) {
  final theme = isDark ? ThemeData.dark() : ThemeData.light();

  return Theme(
    data: theme,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            columnWidths: const {
              0: FlexColumnWidth(1.5),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(2),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.grey.shade50),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Variant',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Default',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Hover',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Disabled',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Primary'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: DsButton(
                        label: 'Sign up',
                        variant: DsButtonVariant.neutral,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: DsButton(
                        label: 'Sign up',
                        variant: DsButtonVariant.neutral,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: DsButton(
                        label: 'Sign up',
                        variant: DsButtonVariant.neutral,
                        enabled: false,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Neutral'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: DsButton(
                        label: 'Sign up',
                        variant: DsButtonVariant.neutral,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: DsButton(
                        label: 'Sign up',
                        variant: DsButtonVariant.neutral,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: DsButton(
                        label: 'Sign up',
                        variant: DsButtonVariant.neutral,
                        enabled: false,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Subtle'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: DsButton(
                        label: 'Sign up',
                        variant: DsButtonVariant.subtle,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: DsButton(
                        label: 'Sign up',
                        variant: DsButtonVariant.subtle,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: DsButton(
                        label: 'Sign up',
                        variant: DsButtonVariant.subtle,
                        enabled: false,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildTaskDropdownSection(
  BuildContext context,
  String title,
  bool isDark,
) {
  final theme = isDark ? ThemeData.dark() : ThemeData.light();

  return Theme(
    data: theme,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              '$title - Task Input Dropdown Component',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Input Area with Dropdown',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                _buildTaskInputArea(context),
                const SizedBox(height: 32),
                Text(
                  'Task Items Examples',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                _buildTaskItemsList(context),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildTaskInputArea(BuildContext context) {
  final List<String> taskOptions = [
    'Product review',
    'Design system update',
    'User research',
    'Code refactoring',
    'Documentation update',
  ];

  return DsTaskInputDropdown(
    taskOptions: taskOptions,
    onTaskSelected: (task) {
      // Handle task selection
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Selected task: $task')));
    },
    onNewTaskRequested: () {
      // Handle new task request
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('New task requested - microphone button tapped'),
        ),
      );
    },
    onDateChanged: (date) {
      // Handle date change
      if (date != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Date selected: ${date.toString().split(' ')[0]}'),
          ),
        );
      }
    },
    onPriorityChanged: (priority) {
      // Handle priority change
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Priority selected: $priority')));
    },
  );
}

Widget _buildTaskItemsList(BuildContext context) {
  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Product review',
      'completed': false,
      'importance': true,
      'urgency': true,
    },
    {
      'title': 'Design system update',
      'completed': false,
      'importance': true,
      'urgency': false,
    },
    {
      'title': 'User research',
      'completed': false,
      'importance': false,
      'urgency': false,
    },
    {
      'title': 'Code refactoring',
      'completed': false,
      'importance': false,
      'urgency': true,
    },
  ];

  return Column(
    children: tasks.map((task) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: DsTaskItem(
          label: task['title'],
          selected: task['completed'],
          onChanged: (value) {
            // Handle task completion
          },
        ),
      );
    }).toList(),
  );
}
