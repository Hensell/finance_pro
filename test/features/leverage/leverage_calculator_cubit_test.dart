import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:finance_pro/features/leverage/domain/usecases/calculate_financial_leverage.dart';
import 'package:finance_pro/features/leverage/domain/usecases/calculate_operating_leverage.dart';
import 'package:finance_pro/features/leverage/domain/validators/leverage_input_validator.dart';
import 'package:finance_pro/features/leverage/presentation/cubit/leverage_calculator_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  LeverageCalculatorCubit createCubit() {
    return LeverageCalculatorCubit(
      calculateFinancialLeverage: const CalculateFinancialLeverage(),
      calculateOperatingLeverage: const CalculateOperatingLeverage(),
      validator: const LeverageInputValidator(),
    );
  }

  test('LeverageCalculatorCubit stores operating result after submit', () {
    final LeverageCalculatorCubit cubit = createCubit();
    addTearDown(cubit.close);

    cubit.updateField('salesVolume', '1200');
    cubit.updateField('salePrice', '30');
    cubit.updateField('variableCost', '18');
    cubit.updateField('fixedCost', '9000');
    cubit.submit();

    expect(cubit.state.result, isNotNull);
    expect(cubit.state.result!.degree, closeTo(2.67, 0.05));
    expect(cubit.state.validationKey, isNull);
  });

  test('LeverageCalculatorCubit clears stale result when switching mode', () {
    final LeverageCalculatorCubit cubit = createCubit();
    addTearDown(cubit.close);

    cubit.updateField('salesVolume', '1200');
    cubit.updateField('salePrice', '30');
    cubit.updateField('variableCost', '18');
    cubit.updateField('fixedCost', '9000');
    cubit.submit();
    expect(cubit.state.result, isNotNull);

    cubit.selectMode(LeverageMode.financial);

    expect(cubit.state.mode, LeverageMode.financial);
    expect(cubit.state.result, isNull);
    expect(cubit.state.validationKey, isNull);
  });

  test('LeverageCalculatorCubit reports financial validation failures', () {
    final LeverageCalculatorCubit cubit = createCubit();
    addTearDown(cubit.close);

    cubit.selectMode(LeverageMode.financial);
    cubit.updateField('earningsBeforeInterestAndTaxes', '10000');
    cubit.updateField('interest', '2000');
    cubit.updateField('preferredDividends', '2400');
    cubit.updateField('taxRate', '100');
    cubit.submit();

    expect(cubit.state.result, isNull);
    expect(cubit.state.validationKey, 'validationTaxRateRange');
  });

  test('LeverageCalculatorCubit clears stale result after editing', () {
    final LeverageCalculatorCubit cubit = createCubit();
    addTearDown(cubit.close);

    cubit.updateField('salesVolume', '1200');
    cubit.updateField('salePrice', '30');
    cubit.updateField('variableCost', '18');
    cubit.updateField('fixedCost', '9000');
    cubit.submit();
    expect(cubit.state.result, isNotNull);

    cubit.updateField('fixedCost', '9500');

    expect(cubit.state.result, isNull);
    expect(cubit.state.validationKey, isNull);
  });
}
