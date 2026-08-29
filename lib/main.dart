import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'presentation/screens/splash_screen.dart';

void main() => runApp(const NeonatalApp());

class NeonatalApp extends StatelessWidget {
  const NeonatalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unidades Neonatais',
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}
