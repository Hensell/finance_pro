import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';

class CalculateFinancialLeverage {
  const CalculateFinancialLeverage();

  LeverageResult call(FinancialLeverageInput input) {
    if (input.taxRate >= 100) {
      throw ArgumentError.value(
        input.taxRate,
        'taxRate',
        'Financial leverage requires a tax rate below 100%.',
      );
    }

    final double denominator =
        input.earningsBeforeInterestAndTaxes -
        input.interest -
        (input.preferredDividends * (1 / (1 - (input.taxRate / 100))));
    if (denominator <= 0 || !denominator.isFinite) {
      throw ArgumentError.value(
        denominator,
        'denominator',
        'Financial leverage requires a positive earnings base for common shareholders.',
      );
    }

    return LeverageResult(
      degree: input.earningsBeforeInterestAndTaxes / denominator,
    );
  }
}
