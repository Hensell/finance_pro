import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:finance_pro/design_system/molecules/ds_result_grid.dart';
import 'package:finance_pro/design_system/molecules/ds_result_tile.dart';
import 'package:finance_pro/features/lease/domain/entities/lease_calculator_models.dart';
import 'package:finance_pro/features/lease/presentation/presenters/lease_calculator_learning_presenter.dart';
import 'package:flutter/material.dart';

class LeaseInterpretationPanel extends StatelessWidget {
  const LeaseInterpretationPanel({
    required this.insight,
    required this.result,
    super.key,
  });

  final LeaseComparisonInsight insight;
  final LeaseComparisonResult result;

  @override
  Widget build(BuildContext context) {
    return DsReadingSection(
      title: context.l10n.leaseCalculatorInterpretationTitle,
      summary: _resolveSummary(context),
      child: DsResultGrid(
        children: <Widget>[
          DsResultTile(
            label: context.l10n.leaseCalculatorRecommendationLabel,
            value: _resolveRecommendation(context),
          ),
          DsResultTile(
            label: context.l10n.leaseCalculatorDifferenceLabel,
            value: AppNumberFormatter.decimal(insight.savings),
          ),
          DsResultTile(
            label: context.l10n.leaseCalculatorResidualBenefitLabel,
            value: AppNumberFormatter.decimal(insight.discountedResidualValue),
          ),
        ],
      ),
    );
  }

  String _resolveRecommendation(BuildContext context) {
    switch (insight.decision) {
      case LeaseDecision.lease:
        return context.l10n.leaseCalculatorRecommendationLease;
      case LeaseDecision.buy:
        return context.l10n.leaseCalculatorRecommendationBuy;
      case LeaseDecision.neutral:
        return context.l10n.leaseCalculatorRecommendationNeutral;
    }
  }

  String _resolveSummary(BuildContext context) {
    final String savings = AppNumberFormatter.decimal(insight.savings);
    final String rate = AppNumberFormatter.decimal(insight.discountRate);
    final String residual = AppNumberFormatter.decimal(
      insight.discountedResidualValue,
    );

    switch (insight.decision) {
      case LeaseDecision.lease:
        return context.l10n.leaseCalculatorLeaseExplanation(
          savings,
          rate,
          residual,
        );
      case LeaseDecision.buy:
        return context.l10n.leaseCalculatorBuyExplanation(
          savings,
          rate,
          residual,
        );
      case LeaseDecision.neutral:
        return context.l10n.leaseCalculatorNeutralExplanation(rate, residual);
    }
  }
}
