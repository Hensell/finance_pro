import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_formula.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/features/bonds/presentation/models/bond_calculator_draft.dart';
import 'package:finance_pro/features/bonds/presentation/presenters/bond_calculator_learning_presenter.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter/material.dart';

class BondFormulaPanel extends StatelessWidget {
  const BondFormulaPanel({
    required this.draft,
    required this.formulas,
    required this.presenter,
    super.key,
  });

  final BondCalculatorDraft draft;
  final List<FormulaContent> formulas;
  final BondCalculatorLearningPresenter presenter;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final List<Widget> formulaWidgets = formulas.map<Widget>((
      FormulaContent formula,
    ) {
      return Padding(
        padding: EdgeInsets.only(bottom: tokens.spacing.md),
        child: DsFormula(label: formula.label, tex: formula.tex),
      );
    }).toList();

    formulaWidgets.add(
      DsFormula(
        label: context.l10n.bondCalculatorLiveFormulaLabel,
        tex: presenter.buildLiveFormulaTex(draft),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ...formulaWidgets,
        SizedBox(height: tokens.spacing.sm),
        DsText(
          context.l10n.bondCalculatorLiveFormulaSummary,
          tone: DsTextTone.bodyMuted,
        ),
      ],
    );
  }
}
