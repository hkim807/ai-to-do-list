import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:todolist/screens/start_screen.dart';

@UseCase(name: 'Start Screen', type: StartScreen)
Widget startScreen(BuildContext context) {
  return const StartScreen();
}
