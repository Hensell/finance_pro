import 'package:finance_pro/features/bonds/domain/entities/bond_calculator_models.dart';
import 'package:finance_pro/features/bonds/domain/validators/bond_input_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const BondInputValidator validator = BondInputValidator();

  test('BondInputValidator rejects non-positive inputs', () {
    final String? validationKey = validator.validate(
      const BondCalculatorInput(
        annualInterest: 80,
        yearsToMaturity: 5,
        parValue: 0,
        requiredReturn: 10,
      ),
    );

    expect(validationKey, 'validationPositiveNumbers');
  });

  test('BondInputValidator accepts a consistent bond input', () {
    final String? validationKey = validator.validate(
      const BondCalculatorInput(
        annualInterest: 80,
        yearsToMaturity: 5,
        parValue: 1000,
        requiredReturn: 10,
      ),
    );

    expect(validationKey, isNull);
  });
}
