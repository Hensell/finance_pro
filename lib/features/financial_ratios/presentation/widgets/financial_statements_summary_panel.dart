import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:flutter/material.dart';

class FinancialStatementsSummaryPanel extends StatelessWidget {
  const FinancialStatementsSummaryPanel({
    required this.derivedStatements,
    required this.currentStep,
    super.key,
  });

  final FinancialRatiosBuilderStep currentStep;
  final DerivedStatements derivedStatements;

  @override
  Widget build(BuildContext context) {
    final List<_SummaryItem> items = switch (currentStep) {
      FinancialRatiosBuilderStep.incomeStatement => <_SummaryItem>[
        _SummaryItem(
          label: context.l10n.financialRatiosNetSalesLabel,
          value: derivedStatements.netSales,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosNetPurchasesLabel,
          value: derivedStatements.netPurchases,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosCostOfSalesLabel,
          value: derivedStatements.costOfGoodsSold,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosGrossProfitLabel,
          value: derivedStatements.grossProfit,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosOperatingExpensesLabel,
          value: derivedStatements.operatingExpenses,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosEbitLabel,
          value: derivedStatements.ebit,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosEarningsBeforeTaxesLabel,
          value: derivedStatements.earningsBeforeTaxes,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosNetIncomeLabel,
          value: derivedStatements.netIncome,
        ),
      ],
      FinancialRatiosBuilderStep.balanceSheet => <_SummaryItem>[
        _SummaryItem(
          label: context.l10n.financialRatiosCurrentAssetsLabel,
          value: derivedStatements.currentAssets,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosFixedAssetsNetLabel,
          value: derivedStatements.fixedAssetsNet,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosTotalAssetsLabel,
          value: derivedStatements.totalAssets,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosCurrentLiabilitiesLabel,
          value: derivedStatements.currentLiabilities,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosNonCurrentLiabilitiesLabel,
          value: derivedStatements.nonCurrentLiabilities,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosTotalLiabilitiesLabel,
          value: derivedStatements.totalLiabilities,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosEquityLabel,
          value: derivedStatements.equity,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosLiabilitiesAndEquityLabel,
          value: derivedStatements.totalLiabilitiesAndEquity,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosBalanceDifferenceLabel,
          value: derivedStatements.balanceDifference,
        ),
      ],
      FinancialRatiosBuilderStep.results => <_SummaryItem>[
        _SummaryItem(
          label: context.l10n.financialRatiosNetSalesLabel,
          value: derivedStatements.netSales,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosTotalAssetsLabel,
          value: derivedStatements.totalAssets,
        ),
        _SummaryItem(
          label: context.l10n.financialRatiosNetIncomeLabel,
          value: derivedStatements.netIncome,
        ),
      ],
    };

    return DsReadingSection(
      title: currentStep == FinancialRatiosBuilderStep.balanceSheet
          ? context.l10n.financialRatiosBalancePreviewTitle
          : context.l10n.financialRatiosStatementPreviewTitle,
      summary: currentStep == FinancialRatiosBuilderStep.balanceSheet
          ? context.l10n.financialRatiosBalancePreviewSummary
          : context.l10n.financialRatiosStatementPreviewSummary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: context.tokens.spacing.md,
            runSpacing: context.tokens.spacing.md,
            children: items
                .map(
                  (_SummaryItem item) => _SummaryCard(
                    label: item.label,
                    value: AppNumberFormatter.decimal(item.value),
                  ),
                )
                .toList(),
          ),
          if (currentStep ==
              FinancialRatiosBuilderStep.balanceSheet) ...<Widget>[
            SizedBox(height: context.tokens.spacing.md),
            _BalanceStatusMessage(
              difference: derivedStatements.balanceDifference,
            ),
          ],
        ],
      ),
    );
  }
}

class _SummaryItem {
  const _SummaryItem({required this.label, required this.value});

  final String label;
  final double value;
}

class _BalanceStatusMessage extends StatelessWidget {
  const _BalanceStatusMessage({required this.difference});

  final double difference;

  @override
  Widget build(BuildContext context) {
    final bool balanced = difference.abs() <= 0.01;
    final String message;
    final Color color;

    if (balanced) {
      message = context.l10n.financialRatiosBalanceMatches;
      color = context.tokens.colors.secondary;
    } else if (difference > 0) {
      message = context.l10n.financialRatiosBalanceAssetsHigher(
        AppNumberFormatter.decimal(difference.abs()),
      );
      color = context.tokens.colors.error;
    } else {
      message = context.l10n.financialRatiosBalanceFundingHigher(
        AppNumberFormatter.decimal(difference.abs()),
      );
      color = context.tokens.colors.error;
    }

    return DsText(message, tone: DsTextTone.bodyMuted, color: color);
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Container(
      width:
          MediaQuery.sizeOf(context).width >=
              tokens.layout.breakpointGridTwoColumn
          ? (tokens.layout.maxReadingWidth - tokens.layout.gridGap) / 2
          : double.infinity,
      padding: EdgeInsets.all(tokens.spacing.md),
      decoration: BoxDecoration(
        color: tokens.colors.surfaceRaised,
        borderRadius: BorderRadius.circular(tokens.radii.md),
        border: Border.all(color: tokens.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DsText(label, tone: DsTextTone.caption),
          SizedBox(height: tokens.spacing.xs),
          DsText(value, tone: DsTextTone.title),
        ],
      ),
    );
  }
}
