import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:finance_pro/features/financial_ratios/presentation/widgets/financial_statements_summary_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_app_harness.dart';

void main() {
  testWidgets(
    'FinancialStatementsSummaryPanel shows balanced balance sheet guidance',
    (WidgetTester tester) async {
      final AppDependencies dependencies = createGoldenDependencies();

      await tester.pumpWidget(
        buildGoldenHarness(
          child: const SingleChildScrollView(
            child: FinancialStatementsSummaryPanel(
              currentStep: FinancialRatiosBuilderStep.balanceSheet,
              derivedStatements: DerivedStatements(
                netSales: 930,
                netPurchases: 510,
                goodsAvailableForSale: 710,
                costOfGoodsSold: 530,
                grossProfit: 400,
                operatingExpenses: 200,
                ebit: 200,
                earningsBeforeTaxes: 170,
                netIncome: 125,
                netAccountsReceivable: 220,
                currentAssets: 560,
                fixedAssetsNet: 700,
                nonCurrentAssets: 700,
                totalAssets: 1260,
                currentLiabilities: 260,
                nonCurrentLiabilities: 450,
                totalLiabilities: 710,
                totalLiabilitiesAndEquity: 1260,
                equity: 550,
                balanceDifference: 0,
              ),
            ),
          ),
          dependencies: dependencies,
          currentLocation: '/feature/financial_ratios/calculator',
          useShell: false,
        ),
      );
      await tester.pump();

      expect(find.text('Patrimonio'), findsAtLeastNWidgets(1));
      expect(
        find.text(
          'El balance cuadra correctamente: activos y fuentes de financiamiento están alineados.',
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'FinancialStatementsSummaryPanel explains when assets exceed funding',
    (WidgetTester tester) async {
      final AppDependencies dependencies = createGoldenDependencies();

      await tester.pumpWidget(
        buildGoldenHarness(
          child: const SingleChildScrollView(
            child: FinancialStatementsSummaryPanel(
              currentStep: FinancialRatiosBuilderStep.balanceSheet,
              derivedStatements: DerivedStatements(
                netSales: 0,
                netPurchases: 0,
                goodsAvailableForSale: 0,
                costOfGoodsSold: 0,
                grossProfit: 0,
                operatingExpenses: 0,
                ebit: 0,
                earningsBeforeTaxes: 0,
                netIncome: 0,
                netAccountsReceivable: 0,
                currentAssets: 560,
                fixedAssetsNet: 700,
                nonCurrentAssets: 700,
                totalAssets: 1260,
                currentLiabilities: 260,
                nonCurrentLiabilities: 450,
                totalLiabilities: 710,
                totalLiabilitiesAndEquity: 1210,
                equity: 500,
                balanceDifference: 50,
              ),
            ),
          ),
          dependencies: dependencies,
          currentLocation: '/feature/financial_ratios/calculator',
          useShell: false,
        ),
      );
      await tester.pump();

      expect(
        find.textContaining(
          'Los activos superan a pasivos + patrimonio por 50.00',
        ),
        findsOneWidget,
      );
    },
  );
}
