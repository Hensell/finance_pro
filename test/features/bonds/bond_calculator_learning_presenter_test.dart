import 'package:finance_pro/features/bonds/domain/entities/bond_calculator_models.dart';
import 'package:finance_pro/features/bonds/presentation/models/bond_calculator_draft.dart';
import 'package:finance_pro/features/bonds/presentation/presenters/bond_calculator_learning_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const BondCalculatorLearningPresenter presenter =
      BondCalculatorLearningPresenter();

  test('buildLiveFormulaTex substitutes current bond values', () {
    const BondCalculatorDraft draft = BondCalculatorDraft(
      annualInterest: 80,
      yearsToMaturity: 5,
      parValue: 1000,
      requiredReturn: 10,
    );

    final String tex = presenter.buildLiveFormulaTex(draft);

    expect(tex, contains('I = 80'));
    expect(tex, contains('N = 5'));
    expect(tex, contains('M = 1000'));
    expect(tex, contains('k_d = 0.1'));
    expect(tex, contains(r'B_0 = 80\sum_{t=1}^{5}'));
  });

  test('buildInsight classifies discount bonds correctly', () {
    final BondPriceInsight? insight = presenter.buildInsight(
      draft: const BondCalculatorDraft(
        annualInterest: 80,
        yearsToMaturity: 5,
        parValue: 1000,
        requiredReturn: 10,
      ),
      result: const BondCalculatorResult(presentValue: 924.18),
    );

    expect(insight, isNotNull);
    expect(insight!.position, BondPricePosition.discount);
    expect(insight.couponRate, closeTo(8, 0.01));
  });

  test('buildInsight classifies premium bonds correctly', () {
    final BondPriceInsight? insight = presenter.buildInsight(
      draft: const BondCalculatorDraft(
        annualInterest: 120,
        yearsToMaturity: 5,
        parValue: 1000,
        requiredReturn: 10,
      ),
      result: const BondCalculatorResult(presentValue: 1075),
    );

    expect(insight, isNotNull);
    expect(insight!.position, BondPricePosition.premium);
    expect(insight.couponRate, closeTo(12, 0.01));
  });
}
