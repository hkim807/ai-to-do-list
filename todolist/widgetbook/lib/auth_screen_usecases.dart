import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:todolist/screens/auth_screen.dart';

@UseCase(name: 'Auth Screen', type: AuthScreen)
Widget authScreen(BuildContext context) {
  return const AuthScreen();
}
