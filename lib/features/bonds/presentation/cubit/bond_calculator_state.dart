import 'package:finance_pro/features/bonds/domain/entities/bond_calculator_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bond_calculator_state.freezed.dart';

@freezed
abstract class BondCalculatorState with _$BondCalculatorState {
  const factory BondCalculatorState({
    @Default(<String, String>{}) Map<String, String> inputs,
    BondCalculatorResult? result,
    String? validationKey,
  }) = _BondCalculatorState;
}
