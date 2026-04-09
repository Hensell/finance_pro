class LeaseCalculatorDraft {
  const LeaseCalculatorDraft({
    this.discountRate,
    this.leasePayment,
    this.periods,
    this.purchasePrice,
    this.residualValue,
  });

  final double? discountRate;
  final double? leasePayment;
  final int? periods;
  final double? purchasePrice;
  final double? residualValue;

  bool get isComplete =>
      discountRate != null &&
      leasePayment != null &&
      periods != null &&
      purchasePrice != null &&
      residualValue != null;

  double? get rateDecimal => discountRate == null ? null : discountRate! / 100;
}
