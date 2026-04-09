import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';

extension ShareCalculationModeX on ShareCalculationMode {
  String get contentId {
    switch (this) {
      case ShareCalculationMode.zeroGrowth:
        return 'zero_growth';
      case ShareCalculationMode.constantGrowth:
        return 'constant_growth';
      case ShareCalculationMode.variableGrowth:
        return 'variable_growth';
      case ShareCalculationMode.preferredShare:
        return 'preferred_share';
    }
  }

  bool get usesTerminalStage => this == ShareCalculationMode.variableGrowth;
}

ShareCalculationMode shareModeFromContentId(String id) {
  switch (id) {
    case 'constant_growth':
      return ShareCalculationMode.constantGrowth;
    case 'variable_growth':
      return ShareCalculationMode.variableGrowth;
    case 'preferred_share':
      return ShareCalculationMode.preferredShare;
    case 'zero_growth':
    default:
      return ShareCalculationMode.zeroGrowth;
  }
}
