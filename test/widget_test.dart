import 'package:flutter_test/flutter_test.dart';
import 'package:netflix_lab/main.dart';

void main() {
  testWidgets('muestra la pantalla de inicio y la navegación principal', (
    tester,
  ) async {
    await tester.pumpWidget(const NetflixLabApp());
    await tester.pumpAndSettle();

    expect(find.text('Para ti'), findsOneWidget);
    expect(find.text('Inicio'), findsOneWidget);
    expect(find.text('Buscar'), findsOneWidget);
    expect(find.text('Mi lista'), findsOneWidget);
    expect(find.text('Perfil'), findsOneWidget);
  });
}
