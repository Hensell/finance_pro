import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';

extension LeverageModeX on LeverageMode {
  String get calculatorModeId {
    switch (this) {
      case LeverageMode.operating:
        return 'operating';
      case LeverageMode.financial:
        return 'financial';
    }
  }

  String get topicId {
    switch (this) {
      case LeverageMode.operating:
        return 'operating_leverage';
      case LeverageMode.financial:
        return 'financial_leverage';
    }
  }
}

LeverageMode leverageModeFromCalculatorId(String id) {
  switch (id) {
    case 'financial':
      return LeverageMode.financial;
    case 'operating':
    default:
      return LeverageMode.operating;
  }
}
