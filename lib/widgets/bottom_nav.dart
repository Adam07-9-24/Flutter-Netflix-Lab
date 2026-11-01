import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({required this.currentIndex, required this.onTap, super.key});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: const Color(0xF5171717),
      indicatorColor: AppColors.red.withValues(alpha: .18),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Inicio',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          selectedIcon: Icon(Icons.manage_search),
          label: 'Buscar',
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmark_border),
          selectedIcon: Icon(Icons.bookmark),
          label: 'Mi lista',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
