import 'package:finance_pro/features/lease/domain/entities/lease_calculator_models.dart';
import 'package:finance_pro/features/lease/presentation/models/lease_calculator_draft.dart';
import 'package:finance_pro/features/lease/presentation/presenters/lease_calculator_learning_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const LeaseCalculatorLearningPresenter presenter =
      LeaseCalculatorLearningPresenter();

  test('buildLiveFormulaTex substitutes current lease values', () {
    const LeaseCalculatorDraft draft = LeaseCalculatorDraft(
      leasePayment: 450,
      periods: 4,
      discountRate: 11,
      purchasePrice: 1450,
      residualValue: 300,
    );

    final String tex = presenter.buildLiveFormulaTex(draft);

    expect(tex, contains(r'Pago = 450'));
    expect(tex, contains(r'P_0 = 1450'));
    expect(tex, contains(r'VR = 300'));
    expect(tex, contains(r'k = 0.11'));
    expect(tex, contains(r'\Delta = VP_{buy} - VP_{lease}'));
  });

  test('buildInsight recommends leasing when difference is positive', () {
    final LeaseComparisonInsight? insight = presenter.buildInsight(
      draft: const LeaseCalculatorDraft(
        leasePayment: 200,
        periods: 4,
        discountRate: 10,
        purchasePrice: 1200,
        residualValue: 200,
      ),
      result: const LeaseComparisonResult(
        difference: 150,
        discountedResidualValue: 136,
        leasePresentValue: 800,
        purchaseNetCost: 950,
      ),
    );

    expect(insight, isNotNull);
    expect(insight!.decision, LeaseDecision.lease);
    expect(insight.savings, 150);
  });

  test('buildInsight returns neutral when the gap is within tolerance', () {
    final LeaseComparisonInsight? insight = presenter.buildInsight(
      draft: const LeaseCalculatorDraft(
        leasePayment: 300,
        periods: 4,
        discountRate: 10,
        purchasePrice: 1200,
        residualValue: 200,
      ),
      result: const LeaseComparisonResult(
        difference: 8,
        discountedResidualValue: 136,
        leasePresentValue: 900,
        purchaseNetCost: 908,
      ),
    );

    expect(insight, isNotNull);
    expect(insight!.decision, LeaseDecision.neutral);
  });
}
