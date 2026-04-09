import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_content.freezed.dart';
part 'feature_content.g.dart';

@freezed
abstract class FeatureContent with _$FeatureContent {
  const factory FeatureContent({
    required String id,
    required String accent,
    required String eyebrow,
    required String title,
    required String summary,
    @Default(<String>[]) List<String> heroPoints,
    @Default(<TopicContent>[]) List<TopicContent> topics,
    CalculatorDescriptor? calculator,
  }) = _FeatureContent;

  factory FeatureContent.fromJson(Map<String, dynamic> json) =>
      _$FeatureContentFromJson(json);
}

@freezed
abstract class TopicContent with _$TopicContent {
  const factory TopicContent({
    required String id,
    required String title,
    required String summary,
    @Default(<ContentSection>[]) List<ContentSection> sections,
  }) = _TopicContent;

  factory TopicContent.fromJson(Map<String, dynamic> json) =>
      _$TopicContentFromJson(json);
}

@freezed
abstract class ContentSection with _$ContentSection {
  const factory ContentSection({
    required String id,
    required String title,
    required String body,
    @Default(<String>[]) List<String> bullets,
    @Default(<FormulaContent>[]) List<FormulaContent> formulas,
    @Default(<FormulaLegendItem>[]) List<FormulaLegendItem> formulaLegend,
    ExampleTable? exampleTable,
  }) = _ContentSection;

  factory ContentSection.fromJson(Map<String, dynamic> json) =>
      _$ContentSectionFromJson(json);
}

@freezed
abstract class FormulaContent with _$FormulaContent {
  const factory FormulaContent({
    required String label,
    required String tex,
    @Default(<String>[]) List<String> stepIds,
    @Default(<String>[]) List<String> groupIds,
  }) = _FormulaContent;

  factory FormulaContent.fromJson(Map<String, dynamic> json) =>
      _$FormulaContentFromJson(json);
}

@freezed
abstract class FormulaLegendItem with _$FormulaLegendItem {
  const factory FormulaLegendItem({
    required String symbol,
    required String meaning,
  }) = _FormulaLegendItem;

  factory FormulaLegendItem.fromJson(Map<String, dynamic> json) =>
      _$FormulaLegendItemFromJson(json);
}

@freezed
abstract class ExampleTable with _$ExampleTable {
  const factory ExampleTable({
    required String title,
    @Default(<String>[]) List<String> columns,
    @Default(<ExampleRow>[]) List<ExampleRow> rows,
    String? footnote,
  }) = _ExampleTable;

  factory ExampleTable.fromJson(Map<String, dynamic> json) =>
      _$ExampleTableFromJson(json);
}

@freezed
abstract class ExampleRow with _$ExampleRow {
  const factory ExampleRow({@Default(<String>[]) List<String> cells}) =
      _ExampleRow;

  factory ExampleRow.fromJson(Map<String, dynamic> json) =>
      _$ExampleRowFromJson(json);
}

@freezed
abstract class CalculatorDescriptor with _$CalculatorDescriptor {
  const factory CalculatorDescriptor({
    required String id,
    required String title,
    required String summary,
    required String submitLabel,
    String? note,
    @Default(<CalculatorStepContent>[]) List<CalculatorStepContent> steps,
    @Default(<FormulaContent>[]) List<FormulaContent> formulas,
    @Default(<CalculatorModeContent>[]) List<CalculatorModeContent> modes,
    @Default(<CalculatorSectionContent>[])
    List<CalculatorSectionContent> sections,
    @Default(<ResultDescriptor>[]) List<ResultDescriptor> results,
  }) = _CalculatorDescriptor;

  factory CalculatorDescriptor.fromJson(Map<String, dynamic> json) =>
      _$CalculatorDescriptorFromJson(json);
}

@freezed
abstract class CalculatorModeContent with _$CalculatorModeContent {
  const factory CalculatorModeContent({
    required String id,
    required String label,
    required String summary,
  }) = _CalculatorModeContent;

  factory CalculatorModeContent.fromJson(Map<String, dynamic> json) =>
      _$CalculatorModeContentFromJson(json);
}

@freezed
abstract class CalculatorStepContent with _$CalculatorStepContent {
  const factory CalculatorStepContent({
    required String id,
    required String title,
    required String summary,
  }) = _CalculatorStepContent;

  factory CalculatorStepContent.fromJson(Map<String, dynamic> json) =>
      _$CalculatorStepContentFromJson(json);
}

@freezed
abstract class CalculatorSectionContent with _$CalculatorSectionContent {
  const factory CalculatorSectionContent({
    required String id,
    required String title,
    String? summary,
    String? stepId,
    @Default(<String>[]) List<String> modeIds,
    @Default(<CalculatorFieldContent>[]) List<CalculatorFieldContent> fields,
  }) = _CalculatorSectionContent;

  factory CalculatorSectionContent.fromJson(Map<String, dynamic> json) =>
      _$CalculatorSectionContentFromJson(json);
}

@freezed
abstract class CalculatorFieldContent with _$CalculatorFieldContent {
  const factory CalculatorFieldContent({
    required String id,
    required String label,
    required String hint,
    @Default(true) bool acceptsDecimal,
    String? suffix,
    String? helperText,
  }) = _CalculatorFieldContent;

  factory CalculatorFieldContent.fromJson(Map<String, dynamic> json) =>
      _$CalculatorFieldContentFromJson(json);
}

@freezed
abstract class ResultDescriptor with _$ResultDescriptor {
  const factory ResultDescriptor({
    required String id,
    required String label,
    String? group,
    String? formula,
    String? summary,
    String? format,
    @Default(<String>[]) List<String> modeIds,
    @Default(<DidacticRangeContent>[])
    List<DidacticRangeContent> didacticRanges,
  }) = _ResultDescriptor;

  factory ResultDescriptor.fromJson(Map<String, dynamic> json) =>
      _$ResultDescriptorFromJson(json);
}

@freezed
abstract class DidacticRangeContent with _$DidacticRangeContent {
  const factory DidacticRangeContent({
    required String label,
    required String summary,
    double? min,
    double? max,
  }) = _DidacticRangeContent;

  factory DidacticRangeContent.fromJson(Map<String, dynamic> json) =>
      _$DidacticRangeContentFromJson(json);
}
