import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../models/movie.dart';

class FeaturedBanner extends StatelessWidget {
  const FeaturedBanner({
    required this.movie,
    required this.isSaved,
    required this.onPlay,
    required this.onToggleSaved,
    required this.onDetails,
    super.key,
  });

  final Movie movie;
  final bool isSaved;
  final VoidCallback onPlay;
  final VoidCallback onToggleSaved;
  final VoidCallback onDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AspectRatio(
        aspectRatio: .78,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(movie.imagePath, fit: BoxFit.cover),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0x22000000),
                      Color(0xF7090909),
                    ],
                    stops: [0, .48, 1],
                  ),
                ),
              ),
              Positioned(
                left: 22,
                right: 22,
                bottom: 20,
                child: Column(
                  children: [
                    Text(
                      movie.title.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ciencia ficción  •  Misterio  •  Drama',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: onPlay,
                            icon: const Icon(Icons.play_arrow_rounded),
                            label: const Text('Reproducir'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.surfaceHigh.withValues(
                              alpha: .9,
                            ),
                          ),
                          onPressed: onToggleSaved,
                          tooltip: isSaved
                              ? 'Quitar de Mi lista'
                              : 'Agregar a Mi lista',
                          icon: Icon(isSaved ? Icons.check : Icons.add),
                        ),
                        IconButton(
                          onPressed: onDetails,
                          tooltip: 'Información',
                          icon: const Icon(Icons.info_outline),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
