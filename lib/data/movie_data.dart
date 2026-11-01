import '../models/movie.dart';

/// Fuente local solicitada por el laboratorio: datos almacenados como listas
/// y mapas antes de convertirse en objetos de dominio.
final List<Map<String, dynamic>> movieMaps = [
  {
    'id': 1,
    'title': 'Eclipse Lima',
    'genre': 'Ciencia ficción',
    'year': 2026,
    'description':
        'Cuando un eclipse imposible cubre la costa, una astronauta peruana descubre una señal capaz de cambiar el destino de la ciudad.',
    'duration': '1 h 58 min',
    'category': 'Tendencias ahora',
    'imagePath': 'assets/images/eclipse_lima.png',
    'match': 98,
  },
  {
    'id': 2,
    'title': 'Costa de Sombras',
    'genre': 'Misterio',
    'year': 2025,
    'description':
        'Un detective sigue una pista entre la neblina de los acantilados y encuentra un secreto enterrado durante décadas.',
    'duration': '2 h 06 min',
    'category': 'Tendencias ahora',
    'imagePath': 'assets/images/costa_sombras.png',
    'match': 96,
  },
  {
    'id': 3,
    'title': 'Órbita Cero',
    'genre': 'Suspenso espacial',
    'year': 2026,
    'description':
        'Una tripulación de rescate tiene noventa minutos para recuperar una estación antes de que caiga sobre la Tierra.',
    'duration': '1 h 47 min',
    'category': 'Populares',
    'imagePath': 'assets/images/orbita_cero.png',
    'match': 95,
  },
  {
    'id': 4,
    'title': 'Último Andén',
    'genre': 'Drama',
    'year': 2024,
    'description':
        'Dos desconocidos coinciden cada madrugada en la última estación y aprenden a despedirse de sus antiguos sueños.',
    'duration': '1 h 42 min',
    'category': 'Películas recomendadas',
    'imagePath': 'assets/images/ultimo_anden.png',
    'match': 93,
  },
  {
    'id': 5,
    'title': 'Código Andino',
    'genre': 'Tecnología',
    'year': 2025,
    'description':
        'Una joven programadora descifra una red oculta en antiguos patrones andinos mientras una corporación intenta silenciarla.',
    'duration': '8 episodios',
    'category': 'Series para ti',
    'imagePath': 'assets/images/codigo_andino.png',
    'match': 97,
  },
  {
    'id': 6,
    'title': 'Marea Roja',
    'genre': 'Supervivencia',
    'year': 2026,
    'description':
        'Una navegante solitaria queda atrapada entre una tormenta anómala y una corriente que parece tener vida propia.',
    'duration': '1 h 51 min',
    'category': 'Nuevos lanzamientos',
    'imagePath': 'assets/images/marea_roja.png',
    'match': 91,
  },
  {
    'id': 7,
    'title': 'Neón 2099',
    'genre': 'Acción',
    'year': 2026,
    'description':
        'Una mensajera atraviesa una megaciudad controlada por algoritmos para entregar el último recuerdo humano sin modificar.',
    'duration': '10 episodios',
    'category': 'Series para ti',
    'imagePath': 'assets/images/neon_2099.png',
    'match': 94,
  },
  {
    'id': 8,
    'title': 'La Casa 17',
    'genre': 'Terror psicológico',
    'year': 2025,
    'description':
        'Cada noche aparece una habitación nueva en una casa que debería estar vacía. Ninguna puerta conduce al mismo lugar.',
    'duration': '1 h 39 min',
    'category': 'Populares',
    'imagePath': 'assets/images/casa_17.png',
    'match': 90,
  },
  {
    'id': 9,
    'title': 'Fuego Interior',
    'genre': 'Drama deportivo',
    'year': 2024,
    'description':
        'Una boxeadora regresa al ring para recuperar su voz, no un título, mientras entrena a la rival que podría vencerla.',
    'duration': '1 h 54 min',
    'category': 'Películas recomendadas',
    'imagePath': 'assets/images/fuego_interior.png',
    'match': 96,
  },
  {
    'id': 10,
    'title': 'Horizonte Perdido',
    'genre': 'Aventura',
    'year': 2025,
    'description':
        'Un grupo de exploradores encuentra un valle fuera de los mapas y debe elegir entre revelarlo o protegerlo.',
    'duration': '2 h 11 min',
    'category': 'Tendencias ahora',
    'imagePath': 'assets/images/horizonte_perdido.png',
    'match': 92,
  },
  {
    'id': 11,
    'title': 'Frecuencia Fantasma',
    'genre': 'Sobrenatural',
    'year': 2026,
    'description':
        'Una locutora nocturna recibe llamadas emitidas treinta años en el futuro y trata de impedir una tragedia.',
    'duration': '6 episodios',
    'category': 'Nuevos lanzamientos',
    'imagePath': 'assets/images/frecuencia_fantasma.png',
    'match': 95,
  },
  {
    'id': 12,
    'title': 'Días de Verano',
    'genre': 'Romance',
    'year': 2024,
    'description':
        'El último verano antes de la universidad transforma una amistad cuando dos jóvenes recorren la costa del Pacífico.',
    'duration': '1 h 45 min',
    'category': 'Películas recomendadas',
    'imagePath': 'assets/images/dias_verano.png',
    'match': 89,
  },
];

final List<Movie> movies = movieMaps.map(Movie.fromMap).toList(growable: false);

List<Movie> moviesByCategory(String category) =>
    movies.where((movie) => movie.category == category).toList();
