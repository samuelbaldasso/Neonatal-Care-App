import 'package:flutter/material.dart';

import '../../core/di/injector.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_footer.dart';
import '../widgets/app_header.dart';
import '../widgets/illustration.dart';

class TopicScreen extends StatelessWidget {
  final int topicIndex;
  const TopicScreen({super.key, required this.topicIndex});

  @override
  Widget build(BuildContext context) {
    final topic = Injector.instance.getTopicByIndex(topicIndex);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppHeader(title: '${topic.index}. ${topic.title}'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Illustration(label: topic.imageLabel, icon: topic.icon),
          const SizedBox(height: 20),
          Text(topic.subtitle, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800, fontSize: 16)),
          const SizedBox(height: 10),
          Text(topic.body, style: const TextStyle(fontSize: 16, height: 1.55, color: AppColors.inkSoft)),
          if (topic.bullets.isNotEmpty) ...[
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pontos principais', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
                  const SizedBox(height: 10),
                  ...topic.bullets.map(
                    (b) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Icon(Icons.check_circle_rounded, size: 18, color: AppColors.primary),
                          ),
                          const SizedBox(width: 9),
                          Expanded(child: Text(b, style: const TextStyle(height: 1.4))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 12),
          const AppFooter(),
        ],
      ),
    );
  }
}
