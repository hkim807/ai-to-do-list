// features/survey/survey_controller.dart
import 'models.dart';

class SurveyController {
  final List<SurveyQuestion> questions = [
    SurveyQuestion(
      id: 'area',
      title: 'Which area matters most to you right now?',
      options: [
        'Career/Study',
        'Health & Fitness',
        'Relationships',
        'Personal Growth',
        'Other (write in)',
      ],
    ),
    SurveyQuestion(
      id: 'time',
      title: 'When do you usually get the most done?',
      options: ['Morning', 'Afternoon', 'Evening', 'Late Night'],
    ),
    SurveyQuestion(
      id: 'deadline',
      title: 'How do you usually handle deadlines?',
      options: ['Ahead of time', 'Close to the deadline', 'It depends'],
    ),
    // …add the rest from your flow
  ];

  final Map<String, dynamic> answers = {};

  bool get isComplete => answers.length == questions.length;
}
