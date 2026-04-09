import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_statements_draft.dart';

FinancialStatementsInput makeValidFinancialStatementsInput() {
  return const FinancialStatementsInput(
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
      equity: 550,
    ),
  );
}

FinancialStatementsDraft makeValidFinancialStatementsDraft() {
  return const FinancialStatementsDraft(
    incomeStatement: IncomeStatementDraft(
      grossSales: '1000',
      salesDiscounts: '50',
      salesReturns: '20',
      beginningInventory: '200',
      purchases: '500',
      purchaseExpenses: '20',
      purchaseDiscounts: '10',
      endingInventory: '180',
      sellingExpenses: '120',
      administrativeExpenses: '80',
      interestExpense: '30',
      incomeTaxExpense: '45',
    ),
    balanceSheet: BalanceSheetDraft(
      cashAndCashEquivalents: '150',
      accountsReceivable: '240',
      allowanceForDoubtfulAccounts: '20',
      advancesToSuppliers: '10',
      inventory: '180',
      propertyPlantAndEquipment: '900',
      accumulatedDepreciation: '200',
      accountsPayable: '130',
      shortTermBankDebt: '90',
      taxesPayable: '40',
      longTermNotesPayable: '200',
      mortgagePayable: '150',
      bondsPayable: '100',
      equity: '550',
    ),
  );
}
