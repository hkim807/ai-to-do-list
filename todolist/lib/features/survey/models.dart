// lib/features/survey/survey_controller.dart
class SurveyQuestion {
  final String id;
  final String title;
  final List<String> options;
  final bool multi; // set true if you want multi-select later

  const SurveyQuestion({
    required this.id,
    required this.title,
    required this.options,
    this.multi = false,
  });
}

class SurveyArgs {
  final SurveyController controller;
  final int index;
  const SurveyArgs({required this.controller, required this.index});
}
