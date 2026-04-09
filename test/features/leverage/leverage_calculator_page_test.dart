import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/features/lease/domain/usecases/calculate_lease_comparison.dart';
import 'package:finance_pro/features/lease/domain/validators/lease_input_validator.dart';
import 'package:finance_pro/features/leverage/presentation/pages/leverage_calculator_page.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/domain/repositories/feature_content_repository.dart';
import 'package:finance_pro/features/shared_content/domain/usecases/load_feature_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../../test_support/test_app_harness.dart';

void main() {
  testWidgets('LeverageCalculatorPage scrolls to results after calculation', (
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
        child: const LeverageCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/leverage/calculator',
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), '1200');
    await tester.enterText(find.byType(TextField).at(1), '30');
    await tester.enterText(find.byType(TextField).at(2), '18');
    await tester.enterText(find.byType(TextField).at(3), '9000');
    await _pressButton(tester, 'Calcular apalancamiento');
    await tester.pumpAndSettle();

    final Rect resultRect = tester.getRect(find.text('GRADO ESTIMADO'));
    final double viewportHeight =
        tester.view.physicalSize.height / tester.view.devicePixelRatio;

    expect(resultRect.top, lessThan(viewportHeight));
    expect(resultRect.bottom, greaterThan(0));
  });

  testWidgets('LeverageCalculatorPage updates operating formula and result', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const LeverageCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/leverage/calculator',
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), '1200');
    await tester.enterText(find.byType(TextField).at(1), '30');
    await tester.enterText(find.byType(TextField).at(2), '18');
    await tester.enterText(find.byType(TextField).at(3), '9000');
    await tester.pump();

    final String content = tester
        .widgetList<TeXWidget>(find.byType(TeXWidget))
        .last
        .content;
    expect(content, contains(r'Q = 1200'));
    expect(content, contains(r'\frac{14400}{5400}'));

    await _pressButton(tester, 'Calcular apalancamiento');
    await tester.pumpAndSettle();

    expect(find.text('Cómo leer el resultado'), findsOneWidget);
    expect(find.text(AppNumberFormatter.decimal(2.6666666667)), findsOneWidget);
  });

  testWidgets('LeverageCalculatorPage supports financial mode', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const LeverageCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/leverage/calculator',
      ),
    );
    await tester.pumpAndSettle();

    await _selectMode(tester, 'financial');
    await tester.pumpAndSettle();

    expect(find.text('UAII'), findsOneWidget);
    expect(find.text('DP Dividendos preferentes'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), '10000');
    await tester.enterText(find.byType(TextField).at(1), '2000');
    await tester.enterText(find.byType(TextField).at(2), '2400');
    await tester.enterText(find.byType(TextField).at(3), '40');
    await tester.pump();

    final String content = tester
        .widgetList<TeXWidget>(find.byType(TeXWidget))
        .last
        .content;
    expect(content, contains(r'UAII = 10000'));
    expect(content, contains(r'T = 0.4'));

    await _pressButton(tester, 'Calcular apalancamiento');
    await tester.pumpAndSettle();

    expect(find.text(AppNumberFormatter.decimal(2.5)), findsOneWidget);
    expect(find.text('BASE DISPONIBLE PARA COMUNES'), findsOneWidget);
  });

  testWidgets(
    'LeverageCalculatorPage clears stale results when inputs change',
    (WidgetTester tester) async {
      final AppDependencies dependencies = createGoldenDependencies();

      await tester.pumpWidget(
        buildGoldenHarness(
          child: const LeverageCalculatorPage(),
          dependencies: dependencies,
          currentLocation: '/feature/leverage/calculator',
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), '1200');
      await tester.enterText(find.byType(TextField).at(1), '30');
      await tester.enterText(find.byType(TextField).at(2), '18');
      await tester.enterText(find.byType(TextField).at(3), '9000');
      await _pressButton(tester, 'Calcular apalancamiento');
      await tester.pumpAndSettle();

      expect(
        find.text(AppNumberFormatter.decimal(2.6666666667)),
        findsOneWidget,
      );

      await tester.enterText(find.byType(TextField).at(0), '1000');
      await tester.pumpAndSettle();

      expect(find.text(AppNumberFormatter.decimal(2.6666666667)), findsNothing);
    },
  );

  testWidgets(
    'LeverageCalculatorPage shows retry state when content load fails',
    (WidgetTester tester) async {
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
          child: const LeverageCalculatorPage(),
          dependencies: dependencies,
          currentLocation: '/feature/leverage/calculator',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('No pudimos cargar esta vista'), findsOneWidget);
      expect(find.text('Reintentar'), findsOneWidget);
    },
  );
}

Future<void> _pressButton(WidgetTester tester, String label) async {
  final Finder button = find.byKey(ValueKey<String>('ds-button:$label'));
  await tester.ensureVisible(button);
  final Widget widget = tester.widget<Widget>(button);

  switch (widget) {
    case FilledButton(:final VoidCallback? onPressed):
      onPressed?.call();
    case OutlinedButton(:final VoidCallback? onPressed):
      onPressed?.call();
    case TextButton(:final VoidCallback? onPressed):
      onPressed?.call();
    default:
      await tester.tap(button, warnIfMissed: false);
  }
}

Future<void> _selectMode(WidgetTester tester, String modeId) async {
  final Finder mode = find.byKey(ValueKey<String>('leverage-mode:$modeId'));
  await tester.ensureVisible(mode);
  final GestureDetector gestureDetector = tester.widget<GestureDetector>(mode);
  gestureDetector.onTap?.call();
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
