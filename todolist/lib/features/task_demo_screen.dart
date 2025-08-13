import 'package:flutter/material.dart';
import '../design_system/components/task_input_dropdown.dart';
import '../design_system/components/task_item.dart';
import '../design_system/components/accordion.dart';

class TaskDemoScreen extends StatefulWidget {
  const TaskDemoScreen({super.key});

  @override
  State<TaskDemoScreen> createState() => _TaskDemoScreenState();
}

class _TaskDemoScreenState extends State<TaskDemoScreen> {
  final List<String> _taskOptions = [
    'Product review',
    'Design system update',
    'User research',
    'Code refactoring',
    'Documentation update',
    'Team meeting',
    'Bug fix',
    'Performance optimization',
  ];

  String? _selectedTask;
  DateTime? _selectedDate;
  String? _selectedPriority;
  final List<Map<String, dynamic>> _tasks = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4ED),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.maybePop(context),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Task Management',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: cs.onSurface,
                          ),
                        ),
                        Text(
                          'Organize your tasks efficiently',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Task input area
            Container(
              margin: const EdgeInsets.all(24),
              child: DsTaskInputDropdown(
                taskOptions: _taskOptions,
                selectedTask: _selectedTask,
                selectedDate: _selectedDate,
                selectedPriority: _selectedPriority,
                onTaskSelected: (task) {
                  setState(() {
                    _selectedTask = task;
                  });
                  _addTask(task!);
                },
                onNewTaskRequested: () {
                  _showNewTaskDialog(context);
                },
                onDateChanged: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
                onPriorityChanged: (priority) {
                  setState(() {
                    _selectedPriority = priority;
                  });
                },
              ),
            ),

            // Accordions
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  DsAccordionSection(
                    title: 'Urgent & Important',
                    leading: const Icon(Icons.wb_sunny_outlined, size: 22),
                    onAddPressed: () => _showNewTaskDialog(context),
                    children: [
                      ..._tasks
                          .take(2)
                          .map(
                            (t) => DsTaskItem(
                              label: t['title'],
                              selected: t['completed'],
                              onChanged: (v) {},
                            ),
                          ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  DsAccordionSection(
                    title: 'Not Urgent & Important',
                    initiallyExpanded: false,
                    leading: const Icon(Icons.wb_cloudy_outlined, size: 22),
                    onAddPressed: () => _showNewTaskDialog(context),
                    children: [
                      ..._tasks
                          .skip(2)
                          .take(2)
                          .map(
                            (t) => DsTaskItem(
                              label: t['title'],
                              selected: t['completed'],
                              onChanged: (v) {},
                            ),
                          ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  DsAccordionSection(
                    title: 'Not Urgent & Not Important',
                    initiallyExpanded: false,
                    leading: const Icon(Icons.ac_unit_outlined, size: 22),
                    onAddPressed: () => _showNewTaskDialog(context),
                    children: [
                      if (_tasks.isEmpty)
                        const SizedBox.shrink()
                      else
                        ..._tasks
                            .skip(4)
                            .take(2)
                            .map(
                              (t) => DsTaskItem(
                                label: t['title'],
                                selected: t['completed'],
                                onChanged: (v) {},
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addTask(String title) {
    setState(() {
      _tasks.add({
        'title': title,
        'completed': false,
        'date': _selectedDate,
        'priority': _selectedPriority,
      });
    });

    // Clear selections after adding task
    setState(() {
      _selectedTask = null;
      _selectedDate = null;
      _selectedPriority = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Task added: $title'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showNewTaskDialog(BuildContext context) {
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New Task'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: 'Enter task name',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (textController.text.trim().isNotEmpty) {
                Navigator.pop(context);
                _addTask(textController.text.trim());
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
