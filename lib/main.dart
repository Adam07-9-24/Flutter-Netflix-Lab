import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'data/movie_data.dart';
import 'models/movie.dart';
import 'screens/home_screen.dart';
import 'screens/my_list_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';
import 'widgets/bottom_nav.dart';

void main() {
  runApp(const NetflixLabApp());
}

class NetflixLabApp extends StatelessWidget {
  const NetflixLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Lab',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;
  final Set<int> _savedIds = <int>{};

  void _toggleSaved(Movie movie) {
    setState(() {
      if (!_savedIds.add(movie.id)) {
        _savedIds.remove(movie.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final savedMovies = movies
        .where((movie) => _savedIds.contains(movie.id))
        .toList();
    final screens = [
      HomeScreen(
        savedIds: _savedIds,
        onToggleSaved: _toggleSaved,
        onOpenSearch: () => setState(() => _currentIndex = 1),
        onOpenProfile: () => setState(() => _currentIndex = 3),
      ),
      SearchScreen(savedIds: _savedIds, onToggleSaved: _toggleSaved),
      MyListScreen(savedMovies: savedMovies, onToggleSaved: _toggleSaved),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
