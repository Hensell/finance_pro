import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';

class ShareInputValidator {
  const ShareInputValidator();

  String? validate({
    required ShareCalculationMode mode,
    required ShareCalculatorInput input,
  }) {
    if (input.dividend <= 0 || input.requiredReturn <= 0) {
      return 'validationPositiveNumbers';
    }

    if (input.initialGrowthRate < 0 || input.terminalGrowthRate < 0) {
      return 'validationNonNegativeNumbers';
    }

    switch (mode) {
      case ShareCalculationMode.zeroGrowth:
      case ShareCalculationMode.preferredShare:
        return null;
      case ShareCalculationMode.constantGrowth:
        if (input.initialGrowthRate >= input.requiredReturn) {
          return 'validationGrowthLessThanReturn';
        }
        return null;
      case ShareCalculationMode.variableGrowth:
        if (input.periods <= 0) {
          return 'validationPeriodsRequired';
        }
        if (input.terminalGrowthRate >= input.requiredReturn) {
          return 'validationGrowthLessThanReturn';
        }
        return null;
    }
  }
}
