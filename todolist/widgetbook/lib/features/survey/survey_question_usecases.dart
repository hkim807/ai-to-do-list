import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/features/survey/survey_question_screen.dart';
import 'package:todolist/features/survey/survey_controller.dart';
import '../../wrappers/fakes.dart';
import '../../wrappers/app_shell.dart';

@widgetbook.UseCase(name: 'Survey Question - Area', type: SurveyQuestionScreen)
Widget surveyQuestionArea(BuildContext context) {
  final controller = makeFakeSurveyController() as SurveyController;
  return AppShell(
    child: SurveyQuestionScreen(controller: controller, index: 0),
  );
}

@widgetbook.UseCase(name: 'Survey Question - Time', type: SurveyQuestionScreen)
Widget surveyQuestionTime(BuildContext context) {
  final controller = makeFakeSurveyController() as SurveyController;
  return AppShell(
    child: SurveyQuestionScreen(controller: controller, index: 1),
  );
}

@widgetbook.UseCase(
  name: 'Survey Question - Deadline',
  type: SurveyQuestionScreen,
)
Widget surveyQuestionDeadline(BuildContext context) {
  final controller = makeFakeSurveyController() as SurveyController;
  return AppShell(
    child: SurveyQuestionScreen(controller: controller, index: 2),
  );
}
