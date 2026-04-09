import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';

class DeriveFinancialStatements {
  const DeriveFinancialStatements();

  DerivedStatements call(FinancialStatementsInput input) {
    final IncomeStatementInput income = input.incomeStatement;
    final BalanceSheetInput balance = input.balanceSheet;

    final double netSales =
        income.grossSales - income.salesDiscounts - income.salesReturns;
    final double netPurchases =
        income.purchases + income.purchaseExpenses - income.purchaseDiscounts;
    final double goodsAvailableForSale =
        income.beginningInventory + netPurchases;
    final double costOfGoodsSold =
        goodsAvailableForSale - income.endingInventory;
    final double grossProfit = netSales - costOfGoodsSold;
    final double operatingExpenses =
        income.sellingExpenses + income.administrativeExpenses;
    final double ebit = grossProfit - operatingExpenses;
    final double earningsBeforeTaxes = ebit - income.interestExpense;
    final double netIncome = earningsBeforeTaxes - income.incomeTaxExpense;

    final double netAccountsReceivable =
        balance.accountsReceivable - balance.allowanceForDoubtfulAccounts;
    final double currentAssets =
        balance.cashAndCashEquivalents +
        netAccountsReceivable +
        balance.advancesToSuppliers +
        balance.inventory;
    final double fixedAssetsNet =
        balance.propertyPlantAndEquipment - balance.accumulatedDepreciation;
    final double nonCurrentAssets = fixedAssetsNet;
    final double totalAssets = currentAssets + nonCurrentAssets;
    final double currentLiabilities =
        balance.accountsPayable +
        balance.shortTermBankDebt +
        balance.taxesPayable;
    final double nonCurrentLiabilities =
        balance.longTermNotesPayable +
        balance.mortgagePayable +
        balance.bondsPayable;
    final double totalLiabilities = currentLiabilities + nonCurrentLiabilities;
    final double totalLiabilitiesAndEquity = totalLiabilities + balance.equity;

    return DerivedStatements(
      netSales: netSales,
      netPurchases: netPurchases,
      goodsAvailableForSale: goodsAvailableForSale,
      costOfGoodsSold: costOfGoodsSold,
      grossProfit: grossProfit,
      operatingExpenses: operatingExpenses,
      ebit: ebit,
      earningsBeforeTaxes: earningsBeforeTaxes,
      netIncome: netIncome,
      netAccountsReceivable: netAccountsReceivable,
      currentAssets: currentAssets,
      fixedAssetsNet: fixedAssetsNet,
      nonCurrentAssets: nonCurrentAssets,
      totalAssets: totalAssets,
      currentLiabilities: currentLiabilities,
      nonCurrentLiabilities: nonCurrentLiabilities,
      totalLiabilities: totalLiabilities,
      totalLiabilitiesAndEquity: totalLiabilitiesAndEquity,
      equity: balance.equity,
      balanceDifference: totalAssets - totalLiabilitiesAndEquity,
    );
  }
}
