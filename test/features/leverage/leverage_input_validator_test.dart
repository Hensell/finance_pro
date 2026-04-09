import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:finance_pro/features/leverage/domain/validators/leverage_input_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const LeverageInputValidator validator = LeverageInputValidator();

  test('validateOperating rejects non-positive EBIT base', () {
    final String? result = validator.validateOperating(
      const OperatingLeverageInput(
        salesVolume: 100,
        salePrice: 10,
        variableCost: 8,
        fixedCost: 300,
      ),
    );

    expect(result, 'validationLeverageOperatingDenominator');
  });

  test('validateFinancial rejects 100 percent tax rate', () {
    final String? result = validator.validateFinancial(
      const FinancialLeverageInput(
        interest: 1000,
        preferredDividends: 500,
        taxRate: 100,
        earningsBeforeInterestAndTaxes: 8000,
      ),
    );

    expect(result, 'validationTaxRateRange');
  });

  test('validateFinancial rejects non-positive common-shareholder base', () {
    final String? result = validator.validateFinancial(
      const FinancialLeverageInput(
        interest: 3500,
        preferredDividends: 2400,
        taxRate: 40,
        earningsBeforeInterestAndTaxes: 7000,
      ),
    );

    expect(result, 'validationLeverageFinancialDenominator');
  });
}
