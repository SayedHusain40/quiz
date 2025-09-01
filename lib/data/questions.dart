import 'package:quiz/models/quiz_questions.dart';

final List<QuizQuestions> questions = [
  QuizQuestions(
    question: 'What is Flutter primarily used for?',
    answers: [
      'Building cross-platform mobile apps', // correct (index 0)
      'Creating operating systems',
      'Designing databases',
      'Managing servers',
    ],
  ),
  QuizQuestions(
    question: 'Which language is used to write Flutter apps?',
    answers: [
      'Dart', // correct (index 0)
      'Kotlin',
      'Swift',
      'JavaScript',
    ],
  ),
  QuizQuestions(
    question: 'Which widget is used to create layouts in Flutter?',
    answers: [
      'Container', // correct (index 0)
      'Intent',
      'Activity',
      'Storyboard',
    ],
  ),
  QuizQuestions(
    question: 'Which command is used to create a new Flutter project?',
    answers: [
      'flutter create project_name', // correct (index 0)
      'flutter run',
      'flutter init',
      'flutter start',
    ],
  ),
  QuizQuestions(
    question:
        'What widget is used for infinite scrolling lists in Flutter?............................................',
    answers: [
      'ListView', // correct (index 0)
      'RecyclerView',
      'ScrollPane',
      'TableView',
    ],
  ),
];
