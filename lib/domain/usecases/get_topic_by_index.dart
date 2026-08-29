import '../entities/topic.dart';
import '../repositories/topics_repository.dart';

class GetTopicByIndex {
  final TopicsRepository repository;
  const GetTopicByIndex(this.repository);

  Topic call(int index) => repository.getTopicByIndex(index);
}
