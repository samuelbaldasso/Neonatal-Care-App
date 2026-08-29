import '../../domain/entities/topic.dart';
import '../../domain/repositories/topics_repository.dart';
import '../datasources/topics_local_datasource.dart';

class TopicsRepositoryImpl implements TopicsRepository {
  final TopicsLocalDataSource dataSource;
  const TopicsRepositoryImpl(this.dataSource);

  @override
  List<Topic> getTopics() => dataSource.getTopics();

  @override
  Topic getTopicByIndex(int index) =>
      dataSource.getTopics().firstWhere((topic) => topic.index == index);
}
