import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';

class CalculateOperatingLeverage {
  const CalculateOperatingLeverage();

  LeverageResult call(OperatingLeverageInput input) {
    final double numerator =
        input.salesVolume * (input.salePrice - input.variableCost);
    final double denominator = numerator - input.fixedCost;
    if (denominator <= 0 || !denominator.isFinite) {
      throw ArgumentError.value(
        denominator,
        'denominator',
        'Operating leverage requires a positive EBIT base.',
      );
    }

    return LeverageResult(degree: numerator / denominator);
  }
}
