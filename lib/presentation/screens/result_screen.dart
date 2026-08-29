import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../domain/entities/quiz_result.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_footer.dart';
import '../widgets/app_header.dart';

class ResultScreen extends StatelessWidget {
  final QuizResult result;
  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const AppDrawer(),
        appBar: const AppHeader(title: 'Resultado'),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.emoji_events_rounded, size: 90, color: AppColors.gold),
                  const SizedBox(height: 20),
                  const Text('Quiz concluído!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.ink)),
                  const SizedBox(height: 8),
                  Text('Sua pontuação: ${result.score}/${result.total}', style: const TextStyle(fontSize: 21, color: AppColors.primary, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 14),
                  const Text(
                    'Continue buscando informações em fontes de saúde confiáveis e converse com sua equipe.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, height: 1.45),
                  ),
                  const SizedBox(height: 28),
                  FilledButton(
                    onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      child: Text('Voltar ao início'),
                    ),
                  ),
                ],
              ),
            ),
            const AppFooter(),
          ],
        ),
      );
}
