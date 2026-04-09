import 'dart:math';

import 'package:finance_pro/features/bonds/domain/entities/bond_calculator_models.dart';

class CalculateBondValue {
  const CalculateBondValue();

  BondCalculatorResult call(BondCalculatorInput input) {
    final double discountRate = input.requiredReturn / 100;
    final int periods = input.yearsToMaturity;
    double couponFactorSum = 0;

    for (int period = 1; period <= periods; period++) {
      couponFactorSum += 1 / pow(1 + discountRate, period);
    }

    final double presentValue =
        (input.annualInterest * couponFactorSum) +
        (input.parValue * (1 / pow(1 + discountRate, periods)));

    return BondCalculatorResult(presentValue: presentValue);
  }
}
