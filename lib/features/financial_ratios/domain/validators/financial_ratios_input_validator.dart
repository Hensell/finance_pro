import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/domain/usecases/derive_financial_statements.dart';

class FinancialRatiosInputValidator {
  const FinancialRatiosInputValidator({
    this.deriveFinancialStatements = const DeriveFinancialStatements(),
  });

  static const String incomeStatementStepId = 'income_statement';
  static const String balanceSheetStepId = 'balance_sheet';

  final DeriveFinancialStatements deriveFinancialStatements;

  FinancialStatementsValidationResult validateForAnalysis(
    FinancialStatementsInput input,
  ) {
    final DerivedStatements derived = deriveFinancialStatements(input);
    final List<FinancialStatementsValidationIssue> issues =
        <FinancialStatementsValidationIssue>[
          ...validateIncomeStatement(input).issues,
          ...validateBalanceSheet(input).issues,
        ];

    return FinancialStatementsValidationResult(
      derivedStatements: derived,
      issues: _dedupe(issues),
    );
  }

  FinancialStatementsValidationResult validateIncomeStatement(
    FinancialStatementsInput input,
  ) {
    final DerivedStatements derived = deriveFinancialStatements(input);
    final IncomeStatementInput income = input.incomeStatement;
    final List<FinancialStatementsValidationIssue> issues =
        <FinancialStatementsValidationIssue>[
          ..._nonNegativeIssuesForIncomeStatement(income),
        ];

    if (derived.netSales < 0) {
      issues.add(
        const FinancialStatementsValidationIssue(
          stepId: incomeStatementStepId,
          messageKey: 'financialRatiosValidationNetSalesNegative',
        ),
      );
    }

    if (derived.costOfGoodsSold < 0) {
      issues.add(
        const FinancialStatementsValidationIssue(
          stepId: incomeStatementStepId,
          messageKey: 'financialRatiosValidationNegativeCostOfSales',
        ),
      );
    }

    if (derived.grossProfit < 0 && income.grossSales <= 0) {
      issues.add(
        const FinancialStatementsValidationIssue(
          stepId: incomeStatementStepId,
          messageKey: 'financialRatiosValidationGrossProfitInconsistent',
        ),
      );
    }

    if (derived.ebit < 0 &&
        income.sellingExpenses == 0 &&
        income.administrativeExpenses == 0 &&
        derived.grossProfit >= 0) {
      issues.add(
        const FinancialStatementsValidationIssue(
          stepId: incomeStatementStepId,
          messageKey: 'financialRatiosValidationOperatingIncomeInconsistent',
        ),
      );
    }

    return FinancialStatementsValidationResult(
      derivedStatements: derived,
      issues: _dedupe(issues),
    );
  }

  FinancialStatementsValidationResult validateBalanceSheet(
    FinancialStatementsInput input,
  ) {
    final DerivedStatements derived = deriveFinancialStatements(input);
    final BalanceSheetInput balance = input.balanceSheet;
    final List<FinancialStatementsValidationIssue> issues =
        <FinancialStatementsValidationIssue>[
          ..._nonNegativeIssuesForBalanceSheet(balance),
        ];

    if (derived.netAccountsReceivable < 0) {
      issues.add(
        const FinancialStatementsValidationIssue(
          stepId: balanceSheetStepId,
          messageKey: 'financialRatiosValidationNetReceivablesNegative',
        ),
      );
    }

    if (derived.fixedAssetsNet < 0) {
      issues.add(
        const FinancialStatementsValidationIssue(
          stepId: balanceSheetStepId,
          messageKey: 'financialRatiosValidationFixedAssetsNegative',
        ),
      );
    }

    if (derived.totalAssets <= 0) {
      issues.add(
        const FinancialStatementsValidationIssue(
          stepId: balanceSheetStepId,
          messageKey: 'financialRatiosValidationTotalAssetsRequired',
        ),
      );
    }

    if (_balanceMismatch(derived.balanceDifference)) {
      issues.add(
        const FinancialStatementsValidationIssue(
          stepId: balanceSheetStepId,
          messageKey: 'financialRatiosValidationBalanceMismatch',
        ),
      );
    }

    if (_inventoryMismatch(
      incomeEndingInventory: input.incomeStatement.endingInventory,
      balanceInventory: balance.inventory,
    )) {
      issues.add(
        const FinancialStatementsValidationIssue(
          stepId: balanceSheetStepId,
          messageKey: 'financialRatiosValidationInventoryMismatch',
        ),
      );
    }

    return FinancialStatementsValidationResult(
      derivedStatements: derived,
      issues: _dedupe(issues),
    );
  }

  List<FinancialStatementsValidationIssue> _nonNegativeIssuesForIncomeStatement(
    IncomeStatementInput income,
  ) {
    final List<double> values = <double>[
      income.grossSales,
      income.salesDiscounts,
      income.salesReturns,
      income.beginningInventory,
      income.purchases,
      income.purchaseExpenses,
      income.purchaseDiscounts,
      income.endingInventory,
      income.sellingExpenses,
      income.administrativeExpenses,
      income.interestExpense,
      income.incomeTaxExpense,
    ];

    if (values.any((double value) => value < 0)) {
      return const <FinancialStatementsValidationIssue>[
        FinancialStatementsValidationIssue(
          stepId: incomeStatementStepId,
          messageKey: 'validationNonNegativeNumbers',
        ),
      ];
    }

    return const <FinancialStatementsValidationIssue>[];
  }

  List<FinancialStatementsValidationIssue> _nonNegativeIssuesForBalanceSheet(
    BalanceSheetInput balance,
  ) {
    final List<double> values = <double>[
      balance.cashAndCashEquivalents,
      balance.accountsReceivable,
      balance.allowanceForDoubtfulAccounts,
      balance.advancesToSuppliers,
      balance.inventory,
      balance.propertyPlantAndEquipment,
      balance.accumulatedDepreciation,
      balance.accountsPayable,
      balance.shortTermBankDebt,
      balance.taxesPayable,
      balance.longTermNotesPayable,
      balance.mortgagePayable,
      balance.bondsPayable,
      balance.equity,
    ];

    if (values.any((double value) => value < 0)) {
      return const <FinancialStatementsValidationIssue>[
        FinancialStatementsValidationIssue(
          stepId: balanceSheetStepId,
          messageKey: 'validationNonNegativeNumbers',
        ),
      ];
    }

    return const <FinancialStatementsValidationIssue>[];
  }

  List<FinancialStatementsValidationIssue> _dedupe(
    List<FinancialStatementsValidationIssue> issues,
  ) {
    final Set<String> seen = <String>{};
    return issues.where((FinancialStatementsValidationIssue issue) {
      final String key = '${issue.stepId}:${issue.messageKey}';
      if (seen.contains(key)) {
        return false;
      }

      seen.add(key);
      return true;
    }).toList();
  }

  bool _balanceMismatch(double difference) => difference.abs() > 0.01;

  bool _inventoryMismatch({
    required double balanceInventory,
    required double incomeEndingInventory,
  }) {
    return (incomeEndingInventory - balanceInventory).abs() > 0.01;
  }
}
