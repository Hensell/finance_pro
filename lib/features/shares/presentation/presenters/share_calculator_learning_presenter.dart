import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/presentation/models/share_calculator_draft.dart';

class ShareCalculationInsight {
  const ShareCalculationInsight({
    required this.dividendBasis,
    required this.mode,
    this.growthSpread,
    this.periods,
    this.terminalWeight,
  });

  final String dividendBasis;
  final double? growthSpread;
  final ShareCalculationMode mode;
  final int? periods;
  final double? terminalWeight;
}

class ShareCalculatorLearningPresenter {
  const ShareCalculatorLearningPresenter();

  ShareCalculationInsight? buildInsight({
    required ShareCalculationMode mode,
    required ShareCalculatorDraft draft,
    required ShareCalculatorResult? result,
  }) {
    if (result == null ||
        draft.dividend == null ||
        draft.requiredReturn == null) {
      return null;
    }

    switch (mode) {
      case ShareCalculationMode.zeroGrowth:
        return const ShareCalculationInsight(
          mode: ShareCalculationMode.zeroGrowth,
          dividendBasis: 'D₁',
        );
      case ShareCalculationMode.preferredShare:
        return const ShareCalculationInsight(
          mode: ShareCalculationMode.preferredShare,
          dividendBasis: 'D',
        );
      case ShareCalculationMode.constantGrowth:
        if (draft.initialGrowthRate == null) {
          return null;
        }

        return ShareCalculationInsight(
          mode: ShareCalculationMode.constantGrowth,
          dividendBasis: 'D₁',
          growthSpread: draft.requiredReturn! - draft.initialGrowthRate!,
        );
      case ShareCalculationMode.variableGrowth:
        if (draft.terminalGrowthRate == null ||
            draft.periods == null ||
            result.terminalPresentValue == null ||
            result.presentValue == 0) {
          return null;
        }

        return ShareCalculationInsight(
          mode: ShareCalculationMode.variableGrowth,
          dividendBasis: 'D₀',
          growthSpread: draft.requiredReturn! - draft.terminalGrowthRate!,
          periods: draft.periods,
          terminalWeight:
              (result.terminalPresentValue! / result.presentValue) * 100,
        );
    }
  }

  String buildLiveFormulaTex({
    required ShareCalculationMode mode,
    required ShareCalculatorDraft draft,
  }) {
    final String dividend = _valueOrPlaceholder(
      draft.dividend == null ? null : _formatNumber(draft.dividend!),
    );
    final String requiredReturn = _valueOrPlaceholder(
      draft.requiredReturn == null
          ? null
          : _formatNumber(draft.requiredReturn! / 100),
    );
    final String initialGrowth = _valueOrPlaceholder(
      draft.initialGrowthRate == null
          ? null
          : _formatNumber(draft.initialGrowthRate! / 100),
    );
    final String terminalGrowth = _valueOrPlaceholder(
      draft.terminalGrowthRate == null
          ? null
          : _formatNumber(draft.terminalGrowthRate! / 100),
    );
    final String periods = draft.periods?.toString() ?? r'\text{?}';

    switch (mode) {
      case ShareCalculationMode.zeroGrowth:
        return 'D_1 = $dividend,\\quad k_s = $requiredReturn \\\\ '
            'P_0 = \\frac{$dividend}{$requiredReturn}';
      case ShareCalculationMode.preferredShare:
        return 'D = $dividend,\\quad k_s = $requiredReturn \\\\ '
            'P_0 = \\frac{$dividend}{$requiredReturn}';
      case ShareCalculationMode.constantGrowth:
        return 'D_1 = $dividend,\\quad k_s = $requiredReturn,\\quad g = $initialGrowth \\\\ '
            'P_0 = \\frac{$dividend}{$requiredReturn-$initialGrowth}';
      case ShareCalculationMode.variableGrowth:
        return 'D_0 = $dividend,\\quad g_1 = $initialGrowth,\\quad N = $periods,\\quad g_2 = $terminalGrowth,\\quad k_s = $requiredReturn \\\\ '
            'D_t = $dividend(1+$initialGrowth)^t,\\quad '
            'P_N = \\frac{D_{N+1}}{$requiredReturn-$terminalGrowth}';
    }
  }

  String _formatNumber(double value) {
    final String fixed = value.toStringAsFixed(4);
    return fixed
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }

  String _valueOrPlaceholder(String? value) {
    return value ?? r'\text{?}';
  }
}
