import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:finance_pro/features/leverage/presentation/models/leverage_calculator_draft.dart';

enum LeverageSensitivity { measured, elevated, high }

class LeverageCalculationInsight {
  const LeverageCalculationInsight({
    required this.mode,
    required this.primaryMetric,
    required this.secondaryMetric,
    required this.sensitivity,
  });

  final LeverageMode mode;
  final double primaryMetric;
  final double secondaryMetric;
  final LeverageSensitivity sensitivity;
}

class LeverageCalculatorLearningPresenter {
  const LeverageCalculatorLearningPresenter();

  LeverageCalculationInsight? buildInsight({
    required LeverageMode mode,
    required LeverageCalculatorDraft draft,
    required LeverageResult? result,
  }) {
    if (result == null) {
      return null;
    }

    switch (mode) {
      case LeverageMode.operating:
        final double? contributionMargin = draft.contributionMarginTotal;
        final double? ebit = draft.operatingBase;
        if (contributionMargin == null || ebit == null) {
          return null;
        }

        return LeverageCalculationInsight(
          mode: LeverageMode.operating,
          primaryMetric: contributionMargin,
          secondaryMetric: ebit,
          sensitivity: _resolveSensitivity(result.degree),
        );
      case LeverageMode.financial:
        final double? commonBase = draft.financialBase;
        final double? adjustedPreferred = draft.taxAdjustedPreferredDividends;
        if (commonBase == null || adjustedPreferred == null) {
          return null;
        }

        return LeverageCalculationInsight(
          mode: LeverageMode.financial,
          primaryMetric: commonBase,
          secondaryMetric: adjustedPreferred,
          sensitivity: _resolveSensitivity(result.degree),
        );
    }
  }

  String buildLiveFormulaTex({
    required LeverageMode mode,
    required LeverageCalculatorDraft draft,
  }) {
    switch (mode) {
      case LeverageMode.operating:
        return _buildOperatingTex(draft);
      case LeverageMode.financial:
        return _buildFinancialTex(draft);
    }
  }

  String _buildOperatingTex(LeverageCalculatorDraft draft) {
    final String quantity = _valueOrPlaceholder(draft.salesVolume);
    final String salePrice = _valueOrPlaceholder(draft.salePrice);
    final String variableCost = _valueOrPlaceholder(draft.variableCost);
    final String fixedCost = _valueOrPlaceholder(draft.fixedCost);

    final StringBuffer buffer = StringBuffer()
      ..write(
        'Q = $quantity,\\quad P = $salePrice,\\quad CV = $variableCost,\\quad CF = $fixedCost \\\\ ',
      )
      ..write(
        'GAO = \\frac{$quantity($salePrice-$variableCost)}{$quantity($salePrice-$variableCost)-$fixedCost}',
      );

    final double? contributionMargin = draft.contributionMarginTotal;
    final double? ebit = draft.operatingBase;
    if (contributionMargin != null && ebit != null) {
      buffer.write(
        ' = \\frac{${_formatNumber(contributionMargin)}}{${_formatNumber(ebit)}}',
      );
    }

    return buffer.toString();
  }

  String _buildFinancialTex(LeverageCalculatorDraft draft) {
    final String ebit = _valueOrPlaceholder(
      draft.earningsBeforeInterestAndTaxes,
    );
    final String interest = _valueOrPlaceholder(draft.interest);
    final String preferredDividends = _valueOrPlaceholder(
      draft.preferredDividends,
    );
    final String taxRate = draft.taxRateDecimal == null
        ? r'\text{?}'
        : _formatNumber(draft.taxRateDecimal!);

    final StringBuffer buffer = StringBuffer()
      ..write(
        'UAII = $ebit,\\quad I = $interest,\\quad DP = $preferredDividends,\\quad T = $taxRate \\\\ ',
      )
      ..write(
        'GAF = \\frac{$ebit}{$ebit-$interest-$preferredDividends\\left(\\frac{1}{1-$taxRate}\\right)}',
      );

    final double? commonBase = draft.financialBase;
    if (commonBase != null) {
      buffer.write(' = \\frac{$ebit}{${_formatNumber(commonBase)}}');
    }

    return buffer.toString();
  }

  LeverageSensitivity _resolveSensitivity(double degree) {
    if (degree >= 3) {
      return LeverageSensitivity.high;
    }

    if (degree >= 1.5) {
      return LeverageSensitivity.elevated;
    }

    return LeverageSensitivity.measured;
  }

  String _formatNumber(double value) {
    final String fixed = value.toStringAsFixed(4);
    return fixed
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }

  String _valueOrPlaceholder(double? value) {
    if (value == null) {
      return r'\text{?}';
    }

    return _formatNumber(value);
  }
}
