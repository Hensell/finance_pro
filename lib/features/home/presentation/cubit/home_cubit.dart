import 'package:bloc/bloc.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/features/home/domain/usecases/load_home_content.dart';
import 'package:finance_pro/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._loadHomeContent) : super(const HomeState());

  final LoadHomeContent _loadHomeContent;

  Future<void> load(String localeCode) async {
    emit(state.copyWith(status: AppLoadStatus.loading, errorMessage: null));

    try {
      final content = await _loadHomeContent(localeCode: localeCode);
      emit(
        state.copyWith(
          status: AppLoadStatus.success,
          content: content,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: AppLoadStatus.failure,
          errorMessage: 'home_load_failed',
        ),
      );
    }
  }
}
