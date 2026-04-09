import 'package:finance_pro/features/lease/domain/entities/lease_calculator_models.dart';
import 'package:finance_pro/features/lease/domain/validators/lease_input_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const LeaseInputValidator validator = LeaseInputValidator();

  test('validator rejects residual value above purchase price', () {
    final String? validationKey = validator.validate(
      const LeaseComparisonInput(
        discountRate: 10,
        leasePayment: 120,
        periods: 5,
        purchasePrice: 800,
        residualValue: 900,
      ),
    );

    expect(validationKey, 'validationLeaseResidualExceedsPrice');
  });

  test('validator accepts consistent base case', () {
    final String? validationKey = validator.validate(
      const LeaseComparisonInput(
        discountRate: 10,
        leasePayment: 120,
        periods: 5,
        purchasePrice: 800,
        residualValue: 200,
      ),
    );

    expect(validationKey, isNull);
  });
}
