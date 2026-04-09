import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_formula.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter/material.dart';

class FinancialRatiosFormulaPanel extends StatelessWidget {
  const FinancialRatiosFormulaPanel({
    required this.calculator,
    required this.currentStep,
    required this.selectedGroupId,
    super.key,
  });

  final CalculatorDescriptor calculator;
  final FinancialRatiosBuilderStep currentStep;
  final String selectedGroupId;

  @override
  Widget build(BuildContext context) {
    final List<FormulaContent> formulas =
        currentStep == FinancialRatiosBuilderStep.results
        ? calculator.formulas
              .where(
                (FormulaContent formula) =>
                    formula.groupIds.contains(selectedGroupId) ||
                    (formula.groupIds.isEmpty && formula.stepIds.isEmpty),
              )
              .toList()
        : calculator.formulas
              .where(
                (FormulaContent formula) =>
                    formula.stepIds.contains(currentStep.id) ||
                    (formula.stepIds.isEmpty && formula.groupIds.isEmpty),
              )
              .toList();

    if (formulas.isEmpty) {
      return DsText(
        context.l10n.financialRatiosFormulaFallback,
        tone: DsTextTone.bodyMuted,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: formulas
          .map(
            (FormulaContent formula) => Padding(
              padding: EdgeInsets.only(bottom: context.tokens.spacing.md),
              child: DsFormula(label: formula.label, tex: formula.tex),
            ),
          )
          .toList(),
    );
  }
}
