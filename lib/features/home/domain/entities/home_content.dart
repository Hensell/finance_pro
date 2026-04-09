import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_content.freezed.dart';
part 'home_content.g.dart';

@freezed
abstract class HomeContent with _$HomeContent {
  const factory HomeContent({
    required String eyebrow,
    required String title,
    required String summary,
    @Default(<HomeHighlight>[]) List<HomeHighlight> highlights,
    @Default(<HomeModuleSummary>[]) List<HomeModuleSummary> modules,
  }) = _HomeContent;

  factory HomeContent.fromJson(Map<String, dynamic> json) =>
      _$HomeContentFromJson(json);
}

@freezed
abstract class HomeHighlight with _$HomeHighlight {
  const factory HomeHighlight({
    required String label,
    required String value,
  }) = _HomeHighlight;

  factory HomeHighlight.fromJson(Map<String, dynamic> json) =>
      _$HomeHighlightFromJson(json);
}

@freezed
abstract class HomeModuleSummary with _$HomeModuleSummary {
  const factory HomeModuleSummary({
    required String id,
    required String accent,
    required String kicker,
    required String title,
    required String summary,
  }) = _HomeModuleSummary;

  factory HomeModuleSummary.fromJson(Map<String, dynamic> json) =>
      _$HomeModuleSummaryFromJson(json);
}
