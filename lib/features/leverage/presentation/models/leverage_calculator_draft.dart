class LeverageCalculatorDraft {
  const LeverageCalculatorDraft({
    this.salesVolume,
    this.salePrice,
    this.variableCost,
    this.fixedCost,
    this.interest,
    this.preferredDividends,
    this.taxRate,
    this.earningsBeforeInterestAndTaxes,
  });

  final double? earningsBeforeInterestAndTaxes;
  final double? fixedCost;
  final double? interest;
  final double? preferredDividends;
  final double? salePrice;
  final double? salesVolume;
  final double? taxRate;
  final double? variableCost;

  bool get hasAnyValue =>
      salesVolume != null ||
      salePrice != null ||
      variableCost != null ||
      fixedCost != null ||
      interest != null ||
      preferredDividends != null ||
      taxRate != null ||
      earningsBeforeInterestAndTaxes != null;

  double? get contributionMarginTotal {
    if (salesVolume == null || salePrice == null || variableCost == null) {
      return null;
    }

    return salesVolume! * (salePrice! - variableCost!);
  }

  double? get operatingBase {
    if (contributionMarginTotal == null || fixedCost == null) {
      return null;
    }

    return contributionMarginTotal! - fixedCost!;
  }

  double? get taxRateDecimal {
    if (taxRate == null) {
      return null;
    }

    return taxRate! / 100;
  }

  double? get taxAdjustedPreferredDividends {
    if (preferredDividends == null || taxRateDecimal == null) {
      return null;
    }

    final double denominator = 1 - taxRateDecimal!;
    if (denominator <= 0) {
      return null;
    }

    return preferredDividends! * (1 / denominator);
  }

  double? get financialBase {
    if (earningsBeforeInterestAndTaxes == null ||
        interest == null ||
        taxAdjustedPreferredDividends == null) {
      return null;
    }

    return earningsBeforeInterestAndTaxes! -
        interest! -
        taxAdjustedPreferredDividends!;
  }
}
