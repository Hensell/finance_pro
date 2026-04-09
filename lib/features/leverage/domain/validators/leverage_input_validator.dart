import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';

class LeverageInputValidator {
  const LeverageInputValidator();

  String? validateOperating(OperatingLeverageInput input) {
    if (input.salesVolume <= 0 ||
        input.salePrice <= 0 ||
        input.variableCost < 0 ||
        input.fixedCost < 0) {
      return 'validationNonNegativeNumbers';
    }

    final double contributionMargin =
        input.salesVolume * (input.salePrice - input.variableCost);
    final double denominator = contributionMargin - input.fixedCost;
    if (denominator <= 0) {
      return 'validationLeverageOperatingDenominator';
    }

    return null;
  }

  String? validateFinancial(FinancialLeverageInput input) {
    if (input.interest < 0 ||
        input.preferredDividends < 0 ||
        input.earningsBeforeInterestAndTaxes <= 0) {
      return 'validationNonNegativeNumbers';
    }

    if (input.taxRate < 0 || input.taxRate >= 100) {
      return 'validationTaxRateRange';
    }

    final double denominator =
        input.earningsBeforeInterestAndTaxes -
        input.interest -
        (input.preferredDividends * (1 / (1 - (input.taxRate / 100))));
    if (denominator <= 0) {
      return 'validationLeverageFinancialDenominator';
    }

    return null;
  }
}
