import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../data/movie_data.dart';
import '../models/movie.dart';
import '../widgets/featured_banner.dart';
import '../widgets/movie_section.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.savedIds,
    required this.onToggleSaved,
    required this.onOpenSearch,
    required this.onOpenProfile,
    super.key,
  });

  final Set<int> savedIds;
  final ValueChanged<Movie> onToggleSaved;
  final VoidCallback onOpenSearch;
  final VoidCallback onOpenProfile;

  void _play(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Reproducción no disponible: esta es una demostración académica.',
        ),
      ),
    );
  }

  void _openDetail(BuildContext context, Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          movie: movie,
          initiallySaved: savedIds.contains(movie.id),
          onToggleSaved: onToggleSaved,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final featured = movies.first;
    const sectionNames = [
      'Tendencias ahora',
      'Populares',
      'Películas recomendadas',
      'Series para ti',
      'Nuevos lanzamientos',
    ];
    return SafeArea(
      bottom: false,
      child: ListView(
        key: const PageStorageKey('home-scroll'),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 8, 8, 10),
            child: Row(
              children: [
                const Text(
                  'N',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 46,
                    height: 1,
                    color: AppColors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Para ti',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                IconButton(
                  onPressed: onOpenSearch,
                  icon: const Icon(Icons.search, size: 28),
                  tooltip: 'Buscar',
                ),
                IconButton(
                  onPressed: onOpenProfile,
                  icon: const CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.red,
                    child: Icon(Icons.person, size: 19),
                  ),
                  tooltip: 'Perfil',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 44,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              scrollDirection: Axis.horizontal,
              children: [
                _CategoryChip(label: 'Series', onTap: () {}),
                _CategoryChip(label: 'Películas', onTap: () {}),
                _CategoryChip(
                  label: 'Categorías',
                  icon: Icons.keyboard_arrow_down,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          FeaturedBanner(
            movie: featured,
            isSaved: savedIds.contains(featured.id),
            onPlay: () => _play(context),
            onToggleSaved: () => onToggleSaved(featured),
            onDetails: () => _openDetail(context, featured),
          ),
          const SizedBox(height: 30),
          for (final section in sectionNames)
            MovieSection(
              title: section,
              movies: moviesByCategory(section),
              onMovieTap: (movie) => _openDetail(context, movie),
            ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label, required this.onTap, this.icon});

  final String label;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 9),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.muted),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            Text(label),
            if (icon != null) ...[
              const SizedBox(width: 4),
              Icon(icon, size: 17),
            ],
          ],
        ),
      ),
    );
  }
}
