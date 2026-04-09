class ShareCalculatorDraft {
  const ShareCalculatorDraft({
    this.dividend,
    this.initialGrowthRate,
    this.periods,
    this.requiredReturn,
    this.terminalGrowthRate,
  });

  final double? dividend;
  final double? initialGrowthRate;
  final int? periods;
  final double? requiredReturn;
  final double? terminalGrowthRate;

  bool get hasAnyValue =>
      dividend != null ||
      initialGrowthRate != null ||
      periods != null ||
      requiredReturn != null ||
      terminalGrowthRate != null;
}
