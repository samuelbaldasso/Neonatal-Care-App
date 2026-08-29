import '../../domain/entities/quiz_question.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/quiz_local_datasource.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizLocalDataSource dataSource;
  const QuizRepositoryImpl(this.dataSource);

  @override
  List<QuizQuestion> getQuestions() => dataSource.getQuestions();
}
