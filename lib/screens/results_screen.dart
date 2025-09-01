import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.userAnswers,
    required this.onRestartQuiz,
  });
  final List<String> userAnswers;
  final Function() onRestartQuiz;

  List<Map<String, Object>> get summeryData {
    List<Map<String, Object>> summeryQuizData = [];

    for (int i = 0; i < questions.length; i++) {
      summeryQuizData.add({
        'index': i + 1,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': userAnswers[i],
        'isUserAnswerCorrect': questions[i].answers[0] == userAnswers[i]
            ? true
            : false,
      });
    }
    return summeryQuizData;
  }

  @override
  Widget build(BuildContext context) {
    final int totalQuestions = questions.length;

    final int totalCorrectAnswers = summeryData.where((data) {
      return data['isUserAnswerCorrect'] == true;
    }).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You got $totalCorrectAnswers of $totalQuestions of correct answers!',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 30),

        SizedBox(
          height: 300,
          child: SingleChildScrollView(
            child: Column(
              children: summeryData.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      minRadius: 15,
                      backgroundColor: data['isUserAnswerCorrect'] == true
                          ? Colors.greenAccent
                          : Colors.pink,
                      child: Text('${data['index'] as int}'),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            data['question'] as String,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: TextStyle(color: Colors.redAccent),
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                );
              }).toList(),
            ),
          ),
        ),

        SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: onRestartQuiz,
          icon: Icon(Icons.restart_alt),
          label: Text('Restart'),
        ),
      ],
    );
  }
}
