import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, required this.onTap, super.key});

  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Hero(
                    tag: 'poster-${movie.id}',
                    child: Image.asset(
                      movie.imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const ColoredBox(
                        color: AppColors.surfaceHigh,
                        child: Center(child: Icon(Icons.movie_outlined)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 2),
                child: Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                child: Text(
                  '${movie.match}% para ti',
                  style: const TextStyle(
                    color: AppColors.success,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
