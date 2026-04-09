import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/features/lease/domain/usecases/calculate_lease_comparison.dart';
import 'package:finance_pro/features/lease/domain/validators/lease_input_validator.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/domain/repositories/feature_content_repository.dart';
import 'package:finance_pro/features/shared_content/domain/usecases/load_feature_content.dart';
import 'package:finance_pro/features/shares/presentation/pages/share_calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../../test_support/test_app_harness.dart';

void main() {
  testWidgets('ShareCalculatorPage scrolls to results after calculation', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 680);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final AppDependencies dependencies = createGoldenDependencies();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const ShareCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/shares/calculator',
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), '3');
    await tester.enterText(find.byType(TextField).at(1), '15');
    await tester.ensureVisible(find.text('Calcular valor de la acción'));
    await tester.tap(find.text('Calcular valor de la acción'));
    await tester.pumpAndSettle();

    final Rect resultRect = tester.getRect(
      find.text('VALOR PRESENTE ESTIMADO'),
    );
    final double viewportHeight =
        tester.view.physicalSize.height / tester.view.devicePixelRatio;

    expect(resultRect.top, lessThan(viewportHeight));
    expect(resultRect.bottom, greaterThan(0));
  });

  testWidgets('ShareCalculatorPage handles zero growth without extra fields', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const ShareCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/shares/calculator',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Dividendo esperado el próximo año (D₁)'), findsOneWidget);
    expect(find.text('Tasa de crecimiento constante (g, %)'), findsNothing);
    expect(find.text('Número de periodos (N)'), findsNothing);

    await tester.enterText(find.byType(TextField).at(0), '3');
    await tester.enterText(find.byType(TextField).at(1), '15');
    await tester.pump();

    expect(
      tester.widgetList<TeXWidget>(find.byType(TeXWidget)).last.content,
      contains(r'D_1 = 3'),
    );

    await tester.ensureVisible(find.text('Calcular valor de la acción'));
    await tester.tap(find.text('Calcular valor de la acción'));
    await tester.pumpAndSettle();

    expect(find.text('VALOR PRESENTE ESTIMADO'), findsOneWidget);
    expect(find.text(AppNumberFormatter.decimal(20)), findsOneWidget);
  });

  testWidgets('ShareCalculatorPage updates fields and formula by mode', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const ShareCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/shares/calculator',
      ),
    );
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Crecimiento variable'));
    await tester.tap(find.text('Crecimiento variable'));
    await tester.pumpAndSettle();

    expect(find.text('Último dividendo pagado (D₀)'), findsOneWidget);
    expect(find.text('Número de periodos (N)'), findsOneWidget);
    expect(find.text('Dividendo esperado el próximo año (D₁)'), findsNothing);

    await tester.enterText(find.byType(TextField).at(0), '1.5');
    await tester.enterText(find.byType(TextField).at(1), '15');
    await tester.enterText(find.byType(TextField).at(2), '10');
    await tester.enterText(find.byType(TextField).at(3), '3');
    await tester.enterText(find.byType(TextField).at(4), '5');
    await tester.pump();

    final String content = tester
        .widgetList<TeXWidget>(find.byType(TeXWidget))
        .last
        .content;
    expect(content, contains(r'D_0 = 1.5'));
    expect(content, contains(r'g_1 = 0.1'));
    expect(content, contains(r'N = 3'));
    expect(content, contains(r'g_2 = 0.05'));
  });

  testWidgets('ShareCalculatorPage clears stale results when inputs change', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const ShareCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/shares/calculator',
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), '3');
    await tester.enterText(find.byType(TextField).at(1), '15');
    await tester.ensureVisible(find.text('Calcular valor de la acción'));
    await tester.tap(find.text('Calcular valor de la acción'));
    await tester.pumpAndSettle();

    expect(find.text(AppNumberFormatter.decimal(20)), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), '4');
    await tester.pumpAndSettle();

    expect(find.text(AppNumberFormatter.decimal(20)), findsNothing);
  });

  testWidgets('ShareCalculatorPage shows retry state when content load fails', (
    WidgetTester tester,
  ) async {
    final AppDependencies baseDependencies = createGoldenDependencies();
    final FeatureContentRepository failingRepository =
        const _FailingFeatureContentRepository();
    final AppDependencies dependencies = AppDependencies(
      homeRepository: baseDependencies.homeRepository,
      featureContentRepository: failingRepository,
      loadHomeContent: baseDependencies.loadHomeContent,
      loadFeatureContent: LoadFeatureContent(failingRepository),
      calculateBondValue: baseDependencies.calculateBondValue,
      bondInputValidator: baseDependencies.bondInputValidator,
      calculateShareValuation: baseDependencies.calculateShareValuation,
      shareInputValidator: baseDependencies.shareInputValidator,
      calculateOperatingLeverage: baseDependencies.calculateOperatingLeverage,
      calculateFinancialLeverage: baseDependencies.calculateFinancialLeverage,
      leverageInputValidator: baseDependencies.leverageInputValidator,
      calculateLeaseComparison: const CalculateLeaseComparison(),
      leaseInputValidator: const LeaseInputValidator(),
      deriveFinancialStatements: baseDependencies.deriveFinancialStatements,
      calculateFinancialRatios: baseDependencies.calculateFinancialRatios,
      financialRatiosInputValidator:
          baseDependencies.financialRatiosInputValidator,
    );

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const ShareCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/shares/calculator',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No pudimos cargar esta vista'), findsOneWidget);
    expect(find.text('Reintentar'), findsOneWidget);
  });
}

final class _FailingFeatureContentRepository
    implements FeatureContentRepository {
  const _FailingFeatureContentRepository();

  @override
  Future<FeatureContent> load({
    required String localeCode,
    required String featureId,
  }) async {
    throw Exception('load_failed');
  }
}
