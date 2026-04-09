import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/presentation/mappers/share_calculator_input_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ShareCalculatorInputMapper mapper = ShareCalculatorInputMapper();

  test(
    'ShareCalculatorInputMapper builds zero-growth input from core fields',
    () {
      final mapped = mapper.toInput(
        mode: ShareCalculationMode.zeroGrowth,
        values: <String, String>{'dividend': '3', 'requiredReturn': '15'},
      );

      expect(mapped.validationKey, isNull);
      expect(mapped.input, isNotNull);
      expect(mapped.input!.dividend, 3);
      expect(mapped.input!.requiredReturn, 15);
      expect(mapped.input!.initialGrowthRate, 0);
      expect(mapped.input!.periods, 0);
    },
  );

  test(
    'ShareCalculatorInputMapper requires growth for constant-growth mode',
    () {
      final mapped = mapper.toInput(
        mode: ShareCalculationMode.constantGrowth,
        values: <String, String>{'dividend': '3', 'requiredReturn': '15'},
      );

      expect(mapped.input, isNull);
      expect(mapped.validationKey, 'validationNonNegativeNumbers');
    },
  );

  test('ShareCalculatorInputMapper requires periods for variable growth', () {
    final mapped = mapper.toInput(
      mode: ShareCalculationMode.variableGrowth,
      values: <String, String>{
        'dividend': '1.5',
        'requiredReturn': '15',
        'initialGrowthRate': '10',
        'terminalGrowthRate': '5',
      },
    );

    expect(mapped.input, isNull);
    expect(mapped.validationKey, 'validationPeriodsRequired');
  });
}
