import 'package:finance_pro/features/leverage/presentation/models/leverage_calculator_draft.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LeverageCalculatorDraft derives operating metrics', () {
    const LeverageCalculatorDraft draft = LeverageCalculatorDraft(
      salesVolume: 1200,
      salePrice: 30,
      variableCost: 18,
      fixedCost: 9000,
    );

    expect(draft.contributionMarginTotal, 14400);
    expect(draft.operatingBase, 5400);
  });

  test('LeverageCalculatorDraft derives financial metrics', () {
    const LeverageCalculatorDraft draft = LeverageCalculatorDraft(
      earningsBeforeInterestAndTaxes: 10000,
      interest: 2000,
      preferredDividends: 2400,
      taxRate: 40,
    );

    expect(draft.taxRateDecimal, closeTo(0.4, 0.0001));
    expect(draft.taxAdjustedPreferredDividends, closeTo(4000, 0.01));
    expect(draft.financialBase, closeTo(4000, 0.01));
  });
}
