import 'dart:math';

import 'package:finance_pro/features/lease/domain/entities/lease_calculator_models.dart';

class CalculateLeaseComparison {
  const CalculateLeaseComparison();

  LeaseComparisonResult call(LeaseComparisonInput input) {
    final double rate = input.discountRate / 100;
    final double leasePresentValue = _discountLeasePayments(
      leasePayment: input.leasePayment,
      periods: input.periods,
      rate: rate,
    );
    final double discountedResidualValue = _discountResidualValue(
      residualValue: input.residualValue,
      periods: input.periods,
      rate: rate,
    );
    final double purchaseNetCost =
        input.purchasePrice - discountedResidualValue;

    return LeaseComparisonResult(
      difference: purchaseNetCost - leasePresentValue,
      discountedResidualValue: discountedResidualValue,
      leasePresentValue: leasePresentValue,
      purchaseNetCost: purchaseNetCost,
    );
  }

  double _discountLeasePayments({
    required double leasePayment,
    required int periods,
    required double rate,
  }) {
    if (rate == 0) {
      return leasePayment * periods;
    }

    double presentValue = 0;
    for (int period = 1; period <= periods; period++) {
      presentValue += leasePayment / pow(1 + rate, period);
    }
    return presentValue;
  }

  double _discountResidualValue({
    required double residualValue,
    required int periods,
    required double rate,
  }) {
    if (rate == 0) {
      return residualValue;
    }

    return residualValue / pow(1 + rate, periods);
  }
}
