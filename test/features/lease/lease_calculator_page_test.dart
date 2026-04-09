import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/features/lease/domain/usecases/calculate_lease_comparison.dart';
import 'package:finance_pro/features/lease/domain/validators/lease_input_validator.dart';
import 'package:finance_pro/features/lease/presentation/pages/lease_calculator_page.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/domain/repositories/feature_content_repository.dart';
import 'package:finance_pro/features/shared_content/domain/usecases/load_feature_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../../test_support/test_app_harness.dart';

void main() {
  testWidgets('LeaseCalculatorPage renders helper copy and live formula', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const LeaseCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/lease/calculator',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Cómo pensar esta comparación'), findsOneWidget);
    expect(find.text('Comparar arrendamiento vs compra'), findsOneWidget);
    expect(find.text('Pago periódico del lease'), findsOneWidget);
    expect(
      find.text('Monto que pagarías en cada periodo del arrendamiento.'),
      findsOneWidget,
    );

    await tester.enterText(find.byType(TextField).at(0), '450');
    await tester.enterText(find.byType(TextField).at(1), '4');
    await tester.enterText(find.byType(TextField).at(2), '11');
    await tester.pump();

    final String content = tester
        .widgetList<TeXWidget>(find.byType(TeXWidget))
        .last
        .content;
    expect(content, contains('Pago = 450'));
    expect(content, contains('N = 4'));
    expect(content, contains('k = 0.11'));
  });

  testWidgets('LeaseCalculatorPage calculates result and recommendation', (
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
        child: const LeaseCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/lease/calculator',
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), '450');
    await tester.enterText(find.byType(TextField).at(1), '4');
    await tester.enterText(find.byType(TextField).at(2), '11');
    await tester.enterText(find.byType(TextField).at(3), '1450');
    await tester.enterText(find.byType(TextField).at(4), '300');
    await _pressButton(tester, 'Comparar alternativas');
    await tester.pumpAndSettle();

    expect(find.text('Cómo leer el resultado'), findsOneWidget);
    expect(find.text('Conviene comprar'), findsWidgets);
    expect(find.text(AppNumberFormatter.decimal(1252.38)), findsOneWidget);
    final Finder recommendationLabel = find.text('ALTERNATIVA SUGERIDA').first;
    expect(recommendationLabel, findsOneWidget);

    final Rect resultRect = tester.getRect(recommendationLabel);
    final double viewportHeight =
        tester.view.physicalSize.height / tester.view.devicePixelRatio;
    expect(resultRect.top, lessThan(viewportHeight));
    expect(resultRect.bottom, greaterThan(0));
  });

  testWidgets('LeaseCalculatorPage shows retry state when content load fails', (
    WidgetTester tester,
  ) async {
    final AppDependencies baseDependencies = createGoldenDependencies();
    const _FailingFeatureContentRepository failingRepository =
        _FailingFeatureContentRepository();
    final AppDependencies dependencies = AppDependencies(
      homeRepository: baseDependencies.homeRepository,
      featureContentRepository: failingRepository,
      loadHomeContent: baseDependencies.loadHomeContent,
      loadFeatureContent: const LoadFeatureContent(failingRepository),
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
        child: const LeaseCalculatorPage(),
        dependencies: dependencies,
        currentLocation: '/feature/lease/calculator',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No pudimos cargar esta vista'), findsOneWidget);
    expect(find.text('Reintentar'), findsOneWidget);
  });
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
