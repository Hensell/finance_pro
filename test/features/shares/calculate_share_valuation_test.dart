import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/domain/usecases/calculate_share_valuation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CalculateShareValuation supports zero growth', () {
    const CalculateShareValuation useCase = CalculateShareValuation();

    final ShareCalculatorResult result = useCase(
      mode: ShareCalculationMode.zeroGrowth,
      input: const ShareCalculatorInput(
        dividend: 3,
        requiredReturn: 15,
        initialGrowthRate: 0,
        periods: 0,
        terminalGrowthRate: 0,
      ),
    );

    expect(result.presentValue, closeTo(20, 0.01));
  });

  test('CalculateShareValuation supports constant growth', () {
    const CalculateShareValuation useCase = CalculateShareValuation();

    final ShareCalculatorResult result = useCase(
      mode: ShareCalculationMode.constantGrowth,
      input: const ShareCalculatorInput(
        dividend: 3,
        requiredReturn: 15,
        initialGrowthRate: 5,
        periods: 0,
        terminalGrowthRate: 0,
      ),
    );

    expect(result.presentValue, closeTo(30, 0.01));
  });

  test('CalculateShareValuation supports preferred shares', () {
    const CalculateShareValuation useCase = CalculateShareValuation();

    final ShareCalculatorResult result = useCase(
      mode: ShareCalculationMode.preferredShare,
      input: const ShareCalculatorInput(
        dividend: 8,
        requiredReturn: 12,
        initialGrowthRate: 0,
        periods: 0,
        terminalGrowthRate: 0,
      ),
    );

    expect(result.presentValue, closeTo(66.67, 0.01));
  });

  test(
    'CalculateShareValuation returns terminal values for variable growth',
    () {
      const CalculateShareValuation useCase = CalculateShareValuation();

      final ShareCalculatorResult result = useCase(
        mode: ShareCalculationMode.variableGrowth,
        input: const ShareCalculatorInput(
          dividend: 1.5,
          requiredReturn: 15,
          initialGrowthRate: 10,
          periods: 3,
          terminalGrowthRate: 5,
        ),
      );

      expect(result.projectionRows, hasLength(3));
      expect(result.terminalPrice, isNotNull);
      expect(result.presentValue, greaterThan(0));
    },
  );
}
