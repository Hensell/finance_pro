import 'package:finance_pro/features/shared_content/presentation/pages/feature_overview_page.dart';
import 'package:finance_pro/features/shared_content/presentation/pages/topic_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_app_harness.dart';

void main() {
  testWidgets('Leverage overview exposes the expanded topic map', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      buildGoldenHarness(
        child: const FeatureOverviewPage(featureId: 'leverage'),
        dependencies: createGoldenDependencies(),
        currentLocation: '/feature/leverage',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Apalancamiento operativo'), findsOneWidget);
    expect(find.text('Apalancamiento financiero'), findsOneWidget);
    expect(find.text('Apalancamiento total'), findsOneWidget);
  });

  testWidgets('Leverage topic page renders the new combined leverage content', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      buildGoldenHarness(
        child: const TopicPage(
          featureId: 'leverage',
          topicId: 'combined_leverage',
        ),
        dependencies: createGoldenDependencies(),
        currentLocation: '/feature/leverage/topic/combined_leverage',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Grado de apalancamiento total'), findsOneWidget);
    expect(find.text('Cómo interpretarlo'), findsOneWidget);
    expect(find.text('Cuándo conviene usarlo'), findsOneWidget);
    expect(find.text('Ejemplo de combinación'), findsOneWidget);
  });
}
