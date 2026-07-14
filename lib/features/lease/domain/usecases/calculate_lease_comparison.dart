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

    return leasePayment * (1 - pow(1 + rate, -periods)) / rate;
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
