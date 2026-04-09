import 'package:freezed_annotation/freezed_annotation.dart';

part 'lease_calculator_models.freezed.dart';

@freezed
abstract class LeaseComparisonInput with _$LeaseComparisonInput {
  const factory LeaseComparisonInput({
    required double discountRate,
    required double leasePayment,
    required int periods,
    required double purchasePrice,
    required double residualValue,
  }) = _LeaseComparisonInput;
}

@freezed
abstract class LeaseComparisonResult with _$LeaseComparisonResult {
  const factory LeaseComparisonResult({
    required double difference,
    required double discountedResidualValue,
    required double leasePresentValue,
    required double purchaseNetCost,
  }) = _LeaseComparisonResult;
}
