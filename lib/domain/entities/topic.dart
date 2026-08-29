import 'package:flutter/widgets.dart' show IconData;

class Topic {
  final int index;
  final String title;
  final String subtitle;
  final String body;
  final String imageLabel;
  final IconData icon;
  final List<String> bullets;

  const Topic({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.imageLabel,
    required this.icon,
    this.bullets = const [],
  });
}
