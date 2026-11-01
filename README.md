# Netflix Lab — Laboratorio Flutter

Aplicación móvil académica inspirada en la experiencia visual de una plataforma de streaming. El catálogo, los pósteres y los nombres son ficticios. No incluye autenticación, backend ni reproducción real.

## Objetivo

Demostrar el uso práctico de widgets, estructuras de datos, navegación, estado compartido, recursos locales y temas globales en Flutter mediante una interfaz oscura, moderna y adaptable a Android.

## Tecnologías utilizadas

- Flutter 3.32.6 y Dart 3.8.1.
- Material Design 3.
- Datos locales en Dart, sin backend.
- Imágenes PNG originales guardadas como assets.
- Fuentes locales de Google Fonts bajo la licencia SIL Open Font License.

## Requisitos del laboratorio

- **ListView:** la pantalla Inicio usa un `ListView` vertical y cada sección un `ListView` horizontal. Buscar, Mi lista y Perfil también usan listas verticales.
- **ListTile:** las opciones Mi cuenta, Notificaciones, Configuración y Ayuda están implementadas con `ListTile` en Perfil.
- **Row:** encabezados, metadatos, botones, resultados y navegación organizan elementos horizontalmente.
- **Column:** banners, detalles, estados vacíos y tarjetas agrupan contenido verticalmente.
- **List y Map:** `lib/data/movie_data.dart` declara `List<Map<String, dynamic>>` con id, título, género, año, descripción, duración, categoría, coincidencia y ruta local. Cada mapa se transforma en un `Movie`.
- **Rutas:** `Navigator` y `MaterialPageRoute` abren detalles y permiten regresar con la navegación estándar. La barra inferior comunica Inicio, Buscar, Mi lista y Perfil.
- **ThemeData:** `lib/core/theme/app_theme.dart` centraliza el tema oscuro, colores, textos, tarjetas, campos y mensajes.
- **Cards:** `MovieCard` combina `Card`, `ClipRRect` e `Image.asset` y se reutiliza en las secciones.

## Tipografías

- **Montserrat:** encabezados y nombres de sección.
- **Poppins:** textos, botones, etiquetas y descripciones.
- **Bebas Neue:** títulos principales y banner destacado.

Los archivos están en `assets/fonts/`, se declaran en `pubspec.yaml` y se aplican desde el tema y los widgets. Sus licencias OFL se incluyen junto a las fuentes.

## Imágenes locales

Los 12 pósteres ficticios se encuentran en `assets/images/`. La aplicación usa únicamente `Image.asset()`; no descarga contenido ni utiliza `Image.network`. Los archivos fueron creados específicamente para este laboratorio y no representan títulos ni actores reales.

## Estructura principal

```text
lib/
├── main.dart
├── core/theme/app_theme.dart
├── data/movie_data.dart
├── models/movie.dart
├── screens/
│   ├── home_screen.dart
│   ├── search_screen.dart
│   ├── detail_screen.dart
│   ├── my_list_screen.dart
│   └── profile_screen.dart
└── widgets/
    ├── movie_card.dart
    ├── movie_section.dart
    ├── featured_banner.dart
    └── bottom_nav.dart
assets/
├── images/
└── fonts/
```

## Funcionalidades

- Catálogo local con cinco secciones.
- Banner destacado con acciones.
- Búsqueda en tiempo real por título o género.
- Pantalla de detalles con metadatos y recomendaciones.
- Agregar o quitar títulos de Mi lista con estado sincronizado durante la sesión.
- Estado vacío para búsquedas y lista guardada.
- Perfil con opciones interactivas.
- Mensaje informativo al intentar reproducir.
- Barra inferior con cuatro destinos y conservación del estado visual.

## Instalación y ejecución

1. Verifica Flutter con `flutter doctor`.
2. Desde la raíz del proyecto ejecuta `flutter pub get`.
3. Inicia un emulador Android o conecta un dispositivo.
4. Ejecuta `flutter run`.

## Validación

```powershell
flutter pub get
flutter analyze
flutter test
```

La reproducción es intencionalmente simulada mediante un `SnackBar`, porque el objetivo es demostrar interfaz y navegación sin servicios externos.
