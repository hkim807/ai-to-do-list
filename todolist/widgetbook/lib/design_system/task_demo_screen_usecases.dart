import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:todolist/features/task_demo_screen.dart';

@UseCase(name: 'Task Demo Screen', type: TaskDemoScreen)
Widget taskDemoScreen(BuildContext context) {
  return const TaskDemoScreen();
}
