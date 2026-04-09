import 'package:finance_pro/core/utils/input_parsers.dart';
import 'package:finance_pro/features/lease/domain/entities/lease_calculator_models.dart';
import 'package:finance_pro/features/lease/presentation/models/lease_calculator_draft.dart';

class LeaseCalculatorInputMapper {
  const LeaseCalculatorInputMapper();

  LeaseCalculatorDraft toDraft(Map<String, String> values) {
    return LeaseCalculatorDraft(
      discountRate: parseNonNegativeNumber(values['discountRate'] ?? ''),
      leasePayment: parsePositiveNumber(values['leasePayment'] ?? ''),
      periods: parsePositiveInteger(values['periods'] ?? ''),
      purchasePrice: parsePositiveNumber(values['purchasePrice'] ?? ''),
      residualValue: parseNonNegativeNumber(values['residualValue'] ?? ''),
    );
  }

  ({LeaseComparisonInput? input, String? validationKey}) toInput(
    Map<String, String> values,
  ) {
    final LeaseCalculatorDraft draft = toDraft(values);

    if (draft.periods == null) {
      return (input: null, validationKey: 'validationLeasePeriodsRequired');
    }

    if (!draft.isComplete) {
      return (input: null, validationKey: 'validationLeaseRequiredFields');
    }

    return (
      input: LeaseComparisonInput(
        discountRate: draft.discountRate!,
        leasePayment: draft.leasePayment!,
        periods: draft.periods!,
        purchasePrice: draft.purchasePrice!,
        residualValue: draft.residualValue!,
      ),
      validationKey: null,
    );
  }
}
