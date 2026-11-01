import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../data/movie_data.dart';
import '../models/movie.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    required this.savedIds,
    required this.onToggleSaved,
    super.key,
  });

  final Set<int> savedIds;
  final ValueChanged<Movie> onToggleSaved;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openDetail(Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          movie: movie,
          initiallySaved: widget.savedIds.contains(movie.id),
          onToggleSaved: widget.onToggleSaved,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final normalized = _query.trim().toLowerCase();
    final results = normalized.isEmpty
        ? movies
        : movies
              .where(
                (movie) =>
                    movie.title.toLowerCase().contains(normalized) ||
                    movie.genre.toLowerCase().contains(normalized),
              )
              .toList();

    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
            child: Text(
              'Buscar',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextField(
              controller: _controller,
              autofocus: false,
              onChanged: (value) => setState(() => _query = value),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Títulos, géneros y más',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                        icon: const Icon(Icons.close),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              normalized.isEmpty
                  ? 'Explora el catálogo'
                  : '${results.length} resultados',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: results.isEmpty
                ? const _EmptySearch()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(18, 4, 18, 24),
                    itemCount: results.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final movie = results[index];
                      return Card(
                        child: InkWell(
                          onTap: () => _openDetail(movie),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  movie.imagePath,
                                  width: 94,
                                  height: 128,
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
                                    const SizedBox(height: 5),
                                    Text(
                                      '${movie.year}  •  ${movie.genre}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(fontSize: 12),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      '${movie.match}% para ti',
                                      style: const TextStyle(
                                        color: AppColors.success,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.play_circle_outline,
                                  size: 34,
                                ),
                              ),
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

class _EmptySearch extends StatelessWidget {
  const _EmptySearch();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.search_off_rounded,
              size: 68,
              color: AppColors.muted,
            ),
            const SizedBox(height: 16),
            Text(
              'No encontramos coincidencias',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Prueba con otro título o género.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
