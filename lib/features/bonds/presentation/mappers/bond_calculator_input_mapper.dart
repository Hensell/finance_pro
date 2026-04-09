import 'package:finance_pro/core/utils/input_parsers.dart';
import 'package:finance_pro/features/bonds/domain/entities/bond_calculator_models.dart';
import 'package:finance_pro/features/bonds/presentation/models/bond_calculator_draft.dart';

class BondCalculatorInputMapper {
  const BondCalculatorInputMapper();

  ({BondCalculatorInput? input, String? validationKey}) toInput(
    Map<String, String> values,
  ) {
    final BondCalculatorDraft draft = toDraft(values);

    if (draft.annualInterest == null ||
        draft.parValue == null ||
        draft.requiredReturn == null) {
      return (input: null, validationKey: 'validationPositiveNumbers');
    }

    if (draft.yearsToMaturity == null) {
      return (input: null, validationKey: 'validationWholeYearsRequired');
    }

    return (
      input: BondCalculatorInput(
        annualInterest: draft.annualInterest!,
        yearsToMaturity: draft.yearsToMaturity!,
        parValue: draft.parValue!,
        requiredReturn: draft.requiredReturn!,
      ),
      validationKey: null,
    );
  }

  BondCalculatorDraft toDraft(Map<String, String> values) {
    return BondCalculatorDraft(
      annualInterest: parsePositiveNumber(values['annualInterest'] ?? ''),
      yearsToMaturity: parsePositiveInteger(values['yearsToMaturity'] ?? ''),
      parValue: parsePositiveNumber(values['parValue'] ?? ''),
      requiredReturn: parsePositiveNumber(values['requiredReturn'] ?? ''),
    );
  }
}
