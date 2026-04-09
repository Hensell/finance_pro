import 'package:bloc/bloc.dart';
import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/domain/usecases/calculate_share_valuation.dart';
import 'package:finance_pro/features/shares/domain/validators/share_input_validator.dart';
import 'package:finance_pro/features/shares/presentation/cubit/share_calculator_state.dart';
import 'package:finance_pro/features/shares/presentation/mappers/share_calculator_input_mapper.dart';

class ShareCalculatorCubit extends Cubit<ShareCalculatorState> {
  ShareCalculatorCubit({
    required this.calculateShareValuation,
    this.inputMapper = const ShareCalculatorInputMapper(),
    required this.validator,
  }) : super(const ShareCalculatorState());

  final CalculateShareValuation calculateShareValuation;
  final ShareCalculatorInputMapper inputMapper;
  final ShareInputValidator validator;

  void selectMode(ShareCalculationMode mode) {
    emit(state.copyWith(mode: mode, result: null, validationKey: null));
  }

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
    final ({ShareCalculatorInput? input, String? validationKey}) mappedInput =
        inputMapper.toInput(mode: state.mode, values: state.inputs);
    final ShareCalculatorInput? input = mappedInput.input;
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

    final String? validationKey = validator.validate(
      mode: state.mode,
      input: input,
    );
    if (validationKey != null) {
      emit(state.copyWith(result: null, validationKey: validationKey));
      return;
    }

    emit(
      state.copyWith(
        result: calculateShareValuation(mode: state.mode, input: input),
        validationKey: null,
      ),
    );
  }
}
