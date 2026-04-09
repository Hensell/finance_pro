import 'package:finance_pro/features/bonds/domain/entities/bond_calculator_models.dart';
import 'package:finance_pro/features/bonds/domain/usecases/calculate_bond_value.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CalculateBondValue returns expected present value', () {
    const CalculateBondValue useCase = CalculateBondValue();

    final BondCalculatorResult result = useCase(
      const BondCalculatorInput(
        annualInterest: 80,
        yearsToMaturity: 5,
        parValue: 1000,
        requiredReturn: 10,
      ),
    );

    expect(result.presentValue, closeTo(924.18, 0.5));
  });

  test(
    'CalculateBondValue discounts coupon and principal across whole years',
    () {
      const CalculateBondValue useCase = CalculateBondValue();

      final BondCalculatorResult result = useCase(
        const BondCalculatorInput(
          annualInterest: 100,
          yearsToMaturity: 1,
          parValue: 1000,
          requiredReturn: 10,
        ),
      );

      expect(result.presentValue, closeTo(1000, 0.01));
    },
  );
}
