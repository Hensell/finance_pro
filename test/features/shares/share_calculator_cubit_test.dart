import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/domain/usecases/calculate_share_valuation.dart';
import 'package:finance_pro/features/shares/domain/validators/share_input_validator.dart';
import 'package:finance_pro/features/shares/presentation/cubit/share_calculator_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ShareCalculatorCubit createCubit() {
    return ShareCalculatorCubit(
      calculateShareValuation: const CalculateShareValuation(),
      validator: const ShareInputValidator(),
    );
  }

  test('ShareCalculatorCubit stores result after zero-growth submit', () {
    final ShareCalculatorCubit cubit = createCubit();
    addTearDown(cubit.close);

    cubit.updateField('dividend', '3');
    cubit.updateField('requiredReturn', '15');
    cubit.submit();

    expect(cubit.state.result, isNotNull);
    expect(cubit.state.result!.presentValue, closeTo(20, 0.01));
    expect(cubit.state.validationKey, isNull);
  });

  test('ShareCalculatorCubit clears stale result when switching mode', () {
    final ShareCalculatorCubit cubit = createCubit();
    addTearDown(cubit.close);

    cubit.updateField('dividend', '3');
    cubit.updateField('requiredReturn', '15');
    cubit.submit();
    expect(cubit.state.result, isNotNull);

    cubit.selectMode(ShareCalculationMode.constantGrowth);

    expect(cubit.state.mode, ShareCalculationMode.constantGrowth);
    expect(cubit.state.result, isNull);
    expect(cubit.state.validationKey, isNull);
  });

  test(
    'ShareCalculatorCubit reports validation failures for invalid spreads',
    () {
      final ShareCalculatorCubit cubit = createCubit();
      addTearDown(cubit.close);

      cubit.selectMode(ShareCalculationMode.constantGrowth);
      cubit.updateField('dividend', '3');
      cubit.updateField('requiredReturn', '10');
      cubit.updateField('initialGrowthRate', '10');
      cubit.submit();

      expect(cubit.state.result, isNull);
      expect(cubit.state.validationKey, 'validationGrowthLessThanReturn');
    },
  );

  test('ShareCalculatorCubit clears stale result when any field changes', () {
    final ShareCalculatorCubit cubit = createCubit();
    addTearDown(cubit.close);

    cubit.updateField('dividend', '3');
    cubit.updateField('requiredReturn', '15');
    cubit.submit();
    expect(cubit.state.result, isNotNull);

    cubit.updateField('dividend', '4');

    expect(cubit.state.result, isNull);
    expect(cubit.state.validationKey, isNull);
  });
}
