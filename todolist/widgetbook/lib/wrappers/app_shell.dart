import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/design_system/theme/app_theme.dart';
import 'package:todolist/features/survey/survey_controller.dart';
import 'fakes.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Provider<SurveyController>(
      create: (_) => makeFakeSurveyController(),
      child: Theme(data: buildLightTheme(), child: child),
    );
  }
}
