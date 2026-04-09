import 'package:finance_pro/features/lease/domain/entities/lease_calculator_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lease_calculator_state.freezed.dart';

@freezed
abstract class LeaseCalculatorState with _$LeaseCalculatorState {
  const factory LeaseCalculatorState({
    @Default(<String, String>{}) Map<String, String> inputs,
    LeaseComparisonResult? result,
    String? validationKey,
  }) = _LeaseCalculatorState;
}
