import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:flutter/material.dart';

class FinancialRatiosIssuePanel extends StatelessWidget {
  const FinancialRatiosIssuePanel({
    required this.issues,
    this.highlightMessage,
    super.key,
  });

  final String? highlightMessage;
  final List<FinancialStatementsValidationIssue> issues;

  @override
  Widget build(BuildContext context) {
    final List<String> messages = <String>{
      ...?((highlightMessage == null) ? null : <String>[highlightMessage!]),
      ...issues.map((FinancialStatementsValidationIssue item) {
        return _resolveMessage(context, item.messageKey);
      }),
    }.toList();

    if (messages.isEmpty) {
      return const SizedBox.shrink();
    }

    final tokens = context.tokens;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(tokens.spacing.md),
      decoration: BoxDecoration(
        color: tokens.colors.error.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(tokens.radii.md),
        border: Border.all(color: tokens.colors.error.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: messages
            .map(
              (String message) => Padding(
                padding: EdgeInsets.only(bottom: tokens.spacing.xs),
                child: DsText(
                  '• $message',
                  tone: DsTextTone.body,
                  color: tokens.colors.error,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  String _resolveMessage(BuildContext context, String messageKey) {
    switch (messageKey) {
      case 'financialRatiosValidationNumeric':
        return context.l10n.financialRatiosValidationNumeric;
      case 'financialRatiosValidationNetSalesNegative':
        return context.l10n.financialRatiosValidationNetSalesNegative;
      case 'financialRatiosValidationNegativeCostOfSales':
        return context.l10n.financialRatiosValidationNegativeCostOfSales;
      case 'financialRatiosValidationGrossProfitInconsistent':
        return context.l10n.financialRatiosValidationGrossProfitInconsistent;
      case 'financialRatiosValidationOperatingIncomeInconsistent':
        return context
            .l10n
            .financialRatiosValidationOperatingIncomeInconsistent;
      case 'financialRatiosValidationNetReceivablesNegative':
        return context.l10n.financialRatiosValidationNetReceivablesNegative;
      case 'financialRatiosValidationFixedAssetsNegative':
        return context.l10n.financialRatiosValidationFixedAssetsNegative;
      case 'financialRatiosValidationTotalAssetsRequired':
        return context.l10n.financialRatiosValidationTotalAssetsRequired;
      case 'financialRatiosValidationCompleteIncomeStatement':
        return context.l10n.financialRatiosValidationCompleteIncomeStatement;
      case 'financialRatiosValidationCompleteBalanceSheet':
        return context.l10n.financialRatiosValidationCompleteBalanceSheet;
      case 'financialRatiosValidationBalanceMismatch':
        return context.l10n.financialRatiosValidationBalanceMismatch;
      case 'financialRatiosValidationInventoryMismatch':
        return context.l10n.financialRatiosValidationInventoryMismatch;
      case 'validationNonNegativeNumbers':
        return context.l10n.validationNonNegativeNumbers;
      default:
        return messageKey;
    }
  }
}
