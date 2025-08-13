import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/features/auth/sign_up_screen.dart';
import '../../wrappers/app_shell.dart';

@widgetbook.UseCase(name: 'Default', type: SignUpScreen)
Widget signUpDefault(BuildContext context) {
  return const AppShell(child: SignUpScreen());
}

@widgetbook.UseCase(name: 'With Validation Errors', type: SignUpScreen)
Widget signUpWithErrors(BuildContext context) {
  return const AppShell(child: SignUpScreen());
}

@widgetbook.UseCase(name: 'Submitting State', type: SignUpScreen)
Widget signUpSubmitting(BuildContext context) {
  return const AppShell(child: SignUpScreen());
}
