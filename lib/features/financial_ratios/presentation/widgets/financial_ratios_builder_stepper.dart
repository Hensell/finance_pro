import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter/material.dart';

class FinancialRatiosBuilderStepper extends StatelessWidget {
  const FinancialRatiosBuilderStepper({
    required this.currentStep,
    required this.onSelected,
    required this.steps,
    super.key,
  });

  final FinancialRatiosBuilderStep currentStep;
  final ValueChanged<FinancialRatiosBuilderStep> onSelected;
  final List<CalculatorStepContent> steps;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Wrap(
      spacing: tokens.spacing.sm,
      runSpacing: tokens.spacing.sm,
      children: steps
          .map(
            (CalculatorStepContent step) => _StepChip(
              isActive: step.id == currentStep.id,
              label: step.title,
              onTap: () => onSelected(_stepFromId(step.id)),
            ),
          )
          .toList(),
    );
  }

  FinancialRatiosBuilderStep _stepFromId(String id) {
    switch (id) {
      case 'balance_sheet':
        return FinancialRatiosBuilderStep.balanceSheet;
      case 'results':
        return FinancialRatiosBuilderStep.results;
      case 'income_statement':
      default:
        return FinancialRatiosBuilderStep.incomeStatement;
    }
  }
}

class _StepChip extends StatelessWidget {
  const _StepChip({
    required this.isActive,
    required this.label,
    required this.onTap,
  });

  final bool isActive;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(tokens.radii.round),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: tokens.spacing.md,
          vertical: tokens.spacing.sm,
        ),
        decoration: BoxDecoration(
          color: isActive
              ? tokens.colors.secondary.withValues(alpha: 0.12)
              : tokens.colors.surfaceRaised,
          borderRadius: BorderRadius.circular(tokens.radii.round),
          border: Border.all(
            color: isActive ? tokens.colors.secondary : tokens.colors.border,
          ),
        ),
        child: DsText(
          label,
          tone: DsTextTone.label,
          color: isActive ? tokens.colors.secondary : tokens.colors.onSurface,
        ),
      ),
    );
  }
}
