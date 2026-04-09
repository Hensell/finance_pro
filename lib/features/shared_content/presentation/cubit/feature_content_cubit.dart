import 'package:bloc/bloc.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/features/shared_content/domain/usecases/load_feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_state.dart';

class FeatureContentCubit extends Cubit<FeatureContentState> {
  FeatureContentCubit(this._loadFeatureContent)
      : super(const FeatureContentState());

  final LoadFeatureContent _loadFeatureContent;

  Future<void> load({
    required String localeCode,
    required String featureId,
  }) async {
    emit(state.copyWith(status: AppLoadStatus.loading, errorMessage: null));

    try {
      final content = await _loadFeatureContent(
        localeCode: localeCode,
        featureId: featureId,
      );
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
          errorMessage: 'feature_load_failed',
        ),
      );
    }
  }
}
