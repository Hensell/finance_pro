import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leverage_calculator_state.freezed.dart';

@freezed
abstract class LeverageCalculatorState with _$LeverageCalculatorState {
  const factory LeverageCalculatorState({
    @Default(<String, String>{}) Map<String, String> inputs,
    @Default(LeverageMode.operating) LeverageMode mode,
    LeverageResult? result,
    String? validationKey,
  }) = _LeverageCalculatorState;
}
