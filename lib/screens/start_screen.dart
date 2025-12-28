import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final Function() onStartQuiz;

  const StartScreen({super.key, required this.onStartQuiz});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/quiz-logo.png', width: 200),
        const SizedBox(height: 40),
        const Text(
          'Welcome to Flutter Quiz!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Challenge yourself and see how much you know about Flutter.\n'
          'Answer multiple choice questions and track your score!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 50),
        ElevatedButton.icon(
          onPressed: onStartQuiz,
          icon: const Icon(Icons.play_arrow, size: 28),
          label: const Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Text(
              'Start Quiz',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 6,
          ),
        ),
      ],
    );
  }
}
