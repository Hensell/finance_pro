import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_statements_draft.dart';

class FinancialRatiosInputMapper {
  const FinancialRatiosInputMapper();

  FinancialStatementsInput toLooseInput(FinancialStatementsDraft draft) {
    return FinancialStatementsInput(
      incomeStatement: IncomeStatementInput(
        grossSales: _parseOrZero(draft.incomeStatement.grossSales),
        salesDiscounts: _parseOrZero(draft.incomeStatement.salesDiscounts),
        salesReturns: _parseOrZero(draft.incomeStatement.salesReturns),
        beginningInventory: _parseOrZero(
          draft.incomeStatement.beginningInventory,
        ),
        purchases: _parseOrZero(draft.incomeStatement.purchases),
        purchaseExpenses: _parseOrZero(draft.incomeStatement.purchaseExpenses),
        purchaseDiscounts: _parseOrZero(
          draft.incomeStatement.purchaseDiscounts,
        ),
        endingInventory: _parseOrZero(draft.incomeStatement.endingInventory),
        sellingExpenses: _parseOrZero(draft.incomeStatement.sellingExpenses),
        administrativeExpenses: _parseOrZero(
          draft.incomeStatement.administrativeExpenses,
        ),
        interestExpense: _parseOrZero(draft.incomeStatement.interestExpense),
        incomeTaxExpense: _parseOrZero(draft.incomeStatement.incomeTaxExpense),
      ),
      balanceSheet: BalanceSheetInput(
        cashAndCashEquivalents: _parseOrZero(
          draft.balanceSheet.cashAndCashEquivalents,
        ),
        accountsReceivable: _parseOrZero(draft.balanceSheet.accountsReceivable),
        allowanceForDoubtfulAccounts: _parseOrZero(
          draft.balanceSheet.allowanceForDoubtfulAccounts,
        ),
        advancesToSuppliers: _parseOrZero(
          draft.balanceSheet.advancesToSuppliers,
        ),
        inventory: _parseOrZero(draft.balanceSheet.inventory),
        propertyPlantAndEquipment: _parseOrZero(
          draft.balanceSheet.propertyPlantAndEquipment,
        ),
        accumulatedDepreciation: _parseOrZero(
          draft.balanceSheet.accumulatedDepreciation,
        ),
        accountsPayable: _parseOrZero(draft.balanceSheet.accountsPayable),
        shortTermBankDebt: _parseOrZero(draft.balanceSheet.shortTermBankDebt),
        taxesPayable: _parseOrZero(draft.balanceSheet.taxesPayable),
        longTermNotesPayable: _parseOrZero(
          draft.balanceSheet.longTermNotesPayable,
        ),
        mortgagePayable: _parseOrZero(draft.balanceSheet.mortgagePayable),
        bondsPayable: _parseOrZero(draft.balanceSheet.bondsPayable),
        equity: _parseOrZero(draft.balanceSheet.equity),
      ),
    );
  }

  bool hasInvalidNumber(FinancialStatementsDraft draft) {
    final List<String?> values = <String?>[
      draft.incomeStatement.grossSales,
      draft.incomeStatement.salesDiscounts,
      draft.incomeStatement.salesReturns,
      draft.incomeStatement.beginningInventory,
      draft.incomeStatement.purchases,
      draft.incomeStatement.purchaseExpenses,
      draft.incomeStatement.purchaseDiscounts,
      draft.incomeStatement.endingInventory,
      draft.incomeStatement.sellingExpenses,
      draft.incomeStatement.administrativeExpenses,
      draft.incomeStatement.interestExpense,
      draft.incomeStatement.incomeTaxExpense,
      draft.balanceSheet.cashAndCashEquivalents,
      draft.balanceSheet.accountsReceivable,
      draft.balanceSheet.allowanceForDoubtfulAccounts,
      draft.balanceSheet.advancesToSuppliers,
      draft.balanceSheet.inventory,
      draft.balanceSheet.propertyPlantAndEquipment,
      draft.balanceSheet.accumulatedDepreciation,
      draft.balanceSheet.accountsPayable,
      draft.balanceSheet.shortTermBankDebt,
      draft.balanceSheet.taxesPayable,
      draft.balanceSheet.longTermNotesPayable,
      draft.balanceSheet.mortgagePayable,
      draft.balanceSheet.bondsPayable,
      draft.balanceSheet.equity,
    ];

    return values.any(_isInvalidNumber);
  }

  bool hasMissingFieldsForStep(
    FinancialStatementsDraft draft,
    FinancialRatiosBuilderStep step,
  ) {
    final List<String> values = switch (step) {
      FinancialRatiosBuilderStep.incomeStatement => <String>[
        draft.incomeStatement.grossSales,
        draft.incomeStatement.salesDiscounts,
        draft.incomeStatement.salesReturns,
        draft.incomeStatement.beginningInventory,
        draft.incomeStatement.purchases,
        draft.incomeStatement.purchaseExpenses,
        draft.incomeStatement.purchaseDiscounts,
        draft.incomeStatement.endingInventory,
        draft.incomeStatement.sellingExpenses,
        draft.incomeStatement.administrativeExpenses,
        draft.incomeStatement.interestExpense,
        draft.incomeStatement.incomeTaxExpense,
      ],
      FinancialRatiosBuilderStep.balanceSheet => <String>[
        draft.balanceSheet.cashAndCashEquivalents,
        draft.balanceSheet.accountsReceivable,
        draft.balanceSheet.allowanceForDoubtfulAccounts,
        draft.balanceSheet.advancesToSuppliers,
        draft.balanceSheet.inventory,
        draft.balanceSheet.propertyPlantAndEquipment,
        draft.balanceSheet.accumulatedDepreciation,
        draft.balanceSheet.accountsPayable,
        draft.balanceSheet.shortTermBankDebt,
        draft.balanceSheet.taxesPayable,
        draft.balanceSheet.longTermNotesPayable,
        draft.balanceSheet.mortgagePayable,
        draft.balanceSheet.bondsPayable,
        draft.balanceSheet.equity,
      ],
      FinancialRatiosBuilderStep.results => const <String>[],
    };

    return values.any((String value) => value.trim().isEmpty);
  }

  double _parseOrZero(String raw) {
    final String normalized = raw.trim();
    if (normalized.isEmpty) {
      return 0;
    }

    return double.tryParse(normalized) ?? 0;
  }

  bool _isInvalidNumber(String? raw) {
    if (raw == null) {
      return false;
    }

    final String normalized = raw.trim();
    if (normalized.isEmpty) {
      return false;
    }

    return double.tryParse(normalized) == null;
  }
}
