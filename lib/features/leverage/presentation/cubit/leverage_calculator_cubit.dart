import 'package:bloc/bloc.dart';
import 'package:finance_pro/core/utils/input_parsers.dart';
import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:finance_pro/features/leverage/domain/usecases/calculate_financial_leverage.dart';
import 'package:finance_pro/features/leverage/domain/usecases/calculate_operating_leverage.dart';
import 'package:finance_pro/features/leverage/domain/validators/leverage_input_validator.dart';
import 'package:finance_pro/features/leverage/presentation/cubit/leverage_calculator_state.dart';

class LeverageCalculatorCubit extends Cubit<LeverageCalculatorState> {
  LeverageCalculatorCubit({
    required this.calculateFinancialLeverage,
    required this.calculateOperatingLeverage,
    required this.validator,
  }) : super(const LeverageCalculatorState());

  final CalculateFinancialLeverage calculateFinancialLeverage;
  final CalculateOperatingLeverage calculateOperatingLeverage;
  final LeverageInputValidator validator;

  void selectMode(LeverageMode mode) {
    emit(state.copyWith(mode: mode, result: null, validationKey: null));
  }

  void updateField(String fieldId, String value) {
    emit(
      state.copyWith(
        inputs: <String, String>{...state.inputs, fieldId: value},
        result: null,
        validationKey: null,
      ),
    );
  }

  void submit() {
    if (state.mode == LeverageMode.operating) {
      final OperatingLeverageInput? input = _mapOperatingInput(state.inputs);
      if (input == null) {
        emit(
          state.copyWith(
            result: null,
            validationKey: 'validationNonNegativeNumbers',
          ),
        );
        return;
      }

      final String? validationKey = validator.validateOperating(input);
      if (validationKey != null) {
        emit(state.copyWith(result: null, validationKey: validationKey));
        return;
      }

      try {
        emit(
          state.copyWith(
            result: calculateOperatingLeverage(input),
            validationKey: null,
          ),
        );
      } on ArgumentError {
        emit(
          state.copyWith(
            result: null,
            validationKey: 'validationLeverageOperatingDenominator',
          ),
        );
      }
      return;
    }

    final FinancialLeverageInput? input = _mapFinancialInput(state.inputs);
    if (input == null) {
      emit(
        state.copyWith(
          result: null,
          validationKey: 'validationNonNegativeNumbers',
        ),
      );
      return;
    }

    final String? validationKey = validator.validateFinancial(input);
    if (validationKey != null) {
      emit(state.copyWith(result: null, validationKey: validationKey));
      return;
    }

    try {
      emit(
        state.copyWith(
          result: calculateFinancialLeverage(input),
          validationKey: null,
        ),
      );
    } on ArgumentError {
      emit(
        state.copyWith(
          result: null,
          validationKey: 'validationLeverageFinancialDenominator',
        ),
      );
    }
  }

  FinancialLeverageInput? _mapFinancialInput(Map<String, String> values) {
    final double? interest = parseNonNegativeNumber(values['interest'] ?? '');
    final double? preferredDividends = parseNonNegativeNumber(
      values['preferredDividends'] ?? '',
    );
    final double? taxRate = parseNonNegativeNumber(values['taxRate'] ?? '');
    final double? ebit = parsePositiveNumber(
      values['earningsBeforeInterestAndTaxes'] ?? '',
    );

    if (interest == null ||
        preferredDividends == null ||
        taxRate == null ||
        ebit == null) {
      return null;
    }

    return FinancialLeverageInput(
      interest: interest,
      preferredDividends: preferredDividends,
      taxRate: taxRate,
      earningsBeforeInterestAndTaxes: ebit,
    );
  }

  OperatingLeverageInput? _mapOperatingInput(Map<String, String> values) {
    final double? salesVolume = parsePositiveNumber(
      values['salesVolume'] ?? '',
    );
    final double? salePrice = parsePositiveNumber(values['salePrice'] ?? '');
    final double? variableCost = parseNonNegativeNumber(
      values['variableCost'] ?? '',
    );
    final double? fixedCost = parseNonNegativeNumber(values['fixedCost'] ?? '');

    if (salesVolume == null ||
        salePrice == null ||
        variableCost == null ||
        fixedCost == null) {
      return null;
    }

    return OperatingLeverageInput(
      salesVolume: salesVolume,
      salePrice: salePrice,
      variableCost: variableCost,
      fixedCost: fixedCost,
    );
  }
}
