import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/domain/validators/share_input_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ShareInputValidator validator = ShareInputValidator();

  test('constant growth requires growth below required return', () {
    final String? validationKey = validator.validate(
      mode: ShareCalculationMode.constantGrowth,
      input: const ShareCalculatorInput(
        dividend: 3,
        requiredReturn: 10,
        initialGrowthRate: 10,
        periods: 0,
        terminalGrowthRate: 0,
      ),
    );

    expect(validationKey, 'validationGrowthLessThanReturn');
  });

  test('variable growth allows initial growth above required return', () {
    final String? validationKey = validator.validate(
      mode: ShareCalculationMode.variableGrowth,
      input: const ShareCalculatorInput(
        dividend: 1.5,
        requiredReturn: 10,
        initialGrowthRate: 14,
        periods: 3,
        terminalGrowthRate: 4,
      ),
    );

    expect(validationKey, isNull);
  });

  test('variable growth still requires terminal growth below return', () {
    final String? validationKey = validator.validate(
      mode: ShareCalculationMode.variableGrowth,
      input: const ShareCalculatorInput(
        dividend: 1.5,
        requiredReturn: 10,
        initialGrowthRate: 14,
        periods: 3,
        terminalGrowthRate: 10,
      ),
    );

    expect(validationKey, 'validationGrowthLessThanReturn');
  });
}
