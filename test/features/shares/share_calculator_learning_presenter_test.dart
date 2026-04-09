import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/presentation/models/share_calculator_draft.dart';
import 'package:finance_pro/features/shares/presentation/presenters/share_calculator_learning_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ShareCalculatorLearningPresenter presenter =
      ShareCalculatorLearningPresenter();

  test('buildLiveFormulaTex adapts to constant growth inputs', () {
    const ShareCalculatorDraft draft = ShareCalculatorDraft(
      dividend: 3,
      requiredReturn: 15,
      initialGrowthRate: 5,
    );

    final String tex = presenter.buildLiveFormulaTex(
      mode: ShareCalculationMode.constantGrowth,
      draft: draft,
    );

    expect(tex, contains(r'D_1 = 3'));
    expect(tex, contains(r'k_s = 0.15'));
    expect(tex, contains(r'g = 0.05'));
    expect(tex, contains(r'P_0 = \frac{3}{0.15-0.05}'));
  });

  test('buildInsight reports terminal weight for variable growth', () {
    final ShareCalculationInsight? insight = presenter.buildInsight(
      mode: ShareCalculationMode.variableGrowth,
      draft: const ShareCalculatorDraft(
        dividend: 1.5,
        requiredReturn: 15,
        initialGrowthRate: 10,
        periods: 3,
        terminalGrowthRate: 5,
      ),
      result: const ShareCalculatorResult(
        mode: ShareCalculationMode.variableGrowth,
        presentValue: 20,
        terminalPresentValue: 12,
      ),
    );

    expect(insight, isNotNull);
    expect(insight!.dividendBasis, 'D₀');
    expect(insight.growthSpread, closeTo(10, 0.01));
    expect(insight.terminalWeight, closeTo(60, 0.01));
  });
}
