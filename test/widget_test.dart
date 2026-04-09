import 'package:finance_pro/app/app.dart';
import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App redirects from splash to home and keeps footer visible', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      FinanceProApp(
        dependencies: AppDependencies.create(),
        useGoogleFonts: false,
      ),
    );

    expect(find.text('Preparing the finance lab.'), findsNothing);
    expect(find.text('Preparando el laboratorio financiero.'), findsOneWidget);
    expect(find.text('© 2026 Hensell Dev'), findsNothing);

    await tester.pump(const Duration(milliseconds: 950));
    await tester.pumpAndSettle();

    expect(
      find.text('Explora finanzas corporativas con una estructura clara'),
      findsOneWidget,
    );
    expect(find.text('© 2026 Hensell Dev'), findsOneWidget);
  });
}
