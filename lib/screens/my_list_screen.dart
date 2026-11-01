import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../models/movie.dart';
import 'detail_screen.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({
    required this.savedMovies,
    required this.onToggleSaved,
    super.key,
  });

  final List<Movie> savedMovies;
  final ValueChanged<Movie> onToggleSaved;

  void _openDetail(BuildContext context, Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          movie: movie,
          initiallySaved: true,
          onToggleSaved: onToggleSaved,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
            child: Text(
              'Mi lista',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Expanded(
            child: savedMovies.isEmpty
                ? const _EmptyList()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(18, 4, 18, 28),
                    itemCount: savedMovies.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final movie = savedMovies[index];
                      return Card(
                        child: InkWell(
                          onTap: () => _openDetail(context, movie),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  movie.imagePath,
                                  width: 106,
                                  height: 148,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      movie.genre,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${movie.year}  •  ${movie.duration}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () => onToggleSaved(movie),
                                tooltip: 'Quitar de Mi lista',
                                icon: const Icon(Icons.delete_outline),
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _EmptyList extends StatelessWidget {
  const _EmptyList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceHigh,
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Icon(
                Icons.bookmark_add_outlined,
                size: 62,
                color: AppColors.red,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'Tu lista está esperando',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 9),
            const Text(
              'Agrega películas y series para encontrarlas rápidamente aquí.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
