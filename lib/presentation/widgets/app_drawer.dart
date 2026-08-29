import 'package:flutter/material.dart';

import '../../core/di/injector.dart';
import '../../core/theme/app_colors.dart';
import '../screens/quiz_screen.dart';
import '../screens/topic_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = Injector.instance.getTopics();
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.family_restroom_rounded, size: 52, color: AppColors.primary),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Menu de tópicos', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...topics.map(
                    (topic) => ListTile(
                      leading: Icon(topic.icon),
                      title: Text(topic.title),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => TopicScreen(topicIndex: topic.index)));
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.quiz_rounded),
                    title: const Text('Quiz final', style: TextStyle(fontWeight: FontWeight.w700)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
