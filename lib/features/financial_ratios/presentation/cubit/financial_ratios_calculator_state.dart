import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_statements_draft.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_ratios_calculator_state.freezed.dart';

@freezed
abstract class FinancialRatiosCalculatorState
    with _$FinancialRatiosCalculatorState {
  const factory FinancialRatiosCalculatorState({
    @Default(FinancialRatiosBuilderStep.incomeStatement)
    FinancialRatiosBuilderStep currentStep,
    @Default(FinancialStatementsDraft()) FinancialStatementsDraft draft,
    @Default(DerivedStatements.zero()) DerivedStatements derivedStatements,
    @Default(<FinancialStatementsValidationIssue>[])
    List<FinancialStatementsValidationIssue> incomeStatementIssues,
    @Default(<FinancialStatementsValidationIssue>[])
    List<FinancialStatementsValidationIssue> balanceSheetIssues,
    @Default(<FinancialStatementsValidationIssue>[])
    List<FinancialStatementsValidationIssue> analysisIssues,
    @Default('liquidity') String selectedGroupId,
    FinancialRatiosResult? result,
    String? validationKey,
  }) = _FinancialRatiosCalculatorState;
}
