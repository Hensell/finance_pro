import 'package:finance_pro/features/bonds/domain/usecases/calculate_bond_value.dart';
import 'package:finance_pro/features/bonds/domain/validators/bond_input_validator.dart';
import 'package:finance_pro/features/bonds/presentation/cubit/bond_calculator_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BondCalculatorCubit stores result after submit', () {
    final BondCalculatorCubit cubit = BondCalculatorCubit(
      calculateBondValue: const CalculateBondValue(),
      validator: const BondInputValidator(),
    );

    cubit.updateField('annualInterest', '80');
    cubit.updateField('yearsToMaturity', '5');
    cubit.updateField('parValue', '1000');
    cubit.updateField('requiredReturn', '10');
    cubit.submit();

    expect(cubit.state.result, isNotNull);
    expect(cubit.state.validationKey, isNull);
    cubit.close();
  });

  test('BondCalculatorCubit clears stale result when any field changes', () {
    final BondCalculatorCubit cubit = BondCalculatorCubit(
      calculateBondValue: const CalculateBondValue(),
      validator: const BondInputValidator(),
    );

    cubit.updateField('annualInterest', '80');
    cubit.updateField('yearsToMaturity', '5');
    cubit.updateField('parValue', '1000');
    cubit.updateField('requiredReturn', '10');
    cubit.submit();

    expect(cubit.state.result, isNotNull);

    cubit.updateField('requiredReturn', '11');

    expect(cubit.state.result, isNull);
    expect(cubit.state.validationKey, isNull);
    cubit.close();
  });

  test(
    'BondCalculatorCubit rejects fractional maturity and clears stale result',
    () {
      final BondCalculatorCubit cubit = BondCalculatorCubit(
        calculateBondValue: const CalculateBondValue(),
        validator: const BondInputValidator(),
      );

      cubit.updateField('annualInterest', '80');
      cubit.updateField('yearsToMaturity', '5');
      cubit.updateField('parValue', '1000');
      cubit.updateField('requiredReturn', '10');
      cubit.submit();

      expect(cubit.state.result, isNotNull);

      cubit.updateField('yearsToMaturity', '2.5');
      cubit.submit();

      expect(cubit.state.result, isNull);
      expect(cubit.state.validationKey, 'validationWholeYearsRequired');
      cubit.close();
    },
  );
}
