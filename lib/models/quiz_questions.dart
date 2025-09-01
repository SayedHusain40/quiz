class QuizQuestions {
  final String question;
  final List<String> answers;

  const QuizQuestions({required this.question, required this.answers});

  List<String> shuffleAnswers() {
    final scuffledAnswer = answers.toList();

    scuffledAnswer.shuffle();

    return scuffledAnswer;
  }
}
