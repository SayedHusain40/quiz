import 'package:quiz/data/dummy_questions.dart';
import 'package:quiz/models/quiz_questions.dart';
import 'package:quiz/screens/questions_screen.dart';
import 'package:quiz/screens/results_screen.dart';
import 'package:quiz/screens/start_screen.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String currentScreen = 'start_screen';
  List<String> userAnswers = [];

  void switchToQuestionsScreen() {
    setState(() {
      currentScreen = 'questions_screen';
    });
  }

  void onRestart() {
    setState(() {
      userAnswers = [];
      currentScreen = 'start_screen';
    });
  }

  void onClickNext(String answer) {
    userAnswers.add(answer);
  }

  void onFinish() {
    setState(() {
      currentScreen = 'results_screen';
    });
  }

  void updateUserAnswer(String answer, int index) {
    userAnswers[index] = answer;
  }

  late final List<QuizQuestions> shuffledQuestions;

  @override
  void initState() {
    super.initState();
    shuffledQuestions = dummyQuestions.map((q) {
      return QuizQuestions(question: q.question, answers: q.shuffleAnswers());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(onStartQuiz: switchToQuestionsScreen);

    if (currentScreen == 'questions_screen') {
      activeScreen = QuestionsScreen(
        questions: shuffledQuestions,
        onClickNext: onClickNext,
        onUpdateAnswer: updateUserAnswer,
        onFinish: onFinish,
      );
    }
    if (currentScreen == 'results_screen') {
      activeScreen = ResultsScreen(
        userAnswers: userAnswers,
        onRestart: onRestart,
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: MediaQuery.of(context).padding.top,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: activeScreen,
      ),
    );
  }
}
