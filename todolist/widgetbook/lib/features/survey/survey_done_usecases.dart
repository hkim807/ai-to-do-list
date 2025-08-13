import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/features/survey/survey_done_page.dart';
import '../../wrappers/app_shell.dart';

@widgetbook.UseCase(name: 'Default', type: SurveyDoneScreen)
Widget surveyDoneDefault(BuildContext context) =>
    const AppShell(child: SurveyDoneScreen());
