import 'package:flutter/material.dart';

import '../../core/di/injector.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_footer.dart';
import '../widgets/app_header.dart';
import 'quiz_screen.dart';
import 'topic_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = Injector.instance.getTopics();
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const AppHeader(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryLight]),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.favorite_rounded, color: Colors.white, size: 36),
                SizedBox(height: 12),
                Text('Cuidando do início da vida', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800)),
                SizedBox(height: 8),
                Text('Um guia visual para famílias sobre cuidado neonatal, humanização e participação dos pais.', style: TextStyle(color: Colors.white, fontSize: 15, height: 1.4)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text('Explore os tópicos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.ink)),
          const SizedBox(height: 12),
          ...topics.map(
            (topic) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFFE3F7F5),
                  child: Icon(topic.icon, color: AppColors.primary),
                ),
                title: Text('${topic.index}. ${topic.title}', style: const TextStyle(fontWeight: FontWeight.w700)),
                subtitle: Text(topic.subtitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TopicScreen(topicIndex: topic.index))),
              ),
            ),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen())),
            icon: const Icon(Icons.quiz_rounded),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text('Fazer o quiz final', style: TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}
