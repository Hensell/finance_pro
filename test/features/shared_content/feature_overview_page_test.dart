import 'package:finance_pro/features/shared_content/presentation/pages/feature_overview_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_app_harness.dart';

void main() {
  testWidgets('FeatureOverviewPage renders single-topic content inline', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      buildGoldenHarness(
        child: const FeatureOverviewPage(featureId: 'bonds'),
        dependencies: createGoldenDependencies(),
        currentLocation: '/feature/bonds',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Valuación e interpretación del bono'), findsOneWidget);
    expect(find.text('Idea central'), findsOneWidget);
    expect(find.textContaining('M: '), findsOneWidget);
    expect(find.textContaining('valor a la par o principal'), findsOneWidget);
    expect(find.text('Qué significa cada variable'), findsOneWidget);
    expect(find.text('Cómo leer la fórmula paso a paso'), findsOneWidget);
    expect(find.text('Mini caso guiado'), findsOneWidget);
    expect(find.text('Errores comunes al estudiar bonos'), findsOneWidget);
    expect(find.text('Leer tema'), findsNothing);
  });
}
