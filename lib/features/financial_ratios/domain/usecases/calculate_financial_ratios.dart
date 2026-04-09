import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/domain/usecases/derive_financial_statements.dart';

class CalculateFinancialRatios {
  const CalculateFinancialRatios({
    this.deriveFinancialStatements = const DeriveFinancialStatements(),
  });

  final DeriveFinancialStatements deriveFinancialStatements;

  FinancialRatiosResult call(FinancialStatementsInput input) {
    final DerivedStatements derived = deriveFinancialStatements(input);
    final BalanceSheetInput balance = input.balanceSheet;

    final List<FinancialRatioGroupResult> groups = <FinancialRatioGroupResult>[
      FinancialRatioGroupResult(
        id: 'liquidity',
        metrics: <FinancialRatioMetric>[
          _metric(
            id: 'currentRatio',
            numerator: derived.currentAssets,
            denominator: derived.currentLiabilities,
            note: 'financialRatiosMetricCurrentRatioNote',
          ),
          _metric(
            id: 'quickRatio',
            numerator: derived.currentAssets - balance.inventory,
            denominator: derived.currentLiabilities,
            note: 'financialRatiosMetricQuickRatioNote',
          ),
          _metric(
            id: 'cashRatio',
            numerator: balance.cashAndCashEquivalents,
            denominator: derived.currentLiabilities,
            note: 'financialRatiosMetricCashRatioNote',
          ),
          FinancialRatioMetric(
            id: 'netWorkingCapital',
            status: FinancialRatioValueStatus.ok,
            value: derived.currentAssets - derived.currentLiabilities,
          ),
        ],
      ),
      FinancialRatioGroupResult(
        id: 'activity',
        metrics: <FinancialRatioMetric>[
          _metric(
            id: 'inventoryTurnover',
            numerator: derived.costOfGoodsSold,
            denominator: balance.inventory,
            note: 'financialRatiosMetricInventoryTurnoverNote',
          ),
          _metric(
            id: 'daysInventory',
            numerator: balance.inventory * 365,
            denominator: derived.costOfGoodsSold,
            note: 'financialRatiosMetricDaysInventoryNote',
          ),
          _metric(
            id: 'receivablesTurnover',
            numerator: derived.netSales,
            denominator: derived.netAccountsReceivable,
            note: 'financialRatiosMetricReceivablesTurnoverNote',
          ),
          _metric(
            id: 'averageCollectionPeriod',
            numerator: derived.netAccountsReceivable * 365,
            denominator: derived.netSales,
            note: 'financialRatiosMetricCollectionPeriodNote',
          ),
          _metric(
            id: 'payablesTurnover',
            numerator: derived.costOfGoodsSold,
            denominator: balance.accountsPayable,
            note: 'financialRatiosMetricPayablesTurnoverNote',
          ),
          _metric(
            id: 'averagePaymentPeriod',
            numerator: balance.accountsPayable * 365,
            denominator: derived.costOfGoodsSold,
            note: 'financialRatiosMetricPaymentPeriodNote',
          ),
          _metric(
            id: 'totalAssetTurnover',
            numerator: derived.netSales,
            denominator: derived.totalAssets,
            note: 'financialRatiosMetricTotalAssetTurnoverNote',
          ),
          _metric(
            id: 'fixedAssetTurnover',
            numerator: derived.netSales,
            denominator: derived.fixedAssetsNet,
            note: 'financialRatiosMetricFixedAssetTurnoverNote',
          ),
        ],
      ),
      FinancialRatioGroupResult(
        id: 'debt_coverage',
        metrics: <FinancialRatioMetric>[
          _metric(
            id: 'debtRatio',
            numerator: derived.totalLiabilities,
            denominator: derived.totalAssets,
            note: 'financialRatiosMetricDebtRatioNote',
          ),
          _metric(
            id: 'debtToEquity',
            numerator: derived.totalLiabilities,
            denominator: balance.equity,
            note: 'financialRatiosMetricDebtToEquityNote',
          ),
          _metric(
            id: 'equityMultiplier',
            numerator: derived.totalAssets,
            denominator: balance.equity,
            note: 'financialRatiosMetricEquityMultiplierNote',
          ),
          _metric(
            id: 'interestCoverage',
            numerator: derived.ebit,
            denominator: input.incomeStatement.interestExpense,
            note: 'financialRatiosMetricInterestCoverageNote',
          ),
        ],
      ),
      FinancialRatioGroupResult(
        id: 'profitability',
        metrics: <FinancialRatioMetric>[
          _metric(
            id: 'grossMargin',
            numerator: derived.grossProfit,
            denominator: derived.netSales,
            note: 'financialRatiosMetricGrossMarginNote',
          ),
          _metric(
            id: 'operatingMargin',
            numerator: derived.ebit,
            denominator: derived.netSales,
            note: 'financialRatiosMetricOperatingMarginNote',
          ),
          _metric(
            id: 'netMargin',
            numerator: derived.netIncome,
            denominator: derived.netSales,
            note: 'financialRatiosMetricNetMarginNote',
          ),
          _metric(
            id: 'returnOnAssets',
            numerator: derived.netIncome,
            denominator: derived.totalAssets,
            note: 'financialRatiosMetricReturnOnAssetsNote',
          ),
          _metric(
            id: 'returnOnEquity',
            numerator: derived.netIncome,
            denominator: balance.equity,
            note: 'financialRatiosMetricReturnOnEquityNote',
          ),
        ],
      ),
      FinancialRatioGroupResult(
        id: 'dupont',
        metrics: <FinancialRatioMetric>[
          _metric(
            id: 'dupontNetMargin',
            numerator: derived.netIncome,
            denominator: derived.netSales,
            note: 'financialRatiosMetricDupontNetMarginNote',
          ),
          _metric(
            id: 'dupontAssetTurnover',
            numerator: derived.netSales,
            denominator: derived.totalAssets,
            note: 'financialRatiosMetricDupontAssetTurnoverNote',
          ),
          _metric(
            id: 'dupontEquityMultiplier',
            numerator: derived.totalAssets,
            denominator: balance.equity,
            note: 'financialRatiosMetricDupontEquityMultiplierNote',
          ),
          _dupontMetric(derived: derived, equity: balance.equity),
        ],
      ),
    ];

    return FinancialRatiosResult(groups: groups);
  }

