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
import 'package:finance_pro/features/lease/presentation/cubit/lease_calculator_cubit.dart';
import 'package:finance_pro/features/lease/presentation/cubit/lease_calculator_state.dart';
import 'package:finance_pro/features/lease/presentation/mappers/lease_calculator_input_mapper.dart';
import 'package:finance_pro/features/lease/presentation/models/lease_calculator_draft.dart';
import 'package:finance_pro/features/lease/presentation/presenters/lease_calculator_learning_presenter.dart';
import 'package:finance_pro/features/lease/presentation/widgets/lease_calculator_guide.dart';
import 'package:finance_pro/features/lease/presentation/widgets/lease_formula_panel.dart';
import 'package:finance_pro/features/lease/presentation/widgets/lease_interpretation_panel.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/widgets/calculator_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaseCalculatorForm extends StatelessWidget {
  const LeaseCalculatorForm({
    required this.calculator,
    required this.content,
    required this.resultsById,
    required this.resultsKey,
    super.key,
  });

  final CalculatorDescriptor calculator;
  final FeatureContent content;
  final Map<String, ResultDescriptor> resultsById;
  final GlobalKey resultsKey;

  static const LeaseCalculatorInputMapper _inputMapper =
      LeaseCalculatorInputMapper();
  static const LeaseCalculatorLearningPresenter _learningPresenter =
      LeaseCalculatorLearningPresenter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaseCalculatorCubit, LeaseCalculatorState>(
      builder: (BuildContext context, LeaseCalculatorState calculatorState) {
        final LeaseCalculatorDraft draft = _inputMapper.toDraft(
          calculatorState.inputs,
        );
        final LeaseComparisonInsight? insight = calculatorState.result == null
            ? null
            : _learningPresenter.buildInsight(
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
              CalculatorSections(
                inputs: calculatorState.inputs,
                onChanged: (MapEntry<String, String> entry) => context
                    .read<LeaseCalculatorCubit>()
                    .updateField(entry.key, entry.value),
                sections: calculator.sections,
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
                onPressed: context.read<LeaseCalculatorCubit>().submit,
              ),
              SizedBox(height: context.tokens.spacing.lg),
              LeaseCalculatorGuide(note: calculator.note),
            ],
          ),
          aside: DsAsidePanel(
            eyebrow: context.l10n.appFormulaSection,
            title: context.l10n.leaseCalculatorLiveFormulaLabel,
            summary: calculator.summary,
            child: LeaseFormulaPanel(
              draft: draft,
              formulas: calculator.formulas,
              presenter: _learningPresenter,
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
                            label:
                                resultsById['leasePresentValue']?.label ??
                                'Lease',
                            value: AppNumberFormatter.decimal(
                              calculatorState.result!.leasePresentValue,
                            ),
                          ),
                          DsResultTile(
                            label:
                                resultsById['purchaseNetCost']?.label ??
                                'Compra',
                            value: AppNumberFormatter.decimal(
                              calculatorState.result!.purchaseNetCost,
                            ),
                          ),
                          DsResultTile(
                            label:
                                resultsById['difference']?.label ??
                                'Diferencia',
                            value: AppNumberFormatter.decimal(
                              calculatorState.result!.difference,
                            ),
                          ),
                          if (insight != null)
                            DsResultTile(
                              label:
                                  resultsById['recommendedOption']?.label ??
                                  context
                                      .l10n
                                      .leaseCalculatorRecommendationLabel,
                              value: _resolveRecommendation(context, insight),
                            ),
                        ],
                      ),
                      if (insight != null) ...<Widget>[
                        SizedBox(height: context.tokens.spacing.lg),
                        LeaseInterpretationPanel(
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

  String _resolveRecommendation(
    BuildContext context,
    LeaseComparisonInsight insight,
  ) {
    switch (insight.decision) {
      case LeaseDecision.lease:
        return context.l10n.leaseCalculatorRecommendationLease;
      case LeaseDecision.buy:
        return context.l10n.leaseCalculatorRecommendationBuy;
      case LeaseDecision.neutral:
        return context.l10n.leaseCalculatorRecommendationNeutral;
    }
  }

  String _resolveValidationMessage(BuildContext context, String key) {
    switch (key) {
      case 'validationLeasePeriodsRequired':
        return context.l10n.validationLeasePeriodsRequired;
      case 'validationLeaseResidualExceedsPrice':
        return context.l10n.validationLeaseResidualExceedsPrice;
      case 'validationLeaseRequiredFields':
      default:
        return context.l10n.validationLeaseRequiredFields;
    }
  }
}
