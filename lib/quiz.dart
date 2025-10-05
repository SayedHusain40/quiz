import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/quiz_questions.dart';
import 'package:quiz/screens/questions_screen.dart';
import 'package:quiz/screens/results_screen.dart';
import 'package:quiz/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start_screen';

  final List<QuizQuestions> questionsList = questions;
  List<String> userAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void restartScreen() {
    setState(() {
      userAnswers = [];
      activeScreen = 'start_screen';
    });
  }

  void addAnswer(String answer) {
    userAnswers.add(answer);

    if (userAnswers.length == questionsList.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget currentScreen;

    if (activeScreen == 'start_screen') {
      currentScreen = StartScreen(onStartQuiz: switchScreen);
    } else if (activeScreen == 'questions_screen') {
      currentScreen = QuestionsScreen(
        questions: questionsList,
        onSelectAnswer: addAnswer,
      );
    } else if (activeScreen == 'results_screen') {
      currentScreen = ResultsScreen(
        userAnswers: userAnswers,
        onRestartQuiz: restartScreen,
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(child: currentScreen),
      ),
    );
  }
}
