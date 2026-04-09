class BondCalculatorDraft {
  const BondCalculatorDraft({
    this.annualInterest,
    this.yearsToMaturity,
    this.parValue,
    this.requiredReturn,
  });

  final double? annualInterest;
  final int? yearsToMaturity;
  final double? parValue;
  final double? requiredReturn;

  bool get hasAnyValue =>
      annualInterest != null ||
      yearsToMaturity != null ||
      parValue != null ||
      requiredReturn != null;

  bool get isComplete =>
      annualInterest != null &&
      yearsToMaturity != null &&
      parValue != null &&
      requiredReturn != null;

  double? get couponRate {
    if (annualInterest == null || parValue == null || parValue == 0) {
      return null;
    }

    return (annualInterest! / parValue!) * 100;
  }
}
