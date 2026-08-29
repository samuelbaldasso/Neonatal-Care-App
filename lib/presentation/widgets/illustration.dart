import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class Illustration extends StatelessWidget {
  final String label;
  final IconData icon;
  const Illustration({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) => Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(colors: [Color(0xFFE3F7F5), Color(0xFFFFEEF1)]),
          border: Border.all(color: AppColors.border),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 22,
              top: 18,
              child: Icon(Icons.favorite_rounded, color: const Color(0xFFE98C9E).withValues(alpha: .45), size: 48),
            ),
            Container(
              width: 118,
              height: 118,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .9),
                shape: BoxShape.circle,
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 18)],
              ),
              child: Icon(icon, size: 62, color: AppColors.primary),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Text(label, style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.ink)),
              ),
            ),
          ],
        ),
      );
}

class IllustrationQuiz extends StatelessWidget {
  final int index;
  final int total;
  const IllustrationQuiz({super.key, required this.index, required this.total});

  @override
  Widget build(BuildContext context) => Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(colors: [Color(0xFFE7F5FF), Color(0xFFFFEEF5)]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.quiz_rounded, size: 54, color: AppColors.primary),
              const SizedBox(height: 6),
              Text('Teste seus conhecimentos • $index/$total', style: const TextStyle(fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      );
}
