import 'package:finance_pro/core/utils/input_parsers.dart';
import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/presentation/models/share_calculator_draft.dart';

class ShareCalculatorInputMapper {
  const ShareCalculatorInputMapper();

  ShareCalculatorDraft toDraft(Map<String, String> values) {
    return ShareCalculatorDraft(
      dividend: parsePositiveNumber(values['dividend'] ?? ''),
      initialGrowthRate: parseNonNegativeNumber(
        values['initialGrowthRate'] ?? '',
      ),
      periods: parsePositiveInteger(values['periods'] ?? ''),
      requiredReturn: parsePositiveNumber(values['requiredReturn'] ?? ''),
      terminalGrowthRate: parseNonNegativeNumber(
        values['terminalGrowthRate'] ?? '',
      ),
    );
  }

  ({ShareCalculatorInput? input, String? validationKey}) toInput({
    required ShareCalculationMode mode,
    required Map<String, String> values,
  }) {
    final ShareCalculatorDraft draft = toDraft(values);
    if (draft.dividend == null || draft.requiredReturn == null) {
      return (input: null, validationKey: 'validationPositiveNumbers');
    }

    switch (mode) {
      case ShareCalculationMode.zeroGrowth:
      case ShareCalculationMode.preferredShare:
        return (
          input: ShareCalculatorInput(
            dividend: draft.dividend!,
            requiredReturn: draft.requiredReturn!,
            initialGrowthRate: 0,
            periods: 0,
            terminalGrowthRate: 0,
          ),
          validationKey: null,
        );
      case ShareCalculationMode.constantGrowth:
        if (draft.initialGrowthRate == null) {
          return (input: null, validationKey: 'validationNonNegativeNumbers');
        }

        return (
          input: ShareCalculatorInput(
            dividend: draft.dividend!,
            requiredReturn: draft.requiredReturn!,
            initialGrowthRate: draft.initialGrowthRate!,
            periods: 0,
            terminalGrowthRate: 0,
          ),
          validationKey: null,
        );
      case ShareCalculationMode.variableGrowth:
        if (draft.initialGrowthRate == null ||
            draft.terminalGrowthRate == null) {
          return (input: null, validationKey: 'validationNonNegativeNumbers');
        }
        if (draft.periods == null) {
          return (input: null, validationKey: 'validationPeriodsRequired');
        }

        return (
          input: ShareCalculatorInput(
            dividend: draft.dividend!,
            requiredReturn: draft.requiredReturn!,
            initialGrowthRate: draft.initialGrowthRate!,
            periods: draft.periods!,
            terminalGrowthRate: draft.terminalGrowthRate!,
          ),
          validationKey: null,
        );
    }
  }
}
