import 'package:bloc/bloc.dart';
import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/domain/usecases/calculate_financial_ratios.dart';
import 'package:finance_pro/features/financial_ratios/domain/validators/financial_ratios_input_validator.dart';
import 'package:finance_pro/features/financial_ratios/presentation/cubit/financial_ratios_calculator_state.dart';
import 'package:finance_pro/features/financial_ratios/presentation/mappers/financial_ratios_input_mapper.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_statements_draft.dart';

class FinancialRatiosCalculatorCubit
    extends Cubit<FinancialRatiosCalculatorState> {
  FinancialRatiosCalculatorCubit({
    required this.calculateFinancialRatios,
    required this.inputMapper,
    required this.validator,
  }) : super(
         _buildState(inputMapper, validator, const FinancialStatementsDraft()),
       );

  final CalculateFinancialRatios calculateFinancialRatios;
  final FinancialRatiosInputMapper inputMapper;
  final FinancialRatiosInputValidator validator;

  void updateField(String fieldId, String value) {
    final FinancialStatementsDraft nextDraft = state.draft.updateField(
      fieldId,
      value,
    );
    emit(
      _buildState(
        inputMapper,
        validator,
        nextDraft,
        currentStep: state.currentStep,
        selectedGroupId: state.selectedGroupId,
      ),
    );
  }

  void fillWithSampleData() {
    const FinancialStatementsDraft sampleDraft =
        FinancialStatementsDraft.sample();
    final FinancialStatementsInput input = inputMapper.toLooseInput(
      sampleDraft,
    );
    final FinancialRatiosCalculatorState nextState = _buildState(
      inputMapper,
      validator,
      sampleDraft,
      currentStep: FinancialRatiosBuilderStep.results,
      selectedGroupId: state.selectedGroupId,
    );

    emit(
      nextState.copyWith(
        currentStep: FinancialRatiosBuilderStep.results,
        result: calculateFinancialRatios(input),
        validationKey: null,
      ),
    );
  }

  void continueStep() {
    if (inputMapper.hasInvalidNumber(state.draft)) {
      emit(state.copyWith(validationKey: 'financialRatiosValidationNumeric'));
      return;
    }

    if (inputMapper.hasMissingFieldsForStep(state.draft, state.currentStep)) {
      emit(
        state.copyWith(
          validationKey:
              state.currentStep == FinancialRatiosBuilderStep.incomeStatement
              ? 'financialRatiosValidationCompleteIncomeStatement'
              : 'financialRatiosValidationCompleteBalanceSheet',
        ),
      );
      return;
    }

    switch (state.currentStep) {
      case FinancialRatiosBuilderStep.incomeStatement:
        if (state.incomeStatementIssues.isNotEmpty) {
          emit(
            state.copyWith(
              validationKey: state.incomeStatementIssues.first.messageKey,
            ),
          );
          return;
        }

        emit(
          state.copyWith(
            currentStep: FinancialRatiosBuilderStep.balanceSheet,
            validationKey: null,
          ),
        );
      case FinancialRatiosBuilderStep.balanceSheet:
        if (state.analysisIssues.isNotEmpty) {
          emit(
            state.copyWith(
              validationKey: state.analysisIssues.first.messageKey,
            ),
          );
          return;
        }

        final FinancialStatementsInput input = inputMapper.toLooseInput(
          state.draft,
        );
        emit(
          state.copyWith(
            currentStep: FinancialRatiosBuilderStep.results,
            result: calculateFinancialRatios(input),
            validationKey: null,
          ),
        );
      case FinancialRatiosBuilderStep.results:
        break;
    }
  }

  void backStep() {
    switch (state.currentStep) {
      case FinancialRatiosBuilderStep.incomeStatement:
        return;
      case FinancialRatiosBuilderStep.balanceSheet:
        emit(
          state.copyWith(
            currentStep: FinancialRatiosBuilderStep.incomeStatement,
            validationKey: null,
          ),
        );
      case FinancialRatiosBuilderStep.results:
        emit(
          state.copyWith(
            currentStep: FinancialRatiosBuilderStep.balanceSheet,
            validationKey: null,
          ),
        );
    }
  }

  void goToStep(FinancialRatiosBuilderStep step) {
    if (step == state.currentStep) {
      return;
    }

    if (step == FinancialRatiosBuilderStep.incomeStatement) {
      emit(state.copyWith(currentStep: step, validationKey: null));
      return;
    }

    if (step == FinancialRatiosBuilderStep.balanceSheet &&
        state.incomeStatementIssues.isEmpty &&
        !inputMapper.hasMissingFieldsForStep(
          state.draft,
          FinancialRatiosBuilderStep.incomeStatement,
        )) {
      emit(state.copyWith(currentStep: step, validationKey: null));
      return;
    }

    if (step == FinancialRatiosBuilderStep.results &&
        state.result != null &&
        !inputMapper.hasMissingFieldsForStep(
          state.draft,
          FinancialRatiosBuilderStep.balanceSheet,
        ) &&
        state.analysisIssues.isEmpty) {
      emit(state.copyWith(currentStep: step, validationKey: null));
      return;
    }
  }

  void selectResultGroup(String groupId) {
    emit(state.copyWith(selectedGroupId: groupId));
  }

  static FinancialRatiosCalculatorState _buildState(
    FinancialRatiosInputMapper inputMapper,
    FinancialRatiosInputValidator validator,
    FinancialStatementsDraft draft, {
    FinancialRatiosBuilderStep currentStep =
        FinancialRatiosBuilderStep.incomeStatement,
    String selectedGroupId = 'liquidity',
  }) {
    final FinancialStatementsInput input = inputMapper.toLooseInput(draft);
    final FinancialStatementsValidationResult incomeResult = validator
        .validateIncomeStatement(input);
    final FinancialStatementsValidationResult balanceResult = validator
        .validateBalanceSheet(input);
    final FinancialStatementsValidationResult analysisResult = validator
        .validateForAnalysis(input);

    return FinancialRatiosCalculatorState(
      currentStep: currentStep,
      draft: draft,
      derivedStatements: analysisResult.derivedStatements,
      incomeStatementIssues: incomeResult.issues,
      balanceSheetIssues: balanceResult.issues,
      analysisIssues: analysisResult.issues,
      selectedGroupId: selectedGroupId,
    );
  }
}
