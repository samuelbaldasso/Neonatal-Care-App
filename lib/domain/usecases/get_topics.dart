import '../entities/topic.dart';
import '../repositories/topics_repository.dart';

class GetTopics {
  final TopicsRepository repository;
  const GetTopics(this.repository);

  List<Topic> call() => repository.getTopics();
}
