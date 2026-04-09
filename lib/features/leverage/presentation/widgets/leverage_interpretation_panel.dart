import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:finance_pro/design_system/molecules/ds_result_grid.dart';
import 'package:finance_pro/design_system/molecules/ds_result_tile.dart';
import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:finance_pro/features/leverage/presentation/presenters/leverage_calculator_learning_presenter.dart';
import 'package:flutter/material.dart';

class LeverageInterpretationPanel extends StatelessWidget {
  const LeverageInterpretationPanel({
    required this.insight,
    required this.result,
    super.key,
  });

  final LeverageCalculationInsight insight;
  final LeverageResult result;

  @override
  Widget build(BuildContext context) {
    return DsReadingSection(
      title: context.l10n.leverageCalculatorInterpretationTitle,
      summary: _resolveSummary(context),
      child: DsResultGrid(children: _buildTiles(context)),
    );
  }

  List<Widget> _buildTiles(BuildContext context) {
    switch (insight.mode) {
      case LeverageMode.operating:
        return <Widget>[
          DsResultTile(
            label: context.l10n.leverageCalculatorContributionMarginLabel,
            value: AppNumberFormatter.decimal(insight.primaryMetric),
          ),
          DsResultTile(
            label: context.l10n.leverageCalculatorEbitLabel,
            value: AppNumberFormatter.decimal(insight.secondaryMetric),
          ),
          DsResultTile(
            label: context.l10n.leverageCalculatorSensitivityLabel,
            value: _resolveSensitivityLabel(context),
          ),
        ];
      case LeverageMode.financial:
        return <Widget>[
          DsResultTile(
            label: context.l10n.leverageCalculatorCommonBaseLabel,
            value: AppNumberFormatter.decimal(insight.primaryMetric),
          ),
          DsResultTile(
            label: context.l10n.leverageCalculatorTaxAdjustedPreferredLabel,
            value: AppNumberFormatter.decimal(insight.secondaryMetric),
          ),
          DsResultTile(
            label: context.l10n.leverageCalculatorSensitivityLabel,
            value: _resolveSensitivityLabel(context),
          ),
        ];
    }
  }

  String _resolveSensitivityLabel(BuildContext context) {
    switch (insight.sensitivity) {
      case LeverageSensitivity.measured:
        return context.l10n.leverageCalculatorSensitivityMeasured;
      case LeverageSensitivity.elevated:
        return context.l10n.leverageCalculatorSensitivityElevated;
      case LeverageSensitivity.high:
        return context.l10n.leverageCalculatorSensitivityHigh;
    }
  }

  String _resolveSummary(BuildContext context) {
    final String amplification = AppNumberFormatter.decimal(result.degree);

    switch (insight.mode) {
      case LeverageMode.operating:
        return context.l10n.leverageCalculatorOperatingExplanation(
          amplification,
          AppNumberFormatter.decimal(insight.primaryMetric),
          AppNumberFormatter.decimal(insight.secondaryMetric),
        );
      case LeverageMode.financial:
        return context.l10n.leverageCalculatorFinancialExplanation(
          amplification,
          AppNumberFormatter.decimal(insight.primaryMetric),
          AppNumberFormatter.decimal(insight.secondaryMetric),
        );
    }
  }
}
