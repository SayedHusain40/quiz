class QuizQuestions {
  final String question;
  final List<String> answers;

  QuizQuestions({required this.question, required this.answers});

  List<String> shuffleAnswers() {
    final shuffledAnswers = answers.toList();
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
