import 'dart:math';

import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';

class CalculateShareValuation {
  const CalculateShareValuation();

  ShareCalculatorResult call({
    required ShareCalculationMode mode,
    required ShareCalculatorInput input,
  }) {
    switch (mode) {
      case ShareCalculationMode.zeroGrowth:
      case ShareCalculationMode.preferredShare:
        return ShareCalculatorResult(
          mode: mode,
          presentValue: input.dividend / (input.requiredReturn / 100),
        );
      case ShareCalculationMode.constantGrowth:
        return ShareCalculatorResult(
          mode: mode,
          presentValue: input.dividend /
              ((input.requiredReturn / 100) - (input.initialGrowthRate / 100)),
        );
      case ShareCalculationMode.variableGrowth:
        return _calculateVariableGrowth(input);
    }
  }

  ShareCalculatorResult _calculateVariableGrowth(ShareCalculatorInput input) {
    final List<ShareProjectionRow> rows = List<ShareProjectionRow>.generate(
      input.periods,
      (int index) {
        final int period = index + 1;
        final double growthFactor =
            pow(1 + input.initialGrowthRate / 100, period).toDouble();
        final double projectedDividend = input.dividend * growthFactor;
        final double discountFactor =
            pow(1 + input.requiredReturn / 100, period).toDouble();
        final double presentValue = projectedDividend / discountFactor;

        return ShareProjectionRow(
          period: period,
          dividendBase: input.dividend,
          growthFactor: growthFactor,
          projectedDividend: projectedDividend,
          discountFactor: discountFactor,
          presentValue: presentValue,
        );
      },
    );

    final double dividendSum = rows.fold<double>(
      0,
      (double previousValue, ShareProjectionRow row) =>
          previousValue + row.presentValue,
    );
    final double terminalDividend = rows.last.projectedDividend *
        (1 + input.terminalGrowthRate / 100);
    final double terminalPrice = terminalDividend /
        ((input.requiredReturn / 100) - (input.terminalGrowthRate / 100));
    final double terminalPresentValue =
        terminalPrice / pow(1 + input.requiredReturn / 100, input.periods);

    return ShareCalculatorResult(
      mode: ShareCalculationMode.variableGrowth,
      presentValue: dividendSum + terminalPresentValue,
      projectionRows: rows,
      terminalDividend: terminalDividend,
      terminalPrice: terminalPrice,
      terminalPresentValue: terminalPresentValue,
    );
  }
}
