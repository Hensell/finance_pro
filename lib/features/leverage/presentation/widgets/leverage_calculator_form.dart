import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/core/utils/input_parsers.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/atoms/ds_divider_rule.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_aside_panel.dart';
import 'package:finance_pro/design_system/molecules/ds_page_intro.dart';
import 'package:finance_pro/design_system/molecules/ds_result_grid.dart';
import 'package:finance_pro/design_system/molecules/ds_result_tile.dart';
import 'package:finance_pro/design_system/organisms/ds_calculator_frame.dart';
import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:finance_pro/features/leverage/domain/entities/leverage_mode_x.dart';
import 'package:finance_pro/features/leverage/presentation/cubit/leverage_calculator_cubit.dart';
import 'package:finance_pro/features/leverage/presentation/cubit/leverage_calculator_state.dart';
import 'package:finance_pro/features/leverage/presentation/models/leverage_calculator_draft.dart';
import 'package:finance_pro/features/leverage/presentation/presenters/leverage_calculator_learning_presenter.dart';
import 'package:finance_pro/features/leverage/presentation/widgets/leverage_calculator_guide.dart';
import 'package:finance_pro/features/leverage/presentation/widgets/leverage_formula_panel.dart';
import 'package:finance_pro/features/leverage/presentation/widgets/leverage_interpretation_panel.dart';
import 'package:finance_pro/features/leverage/presentation/widgets/leverage_mode_picker.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/widgets/calculator_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeverageCalculatorForm extends StatelessWidget {
  const LeverageCalculatorForm({
    required this.calculator,
    required this.content,
    required this.currentMode,
    required this.currentTopic,
    required this.mode,
    required this.resultsKey,
    required this.sections,
    super.key,
  });

  final CalculatorDescriptor calculator;
  final FeatureContent content;
  final CalculatorModeContent currentMode;
  final TopicContent currentTopic;
  final LeverageMode mode;
  final GlobalKey resultsKey;
  final List<CalculatorSectionContent> sections;

  static const LeverageCalculatorLearningPresenter _presenter =
      LeverageCalculatorLearningPresenter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeverageCalculatorCubit, LeverageCalculatorState>(
      builder: (BuildContext context, LeverageCalculatorState calculatorState) {
        final LeverageCalculatorDraft draft = _buildDraft(
          calculatorState.inputs,
        );
        final LeverageCalculationInsight? insight =
            calculatorState.result == null
            ? null
            : _presenter.buildInsight(
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
              LeverageModePicker(
                modes: calculator.modes,
                onSelected: (String selectedId) => context
                    .read<LeverageCalculatorCubit>()
                    .selectMode(leverageModeFromCalculatorId(selectedId)),
                selectedModeId: mode.calculatorModeId,
                selectedContent: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CalculatorSections(
                      inputs: calculatorState.inputs,
                      onChanged: (MapEntry<String, String> entry) => context
                          .read<LeverageCalculatorCubit>()
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
                      onPressed: context.read<LeverageCalculatorCubit>().submit,
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.tokens.spacing.lg),
              LeverageCalculatorGuide(note: calculator.note),
            ],
          ),
          aside: DsAsidePanel(
            eyebrow: context.l10n.appFormulaSection,
            title: currentMode.label,
            summary: currentMode.summary,
            child: LeverageFormulaPanel(
              draft: draft,
              mode: mode,
              presenter: _presenter,
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
                        children: <Widget>[
                          DsResultTile(
                            label: calculator.results.first.label,
                            value: AppNumberFormatter.decimal(
                              calculatorState.result!.degree,
                            ),
                          ),
                        ],
                      ),
                      if (insight != null) ...<Widget>[
                        SizedBox(height: context.tokens.spacing.lg),
                        LeverageInterpretationPanel(
                          insight: insight,
                          result: calculatorState.result!,
                        ),
                      ],
                    ],
                  ),
                ),
        );
      },
    );
  }

  LeverageCalculatorDraft _buildDraft(Map<String, String> values) {
    return LeverageCalculatorDraft(
      salesVolume: _parseDouble(values['salesVolume']),
      salePrice: _parseDouble(values['salePrice']),
      variableCost: _parseDouble(values['variableCost']),
      fixedCost: _parseDouble(values['fixedCost']),
      interest: _parseDouble(values['interest']),
      preferredDividends: _parseDouble(values['preferredDividends']),
      taxRate: _parseDouble(values['taxRate']),
      earningsBeforeInterestAndTaxes: _parseDouble(
        values['earningsBeforeInterestAndTaxes'],
      ),
    );
  }

  double? _parseDouble(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    return parseFiniteNumber(value);
  }

  String _resolveValidationMessage(BuildContext context, String key) {
    switch (key) {
      case 'validationTaxRateRange':
        return context.l10n.validationTaxRateRange;
      case 'validationLeverageOperatingDenominator':
        return context.l10n.validationLeverageOperatingDenominator;
      case 'validationLeverageFinancialDenominator':
        return context.l10n.validationLeverageFinancialDenominator;
      case 'validationNonNegativeNumbers':
      default:
        return context.l10n.validationNonNegativeNumbers;
    }
  }
}
