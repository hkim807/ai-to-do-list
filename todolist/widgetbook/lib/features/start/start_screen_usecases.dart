import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:todolist/features/auth_screen.dart';
import '../../wrappers/app_shell.dart';

@UseCase(name: 'Start Screen', type: AuthScreen)
Widget startScreen(BuildContext context) => const AppShell(child: AuthScreen());
