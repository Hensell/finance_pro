// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeatureContent _$FeatureContentFromJson(Map<String, dynamic> json) =>
    _FeatureContent(
      id: json['id'] as String,
      accent: json['accent'] as String,
      eyebrow: json['eyebrow'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      heroPoints:
          (json['heroPoints'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      topics:
          (json['topics'] as List<dynamic>?)
              ?.map((e) => TopicContent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TopicContent>[],
      calculator: json['calculator'] == null
          ? null
          : CalculatorDescriptor.fromJson(
              json['calculator'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FeatureContentToJson(_FeatureContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accent': instance.accent,
      'eyebrow': instance.eyebrow,
      'title': instance.title,
      'summary': instance.summary,
      'heroPoints': instance.heroPoints,
      'topics': instance.topics,
      'calculator': instance.calculator,
    };

_TopicContent _$TopicContentFromJson(Map<String, dynamic> json) =>
    _TopicContent(
      id: json['id'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      sections:
          (json['sections'] as List<dynamic>?)
              ?.map((e) => ContentSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ContentSection>[],
    );

Map<String, dynamic> _$TopicContentToJson(_TopicContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'sections': instance.sections,
    };

_ContentSection _$ContentSectionFromJson(
  Map<String, dynamic> json,
) => _ContentSection(
  id: json['id'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  bullets:
      (json['bullets'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  formulas:
      (json['formulas'] as List<dynamic>?)
          ?.map((e) => FormulaContent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FormulaContent>[],
  formulaLegend:
      (json['formulaLegend'] as List<dynamic>?)
          ?.map((e) => FormulaLegendItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FormulaLegendItem>[],
  exampleTable: json['exampleTable'] == null
      ? null
      : ExampleTable.fromJson(json['exampleTable'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ContentSectionToJson(_ContentSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'bullets': instance.bullets,
      'formulas': instance.formulas,
      'formulaLegend': instance.formulaLegend,
      'exampleTable': instance.exampleTable,
    };

_FormulaContent _$FormulaContentFromJson(
  Map<String, dynamic> json,
) => _FormulaContent(
  label: json['label'] as String,
  tex: json['tex'] as String,
  stepIds:
      (json['stepIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  groupIds:
      (json['groupIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$FormulaContentToJson(_FormulaContent instance) =>
    <String, dynamic>{
      'label': instance.label,
      'tex': instance.tex,
      'stepIds': instance.stepIds,
      'groupIds': instance.groupIds,
    };

_FormulaLegendItem _$FormulaLegendItemFromJson(Map<String, dynamic> json) =>
    _FormulaLegendItem(
      symbol: json['symbol'] as String,
      meaning: json['meaning'] as String,
    );

Map<String, dynamic> _$FormulaLegendItemToJson(_FormulaLegendItem instance) =>
    <String, dynamic>{'symbol': instance.symbol, 'meaning': instance.meaning};

_ExampleTable _$ExampleTableFromJson(Map<String, dynamic> json) =>
    _ExampleTable(
      title: json['title'] as String,
      columns:
          (json['columns'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      rows:
          (json['rows'] as List<dynamic>?)
              ?.map((e) => ExampleRow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExampleRow>[],
      footnote: json['footnote'] as String?,
    );

Map<String, dynamic> _$ExampleTableToJson(_ExampleTable instance) =>
    <String, dynamic>{
      'title': instance.title,
      'columns': instance.columns,
      'rows': instance.rows,
      'footnote': instance.footnote,
    };

_ExampleRow _$ExampleRowFromJson(Map<String, dynamic> json) => _ExampleRow(
  cells:
      (json['cells'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$ExampleRowToJson(_ExampleRow instance) =>
    <String, dynamic>{'cells': instance.cells};

_CalculatorDescriptor _$CalculatorDescriptorFromJson(
  Map<String, dynamic> json,
) => _CalculatorDescriptor(
  id: json['id'] as String,
  title: json['title'] as String,
  summary: json['summary'] as String,
  submitLabel: json['submitLabel'] as String,
  note: json['note'] as String?,
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map(
            (e) => CalculatorStepContent.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <CalculatorStepContent>[],
  formulas:
      (json['formulas'] as List<dynamic>?)
          ?.map((e) => FormulaContent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FormulaContent>[],
  modes:
      (json['modes'] as List<dynamic>?)
          ?.map(
            (e) => CalculatorModeContent.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <CalculatorModeContent>[],
  sections:
      (json['sections'] as List<dynamic>?)
          ?.map(
            (e) => CalculatorSectionContent.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <CalculatorSectionContent>[],
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => ResultDescriptor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ResultDescriptor>[],
);

Map<String, dynamic> _$CalculatorDescriptorToJson(
  _CalculatorDescriptor instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'summary': instance.summary,
  'submitLabel': instance.submitLabel,
  'note': instance.note,
  'steps': instance.steps,
  'formulas': instance.formulas,
  'modes': instance.modes,
  'sections': instance.sections,
  'results': instance.results,
};

_CalculatorModeContent _$CalculatorModeContentFromJson(
  Map<String, dynamic> json,
) => _CalculatorModeContent(
  id: json['id'] as String,
  label: json['label'] as String,
  summary: json['summary'] as String,
);

Map<String, dynamic> _$CalculatorModeContentToJson(
  _CalculatorModeContent instance,
) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'summary': instance.summary,
};

_CalculatorStepContent _$CalculatorStepContentFromJson(
  Map<String, dynamic> json,
) => _CalculatorStepContent(
  id: json['id'] as String,
  title: json['title'] as String,
  summary: json['summary'] as String,
);

Map<String, dynamic> _$CalculatorStepContentToJson(
  _CalculatorStepContent instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'summary': instance.summary,
};

_CalculatorSectionContent _$CalculatorSectionContentFromJson(
  Map<String, dynamic> json,
) => _CalculatorSectionContent(
  id: json['id'] as String,
  title: json['title'] as String,
  summary: json['summary'] as String?,
  stepId: json['stepId'] as String?,
  modeIds:
      (json['modeIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  fields:
      (json['fields'] as List<dynamic>?)
          ?.map(
            (e) => CalculatorFieldContent.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <CalculatorFieldContent>[],
);

Map<String, dynamic> _$CalculatorSectionContentToJson(
  _CalculatorSectionContent instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'summary': instance.summary,
  'stepId': instance.stepId,
  'modeIds': instance.modeIds,
  'fields': instance.fields,
};

_CalculatorFieldContent _$CalculatorFieldContentFromJson(
  Map<String, dynamic> json,
) => _CalculatorFieldContent(
  id: json['id'] as String,
  label: json['label'] as String,
  hint: json['hint'] as String,
  acceptsDecimal: json['acceptsDecimal'] as bool? ?? true,
  suffix: json['suffix'] as String?,
  helperText: json['helperText'] as String?,
);

Map<String, dynamic> _$CalculatorFieldContentToJson(
  _CalculatorFieldContent instance,
) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'hint': instance.hint,
  'acceptsDecimal': instance.acceptsDecimal,
  'suffix': instance.suffix,
  'helperText': instance.helperText,
};

_ResultDescriptor _$ResultDescriptorFromJson(
  Map<String, dynamic> json,
) => _ResultDescriptor(
  id: json['id'] as String,
  label: json['label'] as String,
  group: json['group'] as String?,
  formula: json['formula'] as String?,
  summary: json['summary'] as String?,
  format: json['format'] as String?,
  modeIds:
      (json['modeIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  didacticRanges:
      (json['didacticRanges'] as List<dynamic>?)
          ?.map((e) => DidacticRangeContent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DidacticRangeContent>[],
);

Map<String, dynamic> _$ResultDescriptorToJson(_ResultDescriptor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'group': instance.group,
      'formula': instance.formula,
      'summary': instance.summary,
      'format': instance.format,
      'modeIds': instance.modeIds,
      'didacticRanges': instance.didacticRanges,
    };

_DidacticRangeContent _$DidacticRangeContentFromJson(
  Map<String, dynamic> json,
) => _DidacticRangeContent(
  label: json['label'] as String,
  summary: json['summary'] as String,
  min: (json['min'] as num?)?.toDouble(),
  max: (json['max'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DidacticRangeContentToJson(
  _DidacticRangeContent instance,
) => <String, dynamic>{
  'label': instance.label,
  'summary': instance.summary,
  'min': instance.min,
  'max': instance.max,
};
