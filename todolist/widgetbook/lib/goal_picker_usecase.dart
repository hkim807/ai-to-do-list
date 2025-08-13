import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/screens/goal_picker_screen.dart';

@widgetbook.UseCase(name: 'Goal Picker Screen', type: GoalPickerScreen)
Widget goalPicker(BuildContext context) {
  return const GoalPickerScreen();
}


