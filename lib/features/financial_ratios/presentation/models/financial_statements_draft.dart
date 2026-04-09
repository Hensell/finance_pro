class IncomeStatementDraft {
  const IncomeStatementDraft({
    this.grossSales = '',
    this.salesDiscounts = '',
    this.salesReturns = '',
    this.beginningInventory = '',
    this.purchases = '',
    this.purchaseExpenses = '',
    this.purchaseDiscounts = '',
    this.endingInventory = '',
    this.sellingExpenses = '',
    this.administrativeExpenses = '',
    this.interestExpense = '',
    this.incomeTaxExpense = '',
  });

  final String grossSales;
  final String salesDiscounts;
  final String salesReturns;
  final String beginningInventory;
  final String purchases;
  final String purchaseExpenses;
  final String purchaseDiscounts;
  final String endingInventory;
  final String sellingExpenses;
  final String administrativeExpenses;
  final String interestExpense;
  final String incomeTaxExpense;

  IncomeStatementDraft copyWith({
    String? grossSales,
    String? salesDiscounts,
    String? salesReturns,
    String? beginningInventory,
    String? purchases,
    String? purchaseExpenses,
    String? purchaseDiscounts,
    String? endingInventory,
    String? sellingExpenses,
    String? administrativeExpenses,
    String? interestExpense,
    String? incomeTaxExpense,
  }) {
    return IncomeStatementDraft(
      grossSales: grossSales ?? this.grossSales,
      salesDiscounts: salesDiscounts ?? this.salesDiscounts,
      salesReturns: salesReturns ?? this.salesReturns,
      beginningInventory: beginningInventory ?? this.beginningInventory,
      purchases: purchases ?? this.purchases,
      purchaseExpenses: purchaseExpenses ?? this.purchaseExpenses,
      purchaseDiscounts: purchaseDiscounts ?? this.purchaseDiscounts,
      endingInventory: endingInventory ?? this.endingInventory,
      sellingExpenses: sellingExpenses ?? this.sellingExpenses,
      administrativeExpenses:
          administrativeExpenses ?? this.administrativeExpenses,
      interestExpense: interestExpense ?? this.interestExpense,
      incomeTaxExpense: incomeTaxExpense ?? this.incomeTaxExpense,
    );
  }
}

class BalanceSheetDraft {
  const BalanceSheetDraft({
    this.cashAndCashEquivalents = '',
    this.accountsReceivable = '',
    this.allowanceForDoubtfulAccounts = '',
    this.advancesToSuppliers = '',
    this.inventory = '',
    this.propertyPlantAndEquipment = '',
    this.accumulatedDepreciation = '',
    this.accountsPayable = '',
    this.shortTermBankDebt = '',
    this.taxesPayable = '',
    this.longTermNotesPayable = '',
    this.mortgagePayable = '',
    this.bondsPayable = '',
    this.equity = '',
  });

  final String cashAndCashEquivalents;
  final String accountsReceivable;
  final String allowanceForDoubtfulAccounts;
  final String advancesToSuppliers;
  final String inventory;
  final String propertyPlantAndEquipment;
  final String accumulatedDepreciation;
  final String accountsPayable;
  final String shortTermBankDebt;
  final String taxesPayable;
  final String longTermNotesPayable;
  final String mortgagePayable;
  final String bondsPayable;
  final String equity;

  BalanceSheetDraft copyWith({
    String? cashAndCashEquivalents,
    String? accountsReceivable,
    String? allowanceForDoubtfulAccounts,
    String? advancesToSuppliers,
    String? inventory,
    String? propertyPlantAndEquipment,
    String? accumulatedDepreciation,
    String? accountsPayable,
    String? shortTermBankDebt,
    String? taxesPayable,
    String? longTermNotesPayable,
    String? mortgagePayable,
    String? bondsPayable,
    String? equity,
  }) {
    return BalanceSheetDraft(
      cashAndCashEquivalents:
          cashAndCashEquivalents ?? this.cashAndCashEquivalents,
      accountsReceivable: accountsReceivable ?? this.accountsReceivable,
      allowanceForDoubtfulAccounts:
          allowanceForDoubtfulAccounts ?? this.allowanceForDoubtfulAccounts,
      advancesToSuppliers: advancesToSuppliers ?? this.advancesToSuppliers,
      inventory: inventory ?? this.inventory,
      propertyPlantAndEquipment:
          propertyPlantAndEquipment ?? this.propertyPlantAndEquipment,
      accumulatedDepreciation:
          accumulatedDepreciation ?? this.accumulatedDepreciation,
      accountsPayable: accountsPayable ?? this.accountsPayable,
      shortTermBankDebt: shortTermBankDebt ?? this.shortTermBankDebt,
      taxesPayable: taxesPayable ?? this.taxesPayable,
      longTermNotesPayable: longTermNotesPayable ?? this.longTermNotesPayable,
      mortgagePayable: mortgagePayable ?? this.mortgagePayable,
      bondsPayable: bondsPayable ?? this.bondsPayable,
      equity: equity ?? this.equity,
    );
  }
}

class FinancialStatementsDraft {
  const FinancialStatementsDraft({
    this.incomeStatement = const IncomeStatementDraft(),
    this.balanceSheet = const BalanceSheetDraft(),
  });

