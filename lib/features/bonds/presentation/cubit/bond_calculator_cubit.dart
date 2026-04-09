import 'package:bloc/bloc.dart';
import 'package:finance_pro/features/bonds/domain/entities/bond_calculator_models.dart';
import 'package:finance_pro/features/bonds/domain/usecases/calculate_bond_value.dart';
import 'package:finance_pro/features/bonds/domain/validators/bond_input_validator.dart';
import 'package:finance_pro/features/bonds/presentation/cubit/bond_calculator_state.dart';
import 'package:finance_pro/features/bonds/presentation/mappers/bond_calculator_input_mapper.dart';

class BondCalculatorCubit extends Cubit<BondCalculatorState> {
  BondCalculatorCubit({
    required this.calculateBondValue,
    required this.validator,
    this.inputMapper = const BondCalculatorInputMapper(),
  }) : super(const BondCalculatorState());

  final CalculateBondValue calculateBondValue;
  final BondCalculatorInputMapper inputMapper;
  final BondInputValidator validator;

  void updateField(String fieldId, String value) {
    emit(
      state.copyWith(
        inputs: <String, String>{...state.inputs, fieldId: value},
        result: null,
        validationKey: null,
      ),
    );
  }

  void submit() {
    final ({BondCalculatorInput? input, String? validationKey}) mappedInput =
        inputMapper.toInput(state.inputs);
    final BondCalculatorInput? input = mappedInput.input;

    if (input == null) {
      emit(
        state.copyWith(
          result: null,
          validationKey:
              mappedInput.validationKey ?? 'validationPositiveNumbers',
        ),
      );
      return;
    }

    final String? validationKey = validator.validate(input);
    if (validationKey != null) {
      emit(state.copyWith(result: null, validationKey: validationKey));
      return;
    }

    emit(
      state.copyWith(result: calculateBondValue(input), validationKey: null),
    );
  }
}
