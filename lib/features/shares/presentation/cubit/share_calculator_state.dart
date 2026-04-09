import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_calculator_state.freezed.dart';

@freezed
abstract class ShareCalculatorState with _$ShareCalculatorState {
  const factory ShareCalculatorState({
    @Default(<String, String>{}) Map<String, String> inputs,
    @Default(ShareCalculationMode.zeroGrowth) ShareCalculationMode mode,
    ShareCalculatorResult? result,
    String? validationKey,
  }) = _ShareCalculatorState;
}
