import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/features/bonds/presentation/pages/bond_calculator_page.dart';
import 'package:finance_pro/features/lease/domain/usecases/calculate_lease_comparison.dart';
import 'package:finance_pro/features/lease/domain/validators/lease_input_validator.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/domain/repositories/feature_content_repository.dart';
import 'package:finance_pro/features/shared_content/domain/usecases/load_feature_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../../test_support/test_app_harness.dart';

void main() {
  testWidgets(
    'BondCalculatorPage renders localized helper copy for coupon input',
    (WidgetTester tester) async {
      final AppDependencies dependencies = createGoldenDependencies();

      await tester.pumpWidget(
        buildGoldenHarness(
          child: const BondCalculatorPage(),
          dependencies: dependencies,
          currentLocation: '/feature/bonds/calculator',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Cómo pensar este cálculo'), findsOneWidget);
      expect(find.text('Sustitución en tiempo real'), findsOneWidget);
      expect(find.text('Cupón anual (monto)'), findsOneWidget);
      expect(
        find.text(
          'Monto del pago anual. Si el bono paga 8% sobre 1000, ingresa 80.',
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Tasa que exige el mercado al bono según su riesgo, no la tasa cupón.',
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets('BondCalculatorPage updates live formula as inputs change', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const BondCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/bonds/calculator',
      ),
    );
    await tester.pumpAndSettle();

    TeXWidget liveFormula() =>
        tester.widgetList<TeXWidget>(find.byType(TeXWidget)).last;

    expect(liveFormula().content, contains(r'\text{?}'));

    await tester.enterText(find.byType(TextField).at(0), '80');
    await tester.pump();
    expect(liveFormula().content, contains('I = 80'));

    await tester.enterText(find.byType(TextField).at(1), '1000');
    await tester.pump();
    expect(liveFormula().content, contains('M = 1000'));

    await tester.enterText(find.byType(TextField).at(2), '5');
    await tester.pump();
    expect(liveFormula().content, contains('N = 5'));

    await tester.enterText(find.byType(TextField).at(3), '10');
    await tester.pump();
    expect(liveFormula().content, contains('k_d = 0.1'));
    expect(liveFormula().content, contains(r'B_0 = 80\sum_{t=1}^{5}'));
  });

  testWidgets('BondCalculatorPage shows retry state when content load fails', (
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
        child: const BondCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/bonds/calculator',
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
