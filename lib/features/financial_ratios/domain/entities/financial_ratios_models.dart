enum FinancialRatioValueStatus { ok, notAvailable, blocked }

class IncomeStatementInput {
  const IncomeStatementInput({
    required this.grossSales,
    required this.salesDiscounts,
    required this.salesReturns,
    required this.beginningInventory,
    required this.purchases,
    required this.purchaseExpenses,
    required this.purchaseDiscounts,
    required this.endingInventory,
    required this.sellingExpenses,
    required this.administrativeExpenses,
    required this.interestExpense,
    required this.incomeTaxExpense,
  });

  final double grossSales;
  final double salesDiscounts;
  final double salesReturns;
  final double beginningInventory;
  final double purchases;
  final double purchaseExpenses;
  final double purchaseDiscounts;
  final double endingInventory;
  final double sellingExpenses;
  final double administrativeExpenses;
  final double interestExpense;
  final double incomeTaxExpense;
}

class BalanceSheetInput {
  const BalanceSheetInput({
    required this.cashAndCashEquivalents,
    required this.accountsReceivable,
    required this.allowanceForDoubtfulAccounts,
    required this.advancesToSuppliers,
    required this.inventory,
    required this.propertyPlantAndEquipment,
    required this.accumulatedDepreciation,
    required this.accountsPayable,
    required this.shortTermBankDebt,
    required this.taxesPayable,
    required this.longTermNotesPayable,
    required this.mortgagePayable,
    required this.bondsPayable,
    required this.equity,
  });

  final double cashAndCashEquivalents;
  final double accountsReceivable;
  final double allowanceForDoubtfulAccounts;
  final double advancesToSuppliers;
  final double inventory;
  final double propertyPlantAndEquipment;
  final double accumulatedDepreciation;
  final double accountsPayable;
  final double shortTermBankDebt;
  final double taxesPayable;
  final double longTermNotesPayable;
  final double mortgagePayable;
  final double bondsPayable;
  final double equity;
}

class FinancialStatementsInput {
  const FinancialStatementsInput({
    required this.incomeStatement,
    required this.balanceSheet,
  });

  final IncomeStatementInput incomeStatement;
  final BalanceSheetInput balanceSheet;
}

class DerivedStatements {
  const DerivedStatements({
    required this.netSales,
    required this.netPurchases,
    required this.goodsAvailableForSale,
    required this.costOfGoodsSold,
    required this.grossProfit,
    required this.operatingExpenses,
    required this.ebit,
    required this.earningsBeforeTaxes,
    required this.netIncome,
    required this.netAccountsReceivable,
    required this.currentAssets,
    required this.fixedAssetsNet,
    required this.nonCurrentAssets,
    required this.totalAssets,
    required this.currentLiabilities,
    required this.nonCurrentLiabilities,
    required this.totalLiabilities,
    required this.totalLiabilitiesAndEquity,
    required this.equity,
    required this.balanceDifference,
  });

  const DerivedStatements.zero()
    : netSales = 0,
      netPurchases = 0,
      goodsAvailableForSale = 0,
      costOfGoodsSold = 0,
      grossProfit = 0,
      operatingExpenses = 0,
      ebit = 0,
      earningsBeforeTaxes = 0,
      netIncome = 0,
      netAccountsReceivable = 0,
      currentAssets = 0,
      fixedAssetsNet = 0,
      nonCurrentAssets = 0,
      totalAssets = 0,
      currentLiabilities = 0,
      nonCurrentLiabilities = 0,
      totalLiabilities = 0,
      totalLiabilitiesAndEquity = 0,
      equity = 0,
      balanceDifference = 0;

  final double netSales;
  final double netPurchases;
  final double goodsAvailableForSale;
  final double costOfGoodsSold;
  final double grossProfit;
  final double operatingExpenses;
  final double ebit;
  final double earningsBeforeTaxes;
  final double netIncome;
  final double netAccountsReceivable;
  final double currentAssets;
  final double fixedAssetsNet;
  final double nonCurrentAssets;
  final double totalAssets;
  final double currentLiabilities;
  final double nonCurrentLiabilities;
  final double totalLiabilities;
  final double totalLiabilitiesAndEquity;
  final double equity;
  final double balanceDifference;
}

class FinancialStatementsValidationIssue {
  const FinancialStatementsValidationIssue({
    required this.stepId,
    required this.messageKey,
  });

  final String messageKey;
  final String stepId;
}

class FinancialStatementsValidationResult {
  const FinancialStatementsValidationResult({
    required this.derivedStatements,
    this.issues = const <FinancialStatementsValidationIssue>[],
  });

  final DerivedStatements derivedStatements;
  final List<FinancialStatementsValidationIssue> issues;

  bool get isValid => issues.isEmpty;
}

class FinancialRatioMetric {
  const FinancialRatioMetric({
    required this.id,
    required this.status,
    this.value,
    this.note,
  });

  final String id;
  final String? note;
  final FinancialRatioValueStatus status;
  final double? value;
}

class FinancialRatioGroupResult {
  const FinancialRatioGroupResult({required this.id, required this.metrics});

  final String id;
  final List<FinancialRatioMetric> metrics;
}

class FinancialRatiosResult {
  const FinancialRatiosResult({required this.groups});

  final List<FinancialRatioGroupResult> groups;
}
