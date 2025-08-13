import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/features/auth_screen.dart';
import '../../wrappers/app_shell.dart';

@widgetbook.UseCase(name: 'Default', type: AuthScreen)
Widget authScreenDefault(BuildContext context) =>
    const AppShell(child: AuthScreen());
