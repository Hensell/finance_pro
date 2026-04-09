import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_calculator_models.freezed.dart';

enum ShareCalculationMode {
  zeroGrowth,
  constantGrowth,
  variableGrowth,
  preferredShare,
}

@freezed
abstract class ShareCalculatorInput with _$ShareCalculatorInput {
  const factory ShareCalculatorInput({
    required double dividend,
    required double requiredReturn,
    required double initialGrowthRate,
    required int periods,
    required double terminalGrowthRate,
  }) = _ShareCalculatorInput;
}

@freezed
abstract class ShareProjectionRow with _$ShareProjectionRow {
  const factory ShareProjectionRow({
    required int period,
    required double dividendBase,
    required double growthFactor,
    required double projectedDividend,
    required double discountFactor,
    required double presentValue,
  }) = _ShareProjectionRow;
}

@freezed
abstract class ShareCalculatorResult with _$ShareCalculatorResult {
  const factory ShareCalculatorResult({
    required ShareCalculationMode mode,
    required double presentValue,
    @Default(<ShareProjectionRow>[]) List<ShareProjectionRow> projectionRows,
    double? terminalDividend,
    double? terminalPrice,
    double? terminalPresentValue,
  }) = _ShareCalculatorResult;
}
