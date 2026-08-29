import '../entities/quiz_question.dart';

abstract class QuizRepository {
  List<QuizQuestion> getQuestions();
}
