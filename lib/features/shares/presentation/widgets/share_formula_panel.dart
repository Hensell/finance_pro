import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_formula.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/presentation/models/share_calculator_draft.dart';
import 'package:finance_pro/features/shares/presentation/presenters/share_calculator_learning_presenter.dart';
import 'package:flutter/material.dart';

class ShareFormulaPanel extends StatelessWidget {
  const ShareFormulaPanel({
    required this.draft,
    required this.mode,
    required this.presenter,
    required this.topic,
    super.key,
  });

  final ShareCalculatorDraft draft;
  final ShareCalculationMode mode;
  final ShareCalculatorLearningPresenter presenter;
  final TopicContent topic;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final List<FormulaContent> formulas = topic.sections
        .expand((ContentSection section) => section.formulas)
        .toList();
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
        label: context.l10n.shareCalculatorLiveFormulaLabel,
        tex: presenter.buildLiveFormulaTex(mode: mode, draft: draft),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ...formulaWidgets,
        SizedBox(height: tokens.spacing.sm),
        DsText(
          context.l10n.shareCalculatorLiveFormulaSummary,
          tone: DsTextTone.bodyMuted,
        ),
      ],
    );
  }
}
