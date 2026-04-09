import 'package:finance_pro/features/bonds/presentation/mappers/bond_calculator_input_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const BondCalculatorInputMapper mapper = BondCalculatorInputMapper();

  test('BondCalculatorInputMapper parses a complete draft into input', () {
    final mapped = mapper.toInput(<String, String>{
      'annualInterest': '80',
      'yearsToMaturity': '5',
      'parValue': '1000',
      'requiredReturn': '10',
    });

    expect(mapped.validationKey, isNull);
    expect(mapped.input, isNotNull);
    expect(mapped.input!.annualInterest, 80);
    expect(mapped.input!.yearsToMaturity, 5);
    expect(mapped.input!.parValue, 1000);
    expect(mapped.input!.requiredReturn, 10);
  });

  test('BondCalculatorInputMapper requires whole years to maturity', () {
    final mapped = mapper.toInput(<String, String>{
      'annualInterest': '80',
      'yearsToMaturity': '2.5',
      'parValue': '1000',
      'requiredReturn': '10',
    });

    expect(mapped.input, isNull);
    expect(mapped.validationKey, 'validationWholeYearsRequired');
  });

  test('BondCalculatorInputMapper flags missing positive values', () {
    final mapped = mapper.toInput(<String, String>{
      'annualInterest': '0',
      'yearsToMaturity': '5',
      'parValue': '1000',
      'requiredReturn': '10',
    });

    expect(mapped.input, isNull);
    expect(mapped.validationKey, 'validationPositiveNumbers');
  });
}
