import 'package:flutter/foundation.dart';

import '../../domain/entities/quiz_question.dart';
import '../../domain/entities/quiz_result.dart';
import '../../domain/usecases/get_quiz_questions.dart';

class QuizController extends ChangeNotifier {
  QuizController(GetQuizQuestions getQuizQuestions)
      : questions = getQuizQuestions();

  final List<QuizQuestion> questions;

  int currentIndex = 0;
  int score = 0;
  int? selectedOption;
  bool answered = false;

  QuizQuestion get currentQuestion => questions[currentIndex];
  bool get isLastQuestion => currentIndex == questions.length - 1;

  void selectOption(int optionIndex) {
    if (answered) return;
    selectedOption = optionIndex;
    answered = true;
    if (currentQuestion.isCorrect(optionIndex)) score++;
    notifyListeners();
  }

  QuizResult? goToNext() {
    if (!answered) return null;
    if (isLastQuestion) {
      return QuizResult(score: score, total: questions.length);
    }
    currentIndex++;
    selectedOption = null;
    answered = false;
    notifyListeners();
    return null;
  }
}
