import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:finance_pro/features/leverage/presentation/models/leverage_calculator_draft.dart';
import 'package:finance_pro/features/leverage/presentation/presenters/leverage_calculator_learning_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const LeverageCalculatorLearningPresenter presenter =
      LeverageCalculatorLearningPresenter();

  test('buildLiveFormulaTex includes operating substitution values', () {
    final String formula = presenter.buildLiveFormulaTex(
      mode: LeverageMode.operating,
      draft: const LeverageCalculatorDraft(
        salesVolume: 1200,
        salePrice: 30,
        variableCost: 18,
        fixedCost: 9000,
      ),
    );

    expect(formula, contains(r'Q = 1200'));
    expect(formula, contains(r'\frac{1200(30-18)}{1200(30-18)-9000}'));
    expect(formula, contains(r'\frac{14400}{5400}'));
  });

  test('buildInsight categorizes financial sensitivity', () {
    final LeverageCalculationInsight? insight = presenter.buildInsight(
      mode: LeverageMode.financial,
      draft: const LeverageCalculatorDraft(
        earningsBeforeInterestAndTaxes: 10000,
        interest: 2000,
        preferredDividends: 2400,
        taxRate: 40,
      ),
      result: const LeverageResult(degree: 2.5),
    );

    expect(insight, isNotNull);
    expect(insight!.sensitivity, LeverageSensitivity.elevated);
    expect(insight.primaryMetric, closeTo(4000, 0.01));
    expect(insight.secondaryMetric, closeTo(4000, 0.01));
  });
}
