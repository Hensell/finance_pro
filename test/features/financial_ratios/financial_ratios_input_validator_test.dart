import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/domain/validators/financial_ratios_input_validator.dart';
import 'package:flutter_test/flutter_test.dart';

import 'financial_ratios_test_data.dart';

void main() {
  const FinancialRatiosInputValidator validator =
      FinancialRatiosInputValidator();

  test('validator accepts a consistent income statement and balance sheet', () {
    final FinancialStatementsValidationResult result = validator
        .validateForAnalysis(makeValidFinancialStatementsInput());

    expect(result.isValid, isTrue);
    expect(result.issues, isEmpty);
  });

  test('validator blocks a balance sheet that does not tie', () {
    final FinancialStatementsInput input = FinancialStatementsInput(
      incomeStatement: makeValidFinancialStatementsInput().incomeStatement,
      balanceSheet: const BalanceSheetInput(
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

    final FinancialStatementsValidationResult result = validator
        .validateBalanceSheet(input);

    expect(
      result.issues.any(
        (FinancialStatementsValidationIssue issue) =>
            issue.messageKey == 'financialRatiosValidationBalanceMismatch',
      ),
      isTrue,
    );
  });

  test('validator catches negative net sales', () {
    final FinancialStatementsInput input = FinancialStatementsInput(
      incomeStatement: const IncomeStatementInput(
        grossSales: 100,
        salesDiscounts: 80,
        salesReturns: 40,
        beginningInventory: 0,
        purchases: 0,
        purchaseExpenses: 0,
        purchaseDiscounts: 0,
        endingInventory: 0,
        sellingExpenses: 0,
        administrativeExpenses: 0,
        interestExpense: 0,
        incomeTaxExpense: 0,
      ),
      balanceSheet: makeValidFinancialStatementsInput().balanceSheet,
    );

    final FinancialStatementsValidationResult result = validator
        .validateIncomeStatement(input);

    expect(
      result.issues.any(
        (FinancialStatementsValidationIssue issue) =>
            issue.messageKey == 'financialRatiosValidationNetSalesNegative',
      ),
      isTrue,
    );
  });

  test('validator catches inventory mismatch between statements', () {
    final FinancialStatementsInput input = FinancialStatementsInput(
      incomeStatement: makeValidFinancialStatementsInput().incomeStatement,
      balanceSheet: const BalanceSheetInput(
        cashAndCashEquivalents: 150,
        accountsReceivable: 240,
        allowanceForDoubtfulAccounts: 20,
        advancesToSuppliers: 10,
        inventory: 200,
        propertyPlantAndEquipment: 900,
        accumulatedDepreciation: 200,
        accountsPayable: 130,
        shortTermBankDebt: 90,
        taxesPayable: 40,
        longTermNotesPayable: 200,
        mortgagePayable: 150,
        bondsPayable: 100,
        equity: 570,
      ),
    );

    final FinancialStatementsValidationResult result = validator
        .validateBalanceSheet(input);

    expect(
      result.issues.any(
        (FinancialStatementsValidationIssue issue) =>
            issue.messageKey == 'financialRatiosValidationInventoryMismatch',
      ),
      isTrue,
    );
  });
}
