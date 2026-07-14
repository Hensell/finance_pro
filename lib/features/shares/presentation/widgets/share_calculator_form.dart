import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/atoms/ds_divider_rule.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_aside_panel.dart';
import 'package:finance_pro/design_system/molecules/ds_page_intro.dart';
import 'package:finance_pro/design_system/molecules/ds_result_grid.dart';
import 'package:finance_pro/design_system/molecules/ds_result_tile.dart';
import 'package:finance_pro/design_system/organisms/ds_calculator_frame.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/widgets/calculator_sections.dart';
import 'package:finance_pro/features/shares/domain/entities/share_calculation_mode_x.dart';
import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/presentation/cubit/share_calculator_cubit.dart';
import 'package:finance_pro/features/shares/presentation/cubit/share_calculator_state.dart';
import 'package:finance_pro/features/shares/presentation/mappers/share_calculator_input_mapper.dart';
import 'package:finance_pro/features/shares/presentation/models/share_calculator_draft.dart';
import 'package:finance_pro/features/shares/presentation/presenters/share_calculator_learning_presenter.dart';
import 'package:finance_pro/features/shares/presentation/widgets/share_calculator_guide.dart';
import 'package:finance_pro/features/shares/presentation/widgets/share_formula_panel.dart';
import 'package:finance_pro/features/shares/presentation/widgets/share_interpretation_panel.dart';
import 'package:finance_pro/features/shares/presentation/widgets/share_mode_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShareCalculatorForm extends StatelessWidget {
  const ShareCalculatorForm({
    required this.calculator,
    required this.content,
    required this.currentMode,
    required this.currentTopic,
    required this.mode,
    required this.modeId,
    required this.resultsKey,
    required this.sections,
    super.key,
  });

  final CalculatorDescriptor calculator;
  final FeatureContent content;
  final CalculatorModeContent currentMode;
  final TopicContent currentTopic;
  final ShareCalculationMode mode;
  final String modeId;
  final GlobalKey resultsKey;
  final List<CalculatorSectionContent> sections;

  static const ShareCalculatorInputMapper _inputMapper =
      ShareCalculatorInputMapper();
  static const ShareCalculatorLearningPresenter _learningPresenter =
      ShareCalculatorLearningPresenter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShareCalculatorCubit, ShareCalculatorState>(
      builder: (BuildContext context, ShareCalculatorState calculatorState) {
        final ShareCalculatorDraft draft = _inputMapper.toDraft(
          calculatorState.inputs,
        );
        final ShareCalculationInsight? insight = calculatorState.result == null
            ? null
            : _learningPresenter.buildInsight(
                mode: mode,
                draft: draft,
                result: calculatorState.result,
              );

        return DsCalculatorFrame(
          intro: DsPageIntro(
            eyebrow: content.title,
            title: calculator.title,
            summary: calculator.summary,
            compact: true,
          ),
          main: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShareModePicker(
                modes: calculator.modes,
                onSelected: (String selectedModeId) => context
                    .read<ShareCalculatorCubit>()
                    .selectMode(shareModeFromContentId(selectedModeId)),
                selectedModeId: modeId,
                selectedContent: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CalculatorSections(
                      inputs: calculatorState.inputs,
                      onChanged: (MapEntry<String, String> entry) => context
                          .read<ShareCalculatorCubit>()
                          .updateField(entry.key, entry.value),
                      sections: sections,
                    ),
                    if (calculatorState.validationKey != null) ...<Widget>[
                      DsText(
                        _resolveValidationMessage(
                          context,
                          calculatorState.validationKey!,
                        ),
                        tone: DsTextTone.bodyMuted,
                        color: context.tokens.colors.error,
                      ),
                      SizedBox(height: context.tokens.spacing.md),
                    ],
                    DsButton(
                      label: calculator.submitLabel,
                      onPressed: context.read<ShareCalculatorCubit>().submit,
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.tokens.spacing.lg),
              ShareCalculatorGuide(note: calculator.note),
            ],
          ),
          aside: DsAsidePanel(
            eyebrow: context.l10n.appFormulaSection,
            title: currentMode.label,
            summary: currentMode.summary,
            child: ShareFormulaPanel(
              draft: draft,
              mode: mode,
              presenter: _learningPresenter,
              topic: currentTopic,
            ),
          ),
          results: calculatorState.result == null
              ? null
              : Container(
                  key: resultsKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DsDividerRule(label: context.l10n.appResultsSection),
                      SizedBox(height: context.tokens.spacing.lg),
                      DsResultGrid(
                        children: _buildResults(
                          calculator: calculator,
                          mode: mode,
                          result: calculatorState.result!,
                        ),
                      ),
                      if (insight != null) ...<Widget>[
                        SizedBox(height: context.tokens.spacing.lg),
                        ShareInterpretationPanel(
                          draft: draft,
                          insight: insight,
                        ),
                      ],
                    ],
                  ),
                ),
        );
      },
    );
  }

  List<Widget> _buildResults({
    required CalculatorDescriptor calculator,
    required ShareCalculationMode mode,
    required ShareCalculatorResult result,
  }) {
    final String modeId = mode.contentId;
    final List<ResultDescriptor> descriptors = calculator.results.where((
      ResultDescriptor descriptor,
    ) {
      return descriptor.modeIds.isEmpty || descriptor.modeIds.contains(modeId);
    }).toList();

    final Map<String, String> values = <String, String>{
      'presentValue': AppNumberFormatter.decimal(result.presentValue),
      if (result.terminalDividend != null)
        'terminalDividend': AppNumberFormatter.decimal(
          result.terminalDividend!,
        ),
      if (result.terminalPrice != null)
        'terminalPrice': AppNumberFormatter.decimal(result.terminalPrice!),
      if (result.terminalPresentValue != null)
        'terminalPresentValue': AppNumberFormatter.decimal(
          result.terminalPresentValue!,
        ),
    };

    return descriptors
        .where(
          (ResultDescriptor descriptor) => values.containsKey(descriptor.id),
        )
        .map(
          (ResultDescriptor descriptor) => DsResultTile(
            label: descriptor.label,
            value: values[descriptor.id]!,
          ),
        )
        .toList();
  }

  String _resolveValidationMessage(BuildContext context, String key) {
    switch (key) {
      case 'validationPositiveNumbers':
        return context.l10n.validationPositiveNumbers;
      case 'validationGrowthLessThanReturn':
        return context.l10n.validationGrowthLessThanReturn;
      case 'validationPeriodsRequired':
        return context.l10n.validationPeriodsRequired;
      default:
        return context.l10n.validationNonNegativeNumbers;
    }
  }
}
