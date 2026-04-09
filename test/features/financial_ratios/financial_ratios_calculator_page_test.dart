import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/features/financial_ratios/presentation/pages/financial_ratios_calculator_page.dart';
import 'package:finance_pro/features/lease/domain/usecases/calculate_lease_comparison.dart';
import 'package:finance_pro/features/lease/domain/validators/lease_input_validator.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/domain/repositories/feature_content_repository.dart';
import 'package:finance_pro/features/shared_content/domain/usecases/load_feature_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_app_harness.dart';

void main() {
  testWidgets('FinancialRatiosCalculatorPage guides the user to results', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 720);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final AppDependencies dependencies = createGoldenDependencies();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const FinancialRatiosCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/financial_ratios/calculator',
      ),
    );
    await tester.pumpAndSettle();

    await _fillIncomeStatementStep(tester);
    await _pressButton(tester, 'Continuar');
    await tester.pumpAndSettle();

    expect(find.text('Paso 2 · Balance general'), findsWidgets);

    await _fillBalanceSheetStep(tester);
    await _pressButton(tester, 'Analizar razones');
    await tester.pumpAndSettle();

    expect(find.text('Liquidez'), findsAtLeastNWidgets(1));
    expect(find.text('Liquidez corriente'), findsOneWidget);

    final Rect resultRect = tester.getRect(find.text('Liquidez corriente'));
    final double viewportHeight =
        tester.view.physicalSize.height / tester.view.devicePixelRatio;

    expect(resultRect.top, lessThan(viewportHeight));
    expect(resultRect.bottom, greaterThan(0));
  });

  testWidgets(
    'FinancialRatiosCalculatorPage fills sample data and jumps to grouped results',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1280, 720);
      tester.view.devicePixelRatio = 1;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final AppDependencies dependencies = createGoldenDependencies();

      await tester.pumpWidget(
        buildGoldenHarness(
          child: const FinancialRatiosCalculatorPage(),
          dependencies: dependencies,
          currentLocation: '/feature/financial_ratios/calculator',
        ),
      );
      await tester.pumpAndSettle();

      await _pressButton(tester, 'Llenar con datos de prueba');
      await tester.pumpAndSettle();

      expect(find.text('Liquidez corriente'), findsOneWidget);
      expect(find.text('2.15x'), findsOneWidget);
      expect(find.text('Volver'), findsOneWidget);
    },
  );

  testWidgets(
    'FinancialRatiosCalculatorPage blocks incomplete statement capture',
    (WidgetTester tester) async {
      final AppDependencies dependencies = createGoldenDependencies();

      await tester.pumpWidget(
        buildGoldenHarness(
          child: const FinancialRatiosCalculatorPage(),
          dependencies: dependencies,
          currentLocation: '/feature/financial_ratios/calculator',
        ),
      );
      await tester.pumpAndSettle();

      await _fillIncomeStatementStep(tester);
      await tester.enterText(find.byType(TextField).first, '');
      await tester.pumpAndSettle();
      await _pressButton(tester, 'Continuar');
      await tester.pumpAndSettle();

      expect(
        find.textContaining(
          'Completa todas las partidas del estado de resultados',
        ),
        findsOneWidget,
      );
      expect(find.text('Analizar razones'), findsNothing);
    },
  );

  testWidgets(
    'FinancialRatiosCalculatorPage shows balance mismatch before analysis',
    (WidgetTester tester) async {
      final AppDependencies dependencies = createGoldenDependencies();

      await tester.pumpWidget(
        buildGoldenHarness(
          child: const FinancialRatiosCalculatorPage(),
          dependencies: dependencies,
          currentLocation: '/feature/financial_ratios/calculator',
        ),
      );
      await tester.pumpAndSettle();

      await _fillIncomeStatementStep(tester);
      await _pressButton(tester, 'Continuar');
      await tester.pumpAndSettle();

      await _fillBalanceSheetStep(tester, equity: '500');
      await _pressButton(tester, 'Analizar razones');
      await tester.pumpAndSettle();

      expect(find.textContaining('El balance no cuadra'), findsOneWidget);
      expect(
        find.textContaining('Los activos superan a pasivos + patrimonio'),
        findsOneWidget,
      );
      expect(find.text('Patrimonio'), findsAtLeastNWidgets(1));
      expect(find.text('Liquidez corriente'), findsNothing);
    },
  );

  testWidgets(
    'FinancialRatiosCalculatorPage blocks analysis when ending inventory does not match balance sheet inventory',
    (WidgetTester tester) async {
      final AppDependencies dependencies = createGoldenDependencies();

      await tester.pumpWidget(
        buildGoldenHarness(
          child: const FinancialRatiosCalculatorPage(),
          dependencies: dependencies,
          currentLocation: '/feature/financial_ratios/calculator',
        ),
      );
      await tester.pumpAndSettle();

      await _fillIncomeStatementStep(tester);
      await _pressButton(tester, 'Continuar');
      await tester.pumpAndSettle();

      await _fillBalanceSheetStep(tester, inventory: '200', equity: '570');
      await _pressButton(tester, 'Analizar razones');
      await tester.pumpAndSettle();

      expect(
        find.textContaining(
          'El inventario del balance debe coincidir con el inventario final',
        ),
        findsOneWidget,
      );
      expect(find.text('Liquidez corriente'), findsNothing);
    },
  );

  testWidgets(
    'FinancialRatiosCalculatorPage shows retry state when content load fails',
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
          child: const FinancialRatiosCalculatorPage(),
          dependencies: dependencies,
          currentLocation: '/feature/financial_ratios/calculator',
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

Future<void> _fillIncomeStatementStep(WidgetTester tester) async {
  const List<String> values = <String>[
    '1000',
    '50',
    '20',
    '200',
    '500',
    '20',
    '10',
    '180',
    '120',
    '80',
    '30',
    '45',
  ];

  for (int index = 0; index < values.length; index++) {
    await tester.enterText(find.byType(TextField).at(index), values[index]);
  }
  await tester.pumpAndSettle();
}

Future<void> _fillBalanceSheetStep(
  WidgetTester tester, {
  String inventory = '180',
  String equity = '550',
}) async {
  final List<String> values = <String>[
    '150',
    '240',
    '20',
    '10',
    inventory,
    '900',
    '200',
    '130',
    '90',
    '40',
    '200',
    '150',
    '100',
    equity,
  ];

  for (int index = 0; index < values.length; index++) {
    await tester.enterText(find.byType(TextField).at(index), values[index]);
  }
  await tester.pumpAndSettle();
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
