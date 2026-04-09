import 'package:finance_pro/features/lease/domain/entities/lease_calculator_models.dart';
import 'package:finance_pro/features/lease/domain/usecases/calculate_lease_comparison.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'CalculateLeaseComparison returns present values for both alternatives',
    () {
      const CalculateLeaseComparison useCase = CalculateLeaseComparison();

      final LeaseComparisonResult result = useCase(
        const LeaseComparisonInput(
          discountRate: 11,
          leasePayment: 450,
          periods: 4,
          purchasePrice: 1450,
          residualValue: 300,
        ),
      );

      expect(result.leasePresentValue, closeTo(1396.10, 0.2));
      expect(result.discountedResidualValue, closeTo(197.62, 0.2));
      expect(result.purchaseNetCost, closeTo(1252.38, 0.2));
      expect(result.difference, closeTo(-143.72, 0.2));
    },
  );

  test('CalculateLeaseComparison handles zero discount rate', () {
    const CalculateLeaseComparison useCase = CalculateLeaseComparison();

    final LeaseComparisonResult result = useCase(
      const LeaseComparisonInput(
        discountRate: 0,
        leasePayment: 100,
        periods: 3,
        purchasePrice: 260,
        residualValue: 50,
      ),
    );

    expect(result.leasePresentValue, 300);
    expect(result.discountedResidualValue, 50);
    expect(result.purchaseNetCost, 210);
    expect(result.difference, -90);
  });
}
