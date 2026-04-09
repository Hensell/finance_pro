import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:finance_pro/features/leverage/domain/usecases/calculate_financial_leverage.dart';
import 'package:finance_pro/features/leverage/domain/usecases/calculate_operating_leverage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CalculateOperatingLeverage returns expected degree', () {
    const CalculateOperatingLeverage useCase = CalculateOperatingLeverage();

    final LeverageResult result = useCase(
      const OperatingLeverageInput(
        salesVolume: 1200,
        salePrice: 30,
        variableCost: 18,
        fixedCost: 9000,
      ),
    );

    expect(result.degree, closeTo(2.67, 0.05));
  });

  test('CalculateOperatingLeverage throws when EBIT base is not positive', () {
    const CalculateOperatingLeverage useCase = CalculateOperatingLeverage();

    expect(
      () => useCase(
        const OperatingLeverageInput(
          salesVolume: 100,
          salePrice: 10,
          variableCost: 8,
          fixedCost: 300,
        ),
      ),
      throwsArgumentError,
    );
  });

  test('CalculateFinancialLeverage returns expected degree', () {
    const CalculateFinancialLeverage useCase = CalculateFinancialLeverage();

    final LeverageResult result = useCase(
      const FinancialLeverageInput(
        interest: 2000,
        preferredDividends: 2400,
        taxRate: 40,
        earningsBeforeInterestAndTaxes: 10000,
      ),
    );

    expect(result.degree, closeTo(2.5, 0.05));
  });

  test(
    'CalculateFinancialLeverage throws when common-shareholder base is not positive',
    () {
      const CalculateFinancialLeverage useCase = CalculateFinancialLeverage();

      expect(
        () => useCase(
          const FinancialLeverageInput(
            interest: 4000,
            preferredDividends: 3000,
            taxRate: 40,
            earningsBeforeInterestAndTaxes: 7000,
          ),
        ),
        throwsArgumentError,
      );
    },
  );
}
