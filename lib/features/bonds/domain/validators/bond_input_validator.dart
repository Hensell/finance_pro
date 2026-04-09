import 'package:finance_pro/features/bonds/domain/entities/bond_calculator_models.dart';

class BondInputValidator {
  const BondInputValidator();

  String? validate(BondCalculatorInput input) {
    if (input.annualInterest <= 0 ||
        input.yearsToMaturity <= 0 ||
        input.parValue <= 0 ||
        input.requiredReturn <= 0) {
      return 'validationPositiveNumbers';
    }

    return null;
  }
}
