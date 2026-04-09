import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text_field.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter/material.dart';

class CalculatorSections extends StatelessWidget {
  const CalculatorSections({
    required this.inputs,
    required this.onChanged,
    required this.sections,
    super.key,
  });

  final Map<String, String> inputs;
  final ValueChanged<MapEntry<String, String>> onChanged;
  final List<CalculatorSectionContent> sections;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final bool twoColumnLayout =
        MediaQuery.sizeOf(context).width >=
        tokens.layout.breakpointGridTwoColumn;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections
          .map(
            (CalculatorSectionContent section) => Padding(
              padding: EdgeInsets.only(bottom: tokens.spacing.lg),
              child: DsReadingSection(
                title: section.title,
                summary: section.summary,
                child: twoColumnLayout
                    ? Wrap(
                        spacing: tokens.layout.gridGap,
                        runSpacing: tokens.spacing.md,
                        children: section.fields
                            .map(
                              (CalculatorFieldContent field) => SizedBox(
                                width:
                                    (tokens.layout.maxReadingWidth -
                                        tokens.layout.gridGap) /
                                    2,
                                child: _CalculatorField(
                                  field: field,
                                  inputs: inputs,
                                  onChanged: onChanged,
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: section.fields
                            .map(
                              (CalculatorFieldContent field) => Padding(
                                padding: EdgeInsets.only(
                                  bottom: tokens.spacing.md,
                                ),
                                child: _CalculatorField(
                                  field: field,
                                  inputs: inputs,
                                  onChanged: onChanged,
                                ),
                              ),
                            )
                            .toList(),
                      ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CalculatorField extends StatelessWidget {
  const _CalculatorField({
    required this.field,
    required this.inputs,
    required this.onChanged,
  });

  final CalculatorFieldContent field;
  final Map<String, String> inputs;
  final ValueChanged<MapEntry<String, String>> onChanged;

  @override
  Widget build(BuildContext context) {
    return DsTextField(
      acceptsDecimal: field.acceptsDecimal,
      helperText: field.helperText,
      label: field.label,
      hint: field.hint,
      initialValue: inputs[field.id],
      suffix: field.suffix,
      onChanged: (String value) =>
          onChanged(MapEntry<String, String>(field.id, value)),
    );
  }
}
