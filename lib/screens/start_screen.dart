import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onStartQuiz});

  final Function() onStartQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(161, 255, 255, 255),
        ),
        SizedBox(height: 50),
        Text(
          'Ready to test your knowledge?',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 50),
        TextButton.icon(
          onPressed: onStartQuiz,
          icon: Icon(Icons.arrow_right, color: Colors.white, size: 25),
          label: Text(
            'Start Quiz',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ],
    );
  }
}
