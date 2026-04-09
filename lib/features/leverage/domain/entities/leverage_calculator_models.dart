import 'package:freezed_annotation/freezed_annotation.dart';

part 'leverage_calculator_models.freezed.dart';

enum LeverageMode { operating, financial }

@freezed
abstract class OperatingLeverageInput with _$OperatingLeverageInput {
  const factory OperatingLeverageInput({
    required double salesVolume,
    required double salePrice,
    required double variableCost,
    required double fixedCost,
  }) = _OperatingLeverageInput;
}

@freezed
abstract class FinancialLeverageInput with _$FinancialLeverageInput {
  const factory FinancialLeverageInput({
    required double interest,
    required double preferredDividends,
    required double taxRate,
    required double earningsBeforeInterestAndTaxes,
  }) = _FinancialLeverageInput;
}

@freezed
abstract class LeverageResult with _$LeverageResult {
  const factory LeverageResult({required double degree}) = _LeverageResult;
}
