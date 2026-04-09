import 'package:finance_pro/features/lease/domain/usecases/calculate_lease_comparison.dart';
import 'package:finance_pro/features/lease/domain/validators/lease_input_validator.dart';
import 'package:finance_pro/features/lease/presentation/cubit/lease_calculator_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LeaseCalculatorCubit stores result after submit', () {
    final LeaseCalculatorCubit cubit = LeaseCalculatorCubit(
      calculateLeaseComparison: const CalculateLeaseComparison(),
      validator: const LeaseInputValidator(),
    );

    cubit.updateField('leasePayment', '450');
    cubit.updateField('periods', '4');
    cubit.updateField('discountRate', '11');
    cubit.updateField('purchasePrice', '1450');
    cubit.updateField('residualValue', '300');
    cubit.submit();

    expect(cubit.state.result, isNotNull);
    expect(cubit.state.validationKey, isNull);
    cubit.close();
  });

  test('LeaseCalculatorCubit clears stale result on input change', () {
    final LeaseCalculatorCubit cubit = LeaseCalculatorCubit(
      calculateLeaseComparison: const CalculateLeaseComparison(),
      validator: const LeaseInputValidator(),
    );

    cubit.updateField('leasePayment', '450');
    cubit.updateField('periods', '4');
    cubit.updateField('discountRate', '11');
    cubit.updateField('purchasePrice', '1450');
    cubit.updateField('residualValue', '300');
    cubit.submit();

    expect(cubit.state.result, isNotNull);

    cubit.updateField('discountRate', '12');

    expect(cubit.state.result, isNull);
    expect(cubit.state.validationKey, isNull);
    cubit.close();
  });

  test('LeaseCalculatorCubit validates integer periods and residual cap', () {
    final LeaseCalculatorCubit cubit = LeaseCalculatorCubit(
      calculateLeaseComparison: const CalculateLeaseComparison(),
      validator: const LeaseInputValidator(),
    );

    cubit.updateField('leasePayment', '450');
    cubit.updateField('periods', '4.5');
    cubit.updateField('discountRate', '11');
    cubit.updateField('purchasePrice', '1450');
    cubit.updateField('residualValue', '300');
    cubit.submit();

    expect(cubit.state.result, isNull);
    expect(cubit.state.validationKey, 'validationLeasePeriodsRequired');

    cubit.updateField('periods', '4');
    cubit.updateField('residualValue', '1600');
    cubit.submit();

    expect(cubit.state.result, isNull);
    expect(cubit.state.validationKey, 'validationLeaseResidualExceedsPrice');
    cubit.close();
  });
}
