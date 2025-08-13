import 'package:todolist/features/survey/survey_controller.dart';
import 'package:todolist/features/survey/models.dart' show SurveyQuestion;

// If your real SurveyController differs, create a simple fake that matches
class FakeSurveyController extends SurveyController {
  @override
  final List<SurveyQuestion> questions = const [
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
  ];

  @override
  final Map<String, dynamic> answers = {};
}

SurveyController makeFakeSurveyController() => FakeSurveyController();
