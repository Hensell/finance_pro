import 'package:finance_pro/app/app.dart';
import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App opens the learning lab without a forced splash', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      FinanceProApp(
        dependencies: AppDependencies.create(),
        useGoogleFonts: false,
      ),
    );

    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(find.text('Inicio'), findsOneWidget);
    expect(find.text('© 2026 Hensell Dev'), findsOneWidget);
    expect(find.text('Preparando el laboratorio financiero.'), findsNothing);
  });
}
