import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/atoms/ds_divider_rule.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_aside_panel.dart';
import 'package:finance_pro/design_system/molecules/ds_page_intro.dart';
import 'package:finance_pro/design_system/molecules/ds_result_grid.dart';
import 'package:finance_pro/design_system/molecules/ds_result_tile.dart';
import 'package:finance_pro/design_system/molecules/ds_status_panel.dart';
import 'package:finance_pro/design_system/organisms/ds_calculator_frame.dart';
import 'package:finance_pro/features/bonds/presentation/cubit/bond_calculator_cubit.dart';
import 'package:finance_pro/features/bonds/presentation/cubit/bond_calculator_state.dart';
import 'package:finance_pro/features/bonds/presentation/mappers/bond_calculator_input_mapper.dart';
import 'package:finance_pro/features/bonds/presentation/models/bond_calculator_draft.dart';
import 'package:finance_pro/features/bonds/presentation/presenters/bond_calculator_learning_presenter.dart';
import 'package:finance_pro/features/bonds/presentation/widgets/bond_calculator_guide.dart';
import 'package:finance_pro/features/bonds/presentation/widgets/bond_formula_panel.dart';
import 'package:finance_pro/features/bonds/presentation/widgets/bond_interpretation_panel.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_cubit.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_state.dart';
import 'package:finance_pro/features/shared_content/presentation/widgets/calculator_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BondCalculatorPage extends StatelessWidget {
  const BondCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDependencies dependencies = context.read<AppDependencies>();
    final String localeCode = Localizations.localeOf(context).languageCode;
    const BondCalculatorInputMapper inputMapper = BondCalculatorInputMapper();
    const BondCalculatorLearningPresenter learningPresenter =
        BondCalculatorLearningPresenter();

    return MultiBlocProvider(
      key: ValueKey<String>('bond-calculator:$localeCode'),
      providers: <BlocProvider<dynamic>>[
        BlocProvider<FeatureContentCubit>(
          create: (_) =>
              FeatureContentCubit(dependencies.loadFeatureContent)
                ..load(localeCode: localeCode, featureId: 'bonds'),
        ),
        BlocProvider<BondCalculatorCubit>(
          create: (_) => BondCalculatorCubit(
            calculateBondValue: dependencies.calculateBondValue,
            inputMapper: inputMapper,
            validator: dependencies.bondInputValidator,
          ),
        ),
      ],
      child: BlocBuilder<FeatureContentCubit, FeatureContentState>(
        builder: (BuildContext context, FeatureContentState state) {
          switch (state.status) {
            case AppLoadStatus.initial:
            case AppLoadStatus.loading:
              return DsStatusPanel(
                title: context.l10n.appLoadingTitle,
                body: context.l10n.appLoadingBody,
              );
            case AppLoadStatus.failure:
              return DsStatusPanel(
                title: context.l10n.appErrorTitle,
                body: context.l10n.appErrorBody,
                actionLabel: context.l10n.appRetryAction,
                onAction: () => context.read<FeatureContentCubit>().load(
                  localeCode: localeCode,
                  featureId: 'bonds',
                ),
              );
            case AppLoadStatus.success:
              final FeatureContent? content = state.content;
              final CalculatorDescriptor? calculator = content?.calculator;
              if (content == null || calculator == null) {
                return DsStatusPanel(
                  title: context.l10n.appEmptyTitle,
                  body: context.l10n.appEmptyBody,
                );
              }

              return BlocBuilder<BondCalculatorCubit, BondCalculatorState>(
                builder:
                    (
                      BuildContext context,
                      BondCalculatorState calculatorState,
                    ) {
                      final BondCalculatorDraft draft = inputMapper.toDraft(
                        calculatorState.inputs,
                      );
                      final BondPriceInsight? insight =
                          calculatorState.result == null
                          ? null
                          : learningPresenter.buildInsight(
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
                            BondCalculatorGuide(note: calculator.note),
                            SizedBox(height: context.tokens.spacing.lg),
                            CalculatorSections(
                              inputs: calculatorState.inputs,
                              onChanged: (MapEntry<String, String> entry) =>
                                  context
                                      .read<BondCalculatorCubit>()
                                      .updateField(entry.key, entry.value),
                              sections: calculator.sections,
                            ),
                            if (calculatorState.validationKey !=
                                null) ...<Widget>[
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
                              onPressed: context
                                  .read<BondCalculatorCubit>()
                                  .submit,
                            ),
                          ],
                        ),
                        aside: DsAsidePanel(
                          eyebrow: context.l10n.appFormulaSection,
                          title: context.l10n.bondCalculatorLiveFormulaLabel,
                          summary: calculator.summary,
                          child: BondFormulaPanel(
                            draft: draft,
                            formulas: calculator.formulas,
                            presenter: learningPresenter,
                          ),
                        ),
                        results: calculatorState.result == null
                            ? null
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  DsDividerRule(
                                    label: context.l10n.appResultsSection,
                                  ),
                                  SizedBox(height: context.tokens.spacing.lg),
                                  DsResultGrid(
                                    children: <Widget>[
                                      DsResultTile(
                                        label: calculator.results.first.label,
                                        value: AppNumberFormatter.decimal(
                                          calculatorState.result!.presentValue,
                                        ),
                                      ),
                                      if (insight != null)
                                        DsResultTile(
                                          label: context
                                              .l10n
                                              .bondCalculatorStatusLabel,
                                          value: _resolveStatusLabel(
                                            context,
                                            insight,
                                          ),
                                        ),
                                    ],
                                  ),
                                  if (insight != null) ...<Widget>[
                                    SizedBox(height: context.tokens.spacing.lg),
                                    BondInterpretationPanel(insight: insight),
                                  ],
                                ],
                              ),
                      );
                    },
              );
          }
        },
      ),
    );
  }

  String _resolveStatusLabel(BuildContext context, BondPriceInsight insight) {
    switch (insight.position) {
      case BondPricePosition.premium:
        return context.l10n.bondCalculatorStatusPremium;
      case BondPricePosition.atPar:
        return context.l10n.bondCalculatorStatusAtPar;
      case BondPricePosition.discount:
        return context.l10n.bondCalculatorStatusDiscount;
    }
  }

  String _resolveValidationMessage(BuildContext context, String key) {
    switch (key) {
      case 'validationPositiveNumbers':
        return context.l10n.validationPositiveNumbers;
      case 'validationWholeYearsRequired':
        return context.l10n.validationWholeYearsRequired;
      default:
        return context.l10n.appErrorBody;
    }
  }
}
