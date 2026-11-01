class Movie {
  const Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.year,
    required this.description,
    required this.duration,
    required this.category,
    required this.imagePath,
    required this.match,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      genre: map['genre'] as String,
      year: map['year'] as int,
      description: map['description'] as String,
      duration: map['duration'] as String,
      category: map['category'] as String,
      imagePath: map['imagePath'] as String,
      match: map['match'] as int,
    );
  }

  final int id;
  final String title;
  final String genre;
  final int year;
  final String description;
  final String duration;
  final String category;
  final String imagePath;
  final int match;
}
