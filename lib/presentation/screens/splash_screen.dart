import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFE9F8F7), Colors.white]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(32), boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 20)]),
                child: const Icon(Icons.family_restroom_rounded, size: 60, color: AppColors.primary),
              ),
              const SizedBox(height: 24),
              const Text('Unidades Neonatais', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.ink)),
              const SizedBox(height: 8),
              const Text('Cuidando do início da vida', style: TextStyle(fontSize: 16, color: AppColors.primary, fontWeight: FontWeight.w600)),
              const SizedBox(height: 48),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      );
}
