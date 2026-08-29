import '../entities/quiz_question.dart';
import '../repositories/quiz_repository.dart';

class GetQuizQuestions {
  final QuizRepository repository;
  const GetQuizQuestions(this.repository);

  List<QuizQuestion> call() => repository.getQuestions();
}
