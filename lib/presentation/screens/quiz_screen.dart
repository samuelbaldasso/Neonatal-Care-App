import 'package:flutter/material.dart';

import '../../core/di/injector.dart';
import '../../core/theme/app_colors.dart';
import '../controllers/quiz_controller.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_footer.dart';
import '../widgets/app_header.dart';
import '../widgets/illustration.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final QuizController controller = QuizController(Injector.instance.getQuizQuestions);

  void _onNext() {
    final result = controller.goToNext();
    if (result != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ResultScreen(result: result)));
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = controller.currentQuestion;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const AppHeader(title: 'Quiz final'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          IllustrationQuiz(index: controller.currentIndex + 1, total: controller.questions.length),
          const SizedBox(height: 20),
          Text('Pergunta ${controller.currentIndex + 1} de ${controller.questions.length}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(question.question, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: AppColors.ink)),
          const SizedBox(height: 16),
          ...List.generate(
            question.options.length,
            (i) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: OutlinedButton(
                onPressed: controller.answered ? null : () => setState(() => controller.selectOption(i)),
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(16), alignment: Alignment.centerLeft),
                child: Text('${String.fromCharCode(65 + i)}) ${question.options[i]}'),
              ),
            ),
          ),
          if (controller.answered)
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: question.isCorrect(controller.selectedOption!) ? AppColors.successBg : AppColors.errorBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                question.isCorrect(controller.selectedOption!)
                    ? 'Correto! Ótimo trabalho.'
                    : 'Quase! A resposta correta é: ${String.fromCharCode(65 + question.correctOptionIndex)}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: controller.answered ? _onNext : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(controller.isLastQuestion ? 'Ver resultado' : 'Próxima pergunta'),
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}
