import 'package:finance_pro/features/lease/domain/entities/lease_calculator_models.dart';

class LeaseInputValidator {
  const LeaseInputValidator();

  String? validate(LeaseComparisonInput input) {
    if (input.residualValue > input.purchasePrice) {
      return 'validationLeaseResidualExceedsPrice';
    }

    return null;
  }
}
