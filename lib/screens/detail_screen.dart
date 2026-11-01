import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../data/movie_data.dart';
import '../models/movie.dart';
import '../widgets/movie_section.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.movie,
    required this.initiallySaved,
    required this.onToggleSaved,
    super.key,
  });

  final Movie movie;
  final bool initiallySaved;
  final ValueChanged<Movie> onToggleSaved;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool _isSaved = widget.initiallySaved;

  void _play() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Reproducción no disponible: esta es una demostración académica.',
        ),
      ),
    );
  }

  void _toggleSaved() {
    widget.onToggleSaved(widget.movie);
    setState(() => _isSaved = !_isSaved);
  }

  void _openMovie(Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          movie: movie,
          initiallySaved: false,
          onToggleSaved: widget.onToggleSaved,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recommendations = movies
        .where((movie) => movie.id != widget.movie.id)
        .take(6)
        .toList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.sizeOf(context).height * .53,
            pinned: true,
            backgroundColor: AppColors.background,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'poster-${widget.movie.id}',
                    child: Image.asset(
                      widget.movie.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, AppColors.background],
                        stops: [.55, 1],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title.toUpperCase(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '${widget.movie.match}% para ti',
                        style: const TextStyle(
                          color: AppColors.success,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text('${widget.movie.year}'),
                      Text(widget.movie.duration),
                      const Icon(
                        Icons.hd_outlined,
                        size: 20,
                        color: AppColors.muted,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.movie.genre,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: _play,
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text('Reproducir'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.surfaceHigh,
                      ),
                      onPressed: _toggleSaved,
                      icon: Icon(_isSaved ? Icons.check : Icons.add),
                      label: Text(
                        _isSaved ? 'En Mi lista' : 'Agregar a Mi lista',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.movie.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: MovieSection(
              title: 'También te puede gustar',
              movies: recommendations,
              onMovieTap: _openMovie,
            ),
          ),
        ],
      ),
    );
  }
}
