import '../../data/datasources/quiz_local_datasource.dart';
import '../../data/datasources/topics_local_datasource.dart';
import '../../data/repositories/quiz_repository_impl.dart';
import '../../data/repositories/topics_repository_impl.dart';
import '../../domain/usecases/get_quiz_questions.dart';
import '../../domain/usecases/get_topic_by_index.dart';
import '../../domain/usecases/get_topics.dart';

/// Simple manual dependency injector (no external DI package needed for
/// this app's size). Wires data sources -> repositories -> use cases.
class Injector {
  Injector._();
  static final Injector instance = Injector._();

  late final GetTopics getTopics =
      const GetTopics(TopicsRepositoryImpl(TopicsLocalDataSource()));

  late final GetTopicByIndex getTopicByIndex =
      const GetTopicByIndex(TopicsRepositoryImpl(TopicsLocalDataSource()));

  late final GetQuizQuestions getQuizQuestions =
      const GetQuizQuestions(QuizRepositoryImpl(QuizLocalDataSource()));
}
