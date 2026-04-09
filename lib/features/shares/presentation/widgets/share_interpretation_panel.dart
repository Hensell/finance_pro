import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:finance_pro/design_system/molecules/ds_result_grid.dart';
import 'package:finance_pro/design_system/molecules/ds_result_tile.dart';
import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/presentation/models/share_calculator_draft.dart';
import 'package:finance_pro/features/shares/presentation/presenters/share_calculator_learning_presenter.dart';
import 'package:flutter/material.dart';

class ShareInterpretationPanel extends StatelessWidget {
  const ShareInterpretationPanel({
    required this.draft,
    required this.insight,
    super.key,
  });

  final ShareCalculatorDraft draft;
  final ShareCalculationInsight insight;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tiles = <Widget>[
      DsResultTile(
        label: context.l10n.shareCalculatorDividendBasisLabel,
        value: insight.dividendBasis,
      ),
      DsResultTile(
        label: context.l10n.shareCalculatorRequiredReturnLabel,
        value: '${AppNumberFormatter.decimal(draft.requiredReturn ?? 0)}%',
      ),
    ];

    if (insight.growthSpread != null) {
      tiles.add(
        DsResultTile(
          label: context.l10n.shareCalculatorSpreadLabel,
          value: '${AppNumberFormatter.decimal(insight.growthSpread!)}%',
        ),
      );
    }

    if (insight.terminalWeight != null) {
      tiles.add(
        DsResultTile(
          label: context.l10n.shareCalculatorTerminalWeightLabel,
          value: '${AppNumberFormatter.decimal(insight.terminalWeight!)}%',
        ),
      );
    }

    return DsReadingSection(
      title: context.l10n.shareCalculatorInterpretationTitle,
      summary: _resolveSummary(context),
      child: DsResultGrid(children: tiles),
    );
  }

  String _resolveSummary(BuildContext context) {
    final String requiredReturn = AppNumberFormatter.decimal(
      draft.requiredReturn ?? 0,
    );

    switch (insight.mode) {
      case ShareCalculationMode.zeroGrowth:
        return context.l10n.shareCalculatorZeroGrowthExplanation(
          requiredReturn,
        );
      case ShareCalculationMode.preferredShare:
        return context.l10n.shareCalculatorPreferredExplanation(requiredReturn);
      case ShareCalculationMode.constantGrowth:
        return context.l10n.shareCalculatorConstantGrowthExplanation(
          AppNumberFormatter.decimal(draft.initialGrowthRate ?? 0),
          AppNumberFormatter.decimal(insight.growthSpread ?? 0),
        );
      case ShareCalculationMode.variableGrowth:
        return context.l10n.shareCalculatorVariableGrowthExplanation(
          (insight.periods ?? 0).toString(),
          AppNumberFormatter.decimal(draft.terminalGrowthRate ?? 0),
          AppNumberFormatter.decimal(insight.terminalWeight ?? 0),
        );
    }
  }
}
