import '../entities/topic.dart';

abstract class TopicsRepository {
  List<Topic> getTopics();
  Topic getTopicByIndex(int index);
}
