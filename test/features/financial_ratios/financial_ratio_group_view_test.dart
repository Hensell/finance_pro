import 'dart:convert';
import 'dart:io';

import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/domain/usecases/calculate_financial_ratios.dart';
import 'package:finance_pro/features/financial_ratios/presentation/presenters/financial_ratios_learning_presenter.dart';
import 'package:finance_pro/features/financial_ratios/presentation/widgets/financial_ratio_group_view.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_app_harness.dart';
import 'financial_ratios_test_data.dart';

void main() {
  testWidgets(
    'FinancialRatioGroupView renders didactic range and localized metric note',
    (WidgetTester tester) async {
      final AppDependencies dependencies = createGoldenDependencies();
      final FeatureContent content = _loadContent();
      final result = const CalculateFinancialRatios()(
        makeValidFinancialStatementsInput(),
      );

      await tester.pumpWidget(
        buildGoldenHarness(
          child: Scaffold(
            body: SingleChildScrollView(
              child: FinancialRatioGroupView(
                descriptors: {
                  for (final descriptor in content.calculator!.results)
                    descriptor.id: descriptor,
                },
                onGroupSelected: (_) {},
                presenter: const FinancialRatiosLearningPresenter(),
                result: result,
                selectedGroupId: 'liquidity',
                topics: {for (final topic in content.topics) topic.id: topic},
              ),
            ),
          ),
          dependencies: dependencies,
          currentLocation: '/feature/financial_ratios/calculator',
          useShell: false,
        ),
      );
      await tester.pump();

      expect(find.text('Liquidez'), findsAtLeastNWidgets(1));
      expect(find.text('Liquidez corriente'), findsOneWidget);
      expect(find.text('2.15x'), findsOneWidget);
      expect(find.text('Holgada'), findsOneWidget);
      expect(
        find.text('Cobertura general de obligaciones de corto plazo.'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'FinancialRatioGroupView shows N/A when metric is not available',
    (WidgetTester tester) async {
      final AppDependencies dependencies = createGoldenDependencies();
      final FeatureContent content = _loadContent();

      await tester.pumpWidget(
        buildGoldenHarness(
          child: Scaffold(
            body: SingleChildScrollView(
              child: FinancialRatioGroupView(
                descriptors: {
                  for (final descriptor in content.calculator!.results)
                    descriptor.id: descriptor,
                },
                onGroupSelected: (_) {},
                presenter: const FinancialRatiosLearningPresenter(),
                result: const CalculateFinancialRatios()(
                  const FinancialStatementsInput(
                    incomeStatement: IncomeStatementInput(
                      grossSales: 1000,
                      salesDiscounts: 0,
                      salesReturns: 0,
                      beginningInventory: 0,
                      purchases: 500,
                      purchaseExpenses: 0,
                      purchaseDiscounts: 0,
                      endingInventory: 0,
                      sellingExpenses: 50,
                      administrativeExpenses: 50,
                      interestExpense: 0,
                      incomeTaxExpense: 0,
                    ),
                    balanceSheet: BalanceSheetInput(
                      cashAndCashEquivalents: 100,
                      accountsReceivable: 0,
                      allowanceForDoubtfulAccounts: 0,
                      advancesToSuppliers: 0,
                      inventory: 0,
                      propertyPlantAndEquipment: 300,
                      accumulatedDepreciation: 0,
                      accountsPayable: 0,
                      shortTermBankDebt: 0,
                      taxesPayable: 0,
                      longTermNotesPayable: 400,
                      mortgagePayable: 0,
                      bondsPayable: 0,
                      equity: 0,
                    ),
                  ),
                ),
                selectedGroupId: 'debt_coverage',
                topics: {for (final topic in content.topics) topic.id: topic},
              ),
            ),
          ),
          dependencies: dependencies,
          currentLocation: '/feature/financial_ratios/calculator',
          useShell: false,
        ),
      );
      await tester.pump();

      expect(find.text('Deuda a patrimonio'), findsOneWidget);
      expect(find.text('N/A'), findsAtLeastNWidgets(1));
      expect(
        find.text('Presión financiera de acreedores frente al capital propio.'),
        findsOneWidget,
      );
    },
  );
}

FeatureContent _loadContent() {
  final String raw = File(
    'assets/content/es/financial_ratios.json',
  ).readAsStringSync();
  return FeatureContent.fromJson(jsonDecode(raw) as Map<String, dynamic>);
}
