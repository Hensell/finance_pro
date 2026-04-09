import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/features/home/domain/entities/home_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(AppLoadStatus.initial) AppLoadStatus status,
    HomeContent? content,
    String? errorMessage,
  }) = _HomeState;
}
