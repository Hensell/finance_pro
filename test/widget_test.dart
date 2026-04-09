import 'package:finance_pro/app/app.dart';
import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App renders onboarding shell', (WidgetTester tester) async {
    await tester.pumpWidget(
      FinanceProApp(
        dependencies: AppDependencies.create(),
        useGoogleFonts: false,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Finance Pro'), findsWidgets);
  });
}