  const FinancialStatementsDraft.sample()
    : incomeStatement = const IncomeStatementDraft(
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
      balanceSheet = const BalanceSheetDraft(
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
      );

  final BalanceSheetDraft balanceSheet;
  final IncomeStatementDraft incomeStatement;

  String? valueFor(String fieldId) {
    switch (fieldId) {
      case 'grossSales':
        return incomeStatement.grossSales;
      case 'salesDiscounts':
        return incomeStatement.salesDiscounts;
      case 'salesReturns':
        return incomeStatement.salesReturns;
      case 'beginningInventory':
        return incomeStatement.beginningInventory;
      case 'purchases':
        return incomeStatement.purchases;
      case 'purchaseExpenses':
        return incomeStatement.purchaseExpenses;
      case 'purchaseDiscounts':
        return incomeStatement.purchaseDiscounts;
      case 'endingInventory':
        return incomeStatement.endingInventory;
      case 'sellingExpenses':
        return incomeStatement.sellingExpenses;
      case 'administrativeExpenses':
        return incomeStatement.administrativeExpenses;
      case 'interestExpense':
        return incomeStatement.interestExpense;
      case 'incomeTaxExpense':
        return incomeStatement.incomeTaxExpense;
      case 'cashAndCashEquivalents':
        return balanceSheet.cashAndCashEquivalents;
      case 'accountsReceivable':
        return balanceSheet.accountsReceivable;
      case 'allowanceForDoubtfulAccounts':
        return balanceSheet.allowanceForDoubtfulAccounts;
      case 'advancesToSuppliers':
        return balanceSheet.advancesToSuppliers;
      case 'inventory':
        return balanceSheet.inventory;
      case 'propertyPlantAndEquipment':
        return balanceSheet.propertyPlantAndEquipment;
      case 'accumulatedDepreciation':
        return balanceSheet.accumulatedDepreciation;
      case 'accountsPayable':
        return balanceSheet.accountsPayable;
      case 'shortTermBankDebt':
        return balanceSheet.shortTermBankDebt;
      case 'taxesPayable':
        return balanceSheet.taxesPayable;
      case 'longTermNotesPayable':
        return balanceSheet.longTermNotesPayable;
      case 'mortgagePayable':
        return balanceSheet.mortgagePayable;
      case 'bondsPayable':
        return balanceSheet.bondsPayable;
      case 'equity':
        return balanceSheet.equity;
      default:
        return null;
    }
  }

  FinancialStatementsDraft updateField(String fieldId, String value) {
    switch (fieldId) {
      case 'grossSales':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(grossSales: value),
          balanceSheet: balanceSheet,
        );
      case 'salesDiscounts':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(salesDiscounts: value),
          balanceSheet: balanceSheet,
        );
      case 'salesReturns':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(salesReturns: value),
          balanceSheet: balanceSheet,
        );
      case 'beginningInventory':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(beginningInventory: value),
          balanceSheet: balanceSheet,
        );
      case 'purchases':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(purchases: value),
          balanceSheet: balanceSheet,
        );
      case 'purchaseExpenses':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(purchaseExpenses: value),
          balanceSheet: balanceSheet,
        );
      case 'purchaseDiscounts':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(purchaseDiscounts: value),
          balanceSheet: balanceSheet,
        );
      case 'endingInventory':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(endingInventory: value),
          balanceSheet: balanceSheet,
        );
      case 'sellingExpenses':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(sellingExpenses: value),
          balanceSheet: balanceSheet,
        );
      case 'administrativeExpenses':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(
            administrativeExpenses: value,
          ),
          balanceSheet: balanceSheet,
        );
      case 'interestExpense':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(interestExpense: value),
          balanceSheet: balanceSheet,
        );
      case 'incomeTaxExpense':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement.copyWith(incomeTaxExpense: value),
          balanceSheet: balanceSheet,
        );
      case 'cashAndCashEquivalents':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(cashAndCashEquivalents: value),
        );
      case 'accountsReceivable':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(accountsReceivable: value),
        );
      case 'allowanceForDoubtfulAccounts':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(
            allowanceForDoubtfulAccounts: value,
          ),
        );
      case 'advancesToSuppliers':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(advancesToSuppliers: value),
        );
      case 'inventory':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(inventory: value),
        );
      case 'propertyPlantAndEquipment':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(propertyPlantAndEquipment: value),
        );
      case 'accumulatedDepreciation':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(accumulatedDepreciation: value),
        );
      case 'accountsPayable':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(accountsPayable: value),
        );
      case 'shortTermBankDebt':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(shortTermBankDebt: value),
        );
      case 'taxesPayable':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(taxesPayable: value),
        );
      case 'longTermNotesPayable':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(longTermNotesPayable: value),
        );
      case 'mortgagePayable':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(mortgagePayable: value),
        );
      case 'bondsPayable':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(bondsPayable: value),
        );
      case 'equity':
        return FinancialStatementsDraft(
          incomeStatement: incomeStatement,
          balanceSheet: balanceSheet.copyWith(equity: value),
        );
      default:
        return this;
    }
  }
}
