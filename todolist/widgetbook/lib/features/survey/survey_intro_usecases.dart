import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/features/survey/survey_intro_page.dart';
import '../../wrappers/app_shell.dart';

@widgetbook.UseCase(name: 'Default', type: SurveyIntroScreen)
Widget surveyIntroDefault(BuildContext context) =>
    const AppShell(child: SurveyIntroScreen());
