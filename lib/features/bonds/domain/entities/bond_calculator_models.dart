import 'package:freezed_annotation/freezed_annotation.dart';

part 'bond_calculator_models.freezed.dart';

@freezed
abstract class BondCalculatorInput with _$BondCalculatorInput {
  const factory BondCalculatorInput({
    required double annualInterest,
    required int yearsToMaturity,
    required double parValue,
    required double requiredReturn,
  }) = _BondCalculatorInput;
}

@freezed
abstract class BondCalculatorResult with _$BondCalculatorResult {
  const factory BondCalculatorResult({required double presentValue}) =
      _BondCalculatorResult;
}
