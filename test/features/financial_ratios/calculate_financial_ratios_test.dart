import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/domain/usecases/calculate_financial_ratios.dart';
import 'package:flutter_test/flutter_test.dart';

import 'financial_ratios_test_data.dart';

void main() {
  test(
    'CalculateFinancialRatios derives grouped metrics from typed statements',
    () {
      const CalculateFinancialRatios useCase = CalculateFinancialRatios();

      final FinancialRatiosResult result = useCase(
        makeValidFinancialStatementsInput(),
      );

      expect(_metricValue(result, 'currentRatio'), closeTo(2.153846, 0.00001));
      expect(
        _metricValue(result, 'averagePaymentPeriod'),
        closeTo(89.528302, 0.00001),
      );
      expect(
        _metricValue(result, 'operatingMargin'),
        closeTo(0.215054, 0.00001),
      );
      expect(
        _metricValue(result, 'returnOnAssets'),
        closeTo(0.099206, 0.00001),
      );
      expect(
        _metricValue(result, 'returnOnEquity'),
        closeTo(0.227273, 0.00001),
      );
      expect(
        _metricValue(result, 'dupontReturnOnEquity'),
        closeTo(0.227273, 0.00001),
      );
    },
  );

  test(
    'CalculateFinancialRatios marks metrics as not available when denominators are invalid',
    () {
      const CalculateFinancialRatios useCase = CalculateFinancialRatios();

      const FinancialStatementsInput input = FinancialStatementsInput(
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
      );

      final FinancialRatiosResult result = useCase(input);

      expect(
        _metric(result, 'inventoryTurnover').status,
        FinancialRatioValueStatus.notAvailable,
      );
      expect(
        _metric(result, 'interestCoverage').status,
        FinancialRatioValueStatus.notAvailable,
      );
      expect(
        _metric(result, 'debtToEquity').status,
        FinancialRatioValueStatus.notAvailable,
      );
    },
  );
}

FinancialRatioMetric _metric(FinancialRatiosResult result, String id) {
  return result.groups
      .expand((FinancialRatioGroupResult group) => group.metrics)
      .firstWhere((FinancialRatioMetric metric) => metric.id == id);
}

double _metricValue(FinancialRatiosResult result, String id) {
  return _metric(result, id).value!;
}
