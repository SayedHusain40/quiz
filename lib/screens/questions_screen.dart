import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';

import 'package:quiz/models/quiz_questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.questions,
    required this.onSelectAnswer,
  });

  final List<QuizQuestions> questions;

  final Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int indexQuestion = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[indexQuestion];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentQuestion.question,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 20),

        ...currentQuestion.shuffleAnswers().map((answer) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onSelectAnswer(answer);
                    setState(() {
                      indexQuestion++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: Text(answer),
                ),
              ),
              SizedBox(height: 10),
            ],
          );
        }),
      ],
    );
  }
}
