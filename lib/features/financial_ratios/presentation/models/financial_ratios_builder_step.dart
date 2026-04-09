enum FinancialRatiosBuilderStep {
  incomeStatement('income_statement'),
  balanceSheet('balance_sheet'),
  results('results');

  const FinancialRatiosBuilderStep(this.id);

  final String id;
}
