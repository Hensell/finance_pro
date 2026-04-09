import 'package:bloc/bloc.dart';
import 'package:finance_pro/features/lease/domain/entities/lease_calculator_models.dart';
import 'package:finance_pro/features/lease/domain/usecases/calculate_lease_comparison.dart';
import 'package:finance_pro/features/lease/domain/validators/lease_input_validator.dart';
import 'package:finance_pro/features/lease/presentation/cubit/lease_calculator_state.dart';
import 'package:finance_pro/features/lease/presentation/mappers/lease_calculator_input_mapper.dart';

class LeaseCalculatorCubit extends Cubit<LeaseCalculatorState> {
  LeaseCalculatorCubit({
    required this.calculateLeaseComparison,
    required this.validator,
    this.inputMapper = const LeaseCalculatorInputMapper(),
  }) : super(const LeaseCalculatorState());

  final CalculateLeaseComparison calculateLeaseComparison;
  final LeaseCalculatorInputMapper inputMapper;
  final LeaseInputValidator validator;

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
    final ({LeaseComparisonInput? input, String? validationKey}) mappedInput =
        inputMapper.toInput(state.inputs);
    final LeaseComparisonInput? input = mappedInput.input;

    if (input == null) {
      emit(
        state.copyWith(
          result: null,
          validationKey:
              mappedInput.validationKey ?? 'validationLeaseRequiredFields',
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
      state.copyWith(
        result: calculateLeaseComparison(input),
        validationKey: null,
      ),
    );
  }
}
