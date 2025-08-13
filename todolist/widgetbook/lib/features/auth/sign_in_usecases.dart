import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:todolist/features/start_screen.dart';
import '../../wrappers/app_shell.dart';

@UseCase(name: 'Start Screen', type: StartScreen)
Widget startScreen(BuildContext context) =>
    const AppShell(child: StartScreen());
