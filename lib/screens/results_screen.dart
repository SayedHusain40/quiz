import 'package:quiz/data/dummy_questions.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> userAnswers;

  final Function() onRestart;

  const ResultsScreen({
    super.key,
    required this.userAnswers,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summeryQuiz = [];
    int totalCorrectAnswers = 0;

    print('object ${dummyQuestions.length} and ${userAnswers.length}');

    for (int i = 0; i < dummyQuestions.length; i++) {
      final currentQuestion = dummyQuestions[i];
      final isUserAnswerCorrect = userAnswers[i] == currentQuestion.answers[0];
      if (isUserAnswerCorrect) {
        totalCorrectAnswers += 1;
      }
      summeryQuiz.add({
        'index': i + 1,
        'question': currentQuestion.question,
        'correct_answer': currentQuestion.answers[0],
        'user_answer': userAnswers[i],
        'isUserAnswerCorrect': isUserAnswerCorrect,
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),

        Text(
          'Quiz Results',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        Text(
          'You answered $totalCorrectAnswers out if ${summeryQuiz.length} correctly',
          style: const TextStyle(fontSize: 18, color: Colors.white),
          textAlign: TextAlign.center,
        ),

        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: summeryQuiz.length,
            itemBuilder: (context, index) {
              final currentQuestion = summeryQuiz[index];
              final isAnswerCorrect =
                  currentQuestion['isUserAnswerCorrect'] as bool;

              return Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: isAnswerCorrect ? Colors.green : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: isAnswerCorrect ? Colors.green[100] : Colors.red[100],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Q${currentQuestion['index'] as int}: ${currentQuestion['question'] as String}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      'Your answer: ${currentQuestion['user_answer'] as String}',
                      style: TextStyle(
                        color: isAnswerCorrect
                            ? Colors.green[800]
                            : Colors.red[800],
                      ),
                    ),
                    if (!isAnswerCorrect)
                      Text(
                        'Correct answer: ${currentQuestion['correct_answer'] as String}',
                        style: const TextStyle(color: Colors.black87),
                      ),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: onRestart,

          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          ),
          child: const Text('Restart Quiz', style: TextStyle(fontSize: 18)),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
