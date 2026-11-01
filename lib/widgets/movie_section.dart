import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'movie_card.dart';

class MovieSection extends StatelessWidget {
  const MovieSection({
    required this.title,
    required this.movies,
    required this.onMovieTap,
    super.key,
  });

  final String title;
  final List<Movie> movies;
  final ValueChanged<Movie> onMovieTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(fontSize: 19),
                  ),
                ),
                const Icon(Icons.chevron_right, size: 22),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 238,
            child: ListView.separated(
              key: PageStorageKey('section-$title'),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) => MovieCard(
                movie: movies[index],
                onTap: () => onMovieTap(movies[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
