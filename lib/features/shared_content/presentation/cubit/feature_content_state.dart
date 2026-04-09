import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_content_state.freezed.dart';

@freezed
abstract class FeatureContentState with _$FeatureContentState {
  const factory FeatureContentState({
    @Default(AppLoadStatus.initial) AppLoadStatus status,
    FeatureContent? content,
    String? errorMessage,
  }) = _FeatureContentState;
}
