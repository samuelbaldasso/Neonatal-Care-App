class QuizResult {
  final int score;
  final int total;

  const QuizResult({required this.score, required this.total});

  bool get isPassing => total == 0 ? false : score / total >= 0.6;
}
