import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppHeader({super.key, this.title = 'Unidades Neonatais'});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      );
}
