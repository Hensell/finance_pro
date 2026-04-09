import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:finance_pro/design_system/molecules/ds_result_grid.dart';
import 'package:finance_pro/design_system/molecules/ds_result_tile.dart';
import 'package:finance_pro/features/bonds/presentation/presenters/bond_calculator_learning_presenter.dart';
import 'package:flutter/material.dart';

class BondInterpretationPanel extends StatelessWidget {
  const BondInterpretationPanel({required this.insight, super.key});

  final BondPriceInsight insight;

  @override
  Widget build(BuildContext context) {
    return DsReadingSection(
      title: context.l10n.bondCalculatorInterpretationTitle,
      summary: _resolveSummary(context),
      child: DsResultGrid(
        children: <Widget>[
          DsResultTile(
            label: context.l10n.bondCalculatorCouponRateLabel,
            value: '${AppNumberFormatter.decimal(insight.couponRate)}%',
          ),
          DsResultTile(
            label: context.l10n.bondCalculatorStatusLabel,
            value: _resolveStatusLabel(context),
          ),
          DsResultTile(
            label: context.l10n.bondCalculatorDifferenceLabel,
            value: _formatSignedGap(insight.priceGap),
          ),
        ],
      ),
    );
  }

  String _formatSignedGap(double value) {
    final String prefix = value >= 0 ? '+' : '-';
    return '$prefix${AppNumberFormatter.decimal(value.abs())}';
  }

  String _resolveStatusLabel(BuildContext context) {
    switch (insight.position) {
      case BondPricePosition.premium:
        return context.l10n.bondCalculatorStatusPremium;
      case BondPricePosition.atPar:
        return context.l10n.bondCalculatorStatusAtPar;
      case BondPricePosition.discount:
        return context.l10n.bondCalculatorStatusDiscount;
    }
  }

  String _resolveSummary(BuildContext context) {
    final String couponRate = AppNumberFormatter.decimal(insight.couponRate);
    final String requiredReturn = AppNumberFormatter.decimal(
      insight.requiredReturn,
    );

    switch (insight.position) {
      case BondPricePosition.premium:
        return context.l10n.bondCalculatorPremiumExplanation(
          couponRate,
          requiredReturn,
        );
      case BondPricePosition.atPar:
        return context.l10n.bondCalculatorAtParExplanation(
          couponRate,
          requiredReturn,
        );
      case BondPricePosition.discount:
        return context.l10n.bondCalculatorDiscountExplanation(
          couponRate,
          requiredReturn,
        );
    }
  }
}
