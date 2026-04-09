import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/domain/usecases/derive_financial_statements.dart';
import 'package:flutter_test/flutter_test.dart';

import 'financial_ratios_test_data.dart';

void main() {
  test('DeriveFinancialStatements computes statement subtotals exactly', () {
    const DeriveFinancialStatements useCase = DeriveFinancialStatements();

    final DerivedStatements result = useCase(
      makeValidFinancialStatementsInput(),
    );

    expect(result.netSales, 930);
    expect(result.netPurchases, 510);
    expect(result.goodsAvailableForSale, 710);
    expect(result.costOfGoodsSold, 530);
    expect(result.grossProfit, 400);
    expect(result.operatingExpenses, 200);
    expect(result.ebit, 200);
    expect(result.earningsBeforeTaxes, 170);
    expect(result.netIncome, 125);
    expect(result.netAccountsReceivable, 220);
    expect(result.currentAssets, 560);
    expect(result.fixedAssetsNet, 700);
    expect(result.totalAssets, 1260);
    expect(result.currentLiabilities, 260);
    expect(result.nonCurrentLiabilities, 450);
    expect(result.totalLiabilities, 710);
    expect(result.equity, 550);
    expect(result.totalLiabilitiesAndEquity, 1260);
    expect(result.balanceDifference, 0);
  });

  test('DeriveFinancialStatements preserves balance mismatch direction', () {
    const DeriveFinancialStatements useCase = DeriveFinancialStatements();

    const FinancialStatementsInput input = FinancialStatementsInput(
      incomeStatement: IncomeStatementInput(
        grossSales: 1000,
        salesDiscounts: 50,
        salesReturns: 20,
        beginningInventory: 200,
        purchases: 500,
        purchaseExpenses: 20,
        purchaseDiscounts: 10,
        endingInventory: 180,
        sellingExpenses: 120,
        administrativeExpenses: 80,
        interestExpense: 30,
        incomeTaxExpense: 45,
      ),
      balanceSheet: BalanceSheetInput(
        cashAndCashEquivalents: 150,
        accountsReceivable: 240,
        allowanceForDoubtfulAccounts: 20,
        advancesToSuppliers: 10,
        inventory: 180,
        propertyPlantAndEquipment: 900,
        accumulatedDepreciation: 200,
        accountsPayable: 130,
        shortTermBankDebt: 90,
        taxesPayable: 40,
        longTermNotesPayable: 200,
        mortgagePayable: 150,
        bondsPayable: 100,
        equity: 500,
      ),
    );

    final DerivedStatements result = useCase(input);

    expect(result.totalAssets, 1260);
    expect(result.totalLiabilitiesAndEquity, 1210);
    expect(result.balanceDifference, 50);
  });
}
