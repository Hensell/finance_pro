import 'package:finance_pro/features/lease/presentation/mappers/lease_calculator_input_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const LeaseCalculatorInputMapper mapper = LeaseCalculatorInputMapper();

  test('LeaseCalculatorInputMapper parses a complete draft into input', () {
    final mapped = mapper.toInput(<String, String>{
      'leasePayment': '450',
      'periods': '4',
      'discountRate': '11',
      'purchasePrice': '1450',
      'residualValue': '300',
    });

    expect(mapped.validationKey, isNull);
    expect(mapped.input, isNotNull);
    expect(mapped.input!.leasePayment, 450);
    expect(mapped.input!.periods, 4);
    expect(mapped.input!.discountRate, 11);
    expect(mapped.input!.purchasePrice, 1450);
    expect(mapped.input!.residualValue, 300);
  });

  test('LeaseCalculatorInputMapper requires whole positive periods', () {
    final mapped = mapper.toInput(<String, String>{
      'leasePayment': '450',
      'periods': '4.5',
      'discountRate': '11',
      'purchasePrice': '1450',
      'residualValue': '300',
    });

    expect(mapped.input, isNull);
    expect(mapped.validationKey, 'validationLeasePeriodsRequired');
  });

  test('LeaseCalculatorInputMapper flags invalid required fields', () {
    final mapped = mapper.toInput(<String, String>{
      'leasePayment': '0',
      'periods': '4',
      'discountRate': '11',
      'purchasePrice': '1450',
      'residualValue': '300',
    });

    expect(mapped.input, isNull);
    expect(mapped.validationKey, 'validationLeaseRequiredFields');
  });
}