  FinancialRatioMetric _dupontMetric({
    required DerivedStatements derived,
    required double equity,
  }) {
    final FinancialRatioMetric netMargin = _metric(
      id: 'dupontNetMargin',
      numerator: derived.netIncome,
      denominator: derived.netSales,
      note: 'financialRatiosMetricDupontNetMarginNote',
    );
    final FinancialRatioMetric assetTurnover = _metric(
      id: 'dupontAssetTurnover',
      numerator: derived.netSales,
      denominator: derived.totalAssets,
      note: 'financialRatiosMetricDupontAssetTurnoverNote',
    );
    final FinancialRatioMetric equityMultiplier = _metric(
      id: 'dupontEquityMultiplier',
      numerator: derived.totalAssets,
      denominator: equity,
      note: 'financialRatiosMetricDupontEquityMultiplierNote',
    );

    if (netMargin.value == null ||
        assetTurnover.value == null ||
        equityMultiplier.value == null) {
      return const FinancialRatioMetric(
        id: 'dupontReturnOnEquity',
        status: FinancialRatioValueStatus.notAvailable,
        note: 'financialRatiosMetricDupontRoeNote',
      );
    }

    return FinancialRatioMetric(
      id: 'dupontReturnOnEquity',
      status: FinancialRatioValueStatus.ok,
      value: netMargin.value! * assetTurnover.value! * equityMultiplier.value!,
    );
  }

  FinancialRatioMetric _metric({
    required String id,
    required double numerator,
    required double denominator,
    required String note,
  }) {
    if (denominator <= 0) {
      return FinancialRatioMetric(
        id: id,
        status: FinancialRatioValueStatus.notAvailable,
        note: note,
      );
    }

    return FinancialRatioMetric(
      id: id,
      status: FinancialRatioValueStatus.ok,
      value: numerator / denominator,
    );
  }
}
