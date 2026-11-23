import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/app/app.dart';

void main() {
  setUpAll(() {
    // В тестах нет сети: не скачиваем Manrope, используем шрифт по умолчанию.
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('starts on Home and switches to Plan tab', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: HealthApp()));
    await tester.pumpAndSettle();

    expect(find.text('Главная'), findsWidgets);
    expect(find.text('Экран в разработке'), findsOneWidget);

    await tester.tap(find.bySemanticsLabel('План'));
    await tester.pumpAndSettle();

    expect(find.text('План осмотров'), findsWidgets);
  });
}
