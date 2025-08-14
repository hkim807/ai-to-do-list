import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/task_input_dropdown.dart';

@widgetbook.UseCase(name: 'Task Input Dropdown - Default State', type: Scaffold)
Widget taskInputDropdownDefault(BuildContext context) {
  final List<String> taskOptions = [
    'Product review',
    'Design system update',
    'User research',
    'Code refactoring',
    'Documentation update',
  ];

  return Scaffold(
    backgroundColor: const Color(0xFFF7F4ED),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Input Dropdown Component',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'This component allows users to select from existing tasks or create new ones. It includes date selection, priority setting, and voice input for new tasks.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: DsTaskInputDropdown(
                taskOptions: taskOptions,
                onTaskSelected: (task) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected task: $task')),
                  );
                },
                onNewTaskRequested: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'New task requested - microphone button tapped',
                      ),
                    ),
                  );
                },
                onDateChanged: (date) {
                  if (date != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Date selected: ${date.toString().split(' ')[0]}',
                        ),
                      ),
                    );
                  }
                },
                onPriorityChanged: (priority) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Priority selected: $priority')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Task Input Dropdown - With Pre-selected Values',
  type: Scaffold,
)
Widget taskInputDropdownWithValues(BuildContext context) {
  final List<String> taskOptions = [
    'Product review',
    'Design system update',
    'User research',
    'Code refactoring',
    'Documentation update',
  ];

  return Scaffold(
    backgroundColor: const Color(0xFFF7F4ED),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Input Dropdown - Pre-selected State',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'This example shows the component with pre-selected task, date, and priority values.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: DsTaskInputDropdown(
                taskOptions: taskOptions,
                selectedTask: 'Design system update',
                selectedDate: DateTime.now().add(const Duration(days: 2)),
                selectedPriority: 'high',
                onTaskSelected: (task) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected task: $task')),
                  );
                },
                onNewTaskRequested: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'New task requested - microphone button tapped',
                      ),
                    ),
                  );
                },
                onDateChanged: (date) {
                  if (date != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Date selected: ${date.toString().split(' ')[0]}',
                        ),
                      ),
                    );
                  }
                },
                onPriorityChanged: (priority) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Priority selected: $priority')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Task Input Dropdown - Empty State', type: Scaffold)
Widget taskInputDropdownEmpty(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF7F4ED),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Input Dropdown - Empty State',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'This example shows the component with no existing tasks, highlighting the "Create new task" functionality.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: DsTaskInputDropdown(
                taskOptions: [],
                onTaskSelected: (task) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected task: $task')),
                  );
                },
                onNewTaskRequested: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'New task requested - microphone button tapped',
                      ),
                    ),
                  );
                },
                onDateChanged: (date) {
                  if (date != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Date selected: ${date.toString().split(' ')[0]}',
                        ),
                      ),
                    );
                  }
                },
                onPriorityChanged: (priority) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Priority selected: $priority')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Task Input Dropdown - Integration Example',
  type: Scaffold,
)
Widget taskInputDropdownIntegration(BuildContext context) {
  final List<String> taskOptions = [
    'Product review',
    'Design system update',
    'User research',
    'Code refactoring',
    'Documentation update',
    'Team meeting',
    'Bug fix',
    'Performance optimization',
  ];

  return Scaffold(
    backgroundColor: const Color(0xFFF7F4ED),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Input Dropdown - Integration Example',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'This example shows how the component integrates with a task management system, including task selection feedback and state management.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Column(
                children: [
                  DsTaskInputDropdown(
                    taskOptions: taskOptions,
                    onTaskSelected: (task) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Task added to queue: $task'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    onNewTaskRequested: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Voice input activated - speak your task',
                          ),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    },
                    onDateChanged: (date) {
                      if (date != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Due date set: ${date.toString().split(' ')[0]}',
                            ),
                            backgroundColor: Colors.orange,
                          ),
                        );
                      }
                    },
                    onPriorityChanged: (priority) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Priority level set: $priority'),
                          backgroundColor: _getPriorityColor(priority),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Component Features:',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        _buildFeatureItem(
                          '📅 Date selection with smart formatting',
                        ),
                        _buildFeatureItem(
                          '🏁 Priority setting with color coding',
                        ),
                        _buildFeatureItem('🎤 Voice input for new tasks'),
                        _buildFeatureItem(
                          '📋 Dropdown with existing task options',
                        ),
                        _buildFeatureItem('✨ Create new task option'),
                        _buildFeatureItem(
                          '🎨 Matches Figma design specifications',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildFeatureItem(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    ),
  );
}

Color _getPriorityColor(String? priority) {
  switch (priority) {
    case 'high':
      return Colors.red;
    case 'medium':
      return Colors.orange;
    case 'low':
      return Colors.green;
    default:
      return Colors.grey;
  }
}
