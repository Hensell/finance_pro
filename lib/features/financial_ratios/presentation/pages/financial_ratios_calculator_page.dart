import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_aside_panel.dart';
import 'package:finance_pro/design_system/molecules/ds_page_intro.dart';
import 'package:finance_pro/design_system/molecules/ds_status_panel.dart';
import 'package:finance_pro/design_system/organisms/ds_calculator_frame.dart';
import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/presentation/cubit/financial_ratios_calculator_cubit.dart';
import 'package:finance_pro/features/financial_ratios/presentation/cubit/financial_ratios_calculator_state.dart';
import 'package:finance_pro/features/financial_ratios/presentation/mappers/financial_ratios_input_mapper.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_statements_draft.dart';
import 'package:finance_pro/features/financial_ratios/presentation/presenters/financial_ratios_learning_presenter.dart';
import 'package:finance_pro/features/financial_ratios/presentation/widgets/financial_ratio_group_view.dart';
import 'package:finance_pro/features/financial_ratios/presentation/widgets/financial_ratios_builder_stepper.dart';
import 'package:finance_pro/features/financial_ratios/presentation/widgets/financial_ratios_formula_panel.dart';
import 'package:finance_pro/features/financial_ratios/presentation/widgets/financial_ratios_issue_panel.dart';
import 'package:finance_pro/features/financial_ratios/presentation/widgets/financial_statements_summary_panel.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_cubit.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_state.dart';
import 'package:finance_pro/features/shared_content/presentation/widgets/calculator_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinancialRatiosCalculatorPage extends StatefulWidget {
  const FinancialRatiosCalculatorPage({super.key});

  @override
  State<FinancialRatiosCalculatorPage> createState() =>
      _FinancialRatiosCalculatorPageState();
}

class _FinancialRatiosCalculatorPageState
    extends State<FinancialRatiosCalculatorPage> {
  final GlobalKey _resultsKey = GlobalKey();
  final FinancialRatiosLearningPresenter _presenter =
      const FinancialRatiosLearningPresenter();
  final FinancialRatiosInputMapper _inputMapper =
      const FinancialRatiosInputMapper();

  @override
  Widget build(BuildContext context) {
    final AppDependencies dependencies = context.read<AppDependencies>();
    final String localeCode = Localizations.localeOf(context).languageCode;

    return MultiBlocProvider(
      key: ValueKey<String>('financial-ratios-calculator:$localeCode'),
      providers: <BlocProvider<dynamic>>[
        BlocProvider<FeatureContentCubit>(
          create: (_) =>
              FeatureContentCubit(dependencies.loadFeatureContent)
                ..load(localeCode: localeCode, featureId: 'financial_ratios'),
        ),
        BlocProvider<FinancialRatiosCalculatorCubit>(
          create: (_) => FinancialRatiosCalculatorCubit(
            calculateFinancialRatios: dependencies.calculateFinancialRatios,
            inputMapper: _inputMapper,
            validator: dependencies.financialRatiosInputValidator,
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
                  featureId: 'financial_ratios',
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

              return BlocListener<
                FinancialRatiosCalculatorCubit,
                FinancialRatiosCalculatorState
              >(
                listenWhen:
                    (
                      FinancialRatiosCalculatorState previous,
                      FinancialRatiosCalculatorState current,
                    ) =>
                        previous.currentStep != current.currentStep &&
                        current.currentStep ==
                            FinancialRatiosBuilderStep.results &&
                        current.result != null,
                listener:
                    (
                      BuildContext context,
                      FinancialRatiosCalculatorState state,
                    ) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        final BuildContext? resultsContext =
                            _resultsKey.currentContext;
                        if (!mounted || resultsContext == null) {
                          return;
                        }

                        Scrollable.ensureVisible(
                          resultsContext,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                          alignment: 0.08,
                        );
                      });
                    },
                child:
                    BlocBuilder<
                      FinancialRatiosCalculatorCubit,
                      FinancialRatiosCalculatorState
                    >(
                      builder:
                          (
                            BuildContext context,
                            FinancialRatiosCalculatorState calculatorState,
                          ) {
                            final CalculatorStepContent currentStepContent =
                                _resolveStepContent(
                                  calculator: calculator,
                                  step: calculatorState.currentStep,
                                );
                            final List<CalculatorSectionContent> sections =
                                calculator.sections
                                    .where(
                                      (CalculatorSectionContent section) =>
                                          section.stepId ==
                                          calculatorState.currentStep.id,
                                    )
                                    .toList();
                            final List<FinancialStatementsValidationIssue>
                            currentIssues =
                                switch (calculatorState.currentStep) {
                                  FinancialRatiosBuilderStep.incomeStatement =>
                                    calculatorState.incomeStatementIssues,
                                  FinancialRatiosBuilderStep.balanceSheet =>
                                    calculatorState.balanceSheetIssues,
                                  FinancialRatiosBuilderStep.results =>
                                    calculatorState.analysisIssues,
                                };
                            final Map<String, TopicContent> topics =
                                <String, TopicContent>{
                                  for (final TopicContent topic
                                      in content.topics)
                                    topic.id: topic,
                                };
                            final Map<String, ResultDescriptor> descriptors =
                                <String, ResultDescriptor>{
                                  for (final ResultDescriptor descriptor
                                      in calculator.results)
                                    descriptor.id: descriptor,
                                };

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
                                  FinancialRatiosBuilderStepper(
                                    currentStep: calculatorState.currentStep,
                                    onSelected: context
                                        .read<FinancialRatiosCalculatorCubit>()
                                        .goToStep,
                                    steps: calculator.steps,
                                  ),
                                  SizedBox(height: context.tokens.spacing.lg),
                                  DsText(
                                    currentStepContent.title,
                                    tone: DsTextTone.headline,
                                  ),
                                  SizedBox(height: context.tokens.spacing.xs),
                                  DsText(
                                    currentStepContent.summary,
                                    tone: DsTextTone.bodyMuted,
                                  ),
                                  if (calculatorState.currentStep !=
                                      FinancialRatiosBuilderStep
                                          .results) ...<Widget>[
                                    SizedBox(height: context.tokens.spacing.md),
                                    DsButton(
                                      label: context
                                          .l10n
                                          .financialRatiosLoadSampleAction,
                                      variant: DsButtonVariant.quiet,
                                      icon: Icons.data_object_rounded,
                                      onPressed: context
                                          .read<
                                            FinancialRatiosCalculatorCubit
                                          >()
                                          .fillWithSampleData,
                                    ),
                                  ],
                                  SizedBox(height: context.tokens.spacing.lg),
                                  if (calculatorState.currentStep !=
                                      FinancialRatiosBuilderStep
                                          .results) ...<Widget>[
                                    CalculatorSections(
                                      inputs: _sectionInputs(
                                        draft: calculatorState.draft,
                                        sections: sections,
                                      ),
                                      onChanged:
                                          (
                                            MapEntry<String, String> entry,
                                          ) => context
                                              .read<
                                                FinancialRatiosCalculatorCubit
                                              >()
                                              .updateField(
                                                entry.key,
                                                entry.value,
                                              ),
                                      sections: sections,
                                    ),
                                    FinancialRatiosIssuePanel(
                                      issues: currentIssues,
                                      highlightMessage:
                                          _resolveValidationMessage(
                                            context,
                                            calculatorState.validationKey,
                                          ),
                                    ),
                                    if (currentIssues.isNotEmpty ||
                                        calculatorState.validationKey != null)
                                      SizedBox(
                                        height: context.tokens.spacing.lg,
                                      ),
                                    FinancialStatementsSummaryPanel(
                                      currentStep: calculatorState.currentStep,
                                      derivedStatements:
                                          calculatorState.derivedStatements,
                                    ),
                                    SizedBox(height: context.tokens.spacing.lg),
                                    Row(
                                      children: <Widget>[
                                        if (calculatorState.currentStep !=
                                            FinancialRatiosBuilderStep
                                                .incomeStatement)
                                          DsButton(
                                            label: context.l10n.appBackAction,
                                            variant: DsButtonVariant.secondary,
                                            icon: null,
                                            onPressed: context
                                                .read<
                                                  FinancialRatiosCalculatorCubit
                                                >()
                                                .backStep,
                                          ),
                                        if (calculatorState.currentStep !=
                                            FinancialRatiosBuilderStep
                                                .incomeStatement)
                                          SizedBox(
                                            width: context.tokens.spacing.sm,
                                          ),
                                        DsButton(
                                          label:
                                              calculatorState.currentStep ==
                                                  FinancialRatiosBuilderStep
                                                      .balanceSheet
                                              ? calculator.submitLabel
                                              : context
                                                    .l10n
                                                    .financialRatiosContinueAction,
                                          onPressed: context
                                              .read<
                                                FinancialRatiosCalculatorCubit
                                              >()
                                              .continueStep,
                                        ),
                                      ],
                                    ),
                                  ] else
                                    Container(
                                      key: _resultsKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          FinancialRatioGroupView(
                                            descriptors: descriptors,
                                            onGroupSelected: context
                                                .read<
                                                  FinancialRatiosCalculatorCubit
                                                >()
                                                .selectResultGroup,
                                            presenter: _presenter,
                                            result: calculatorState.result!,
                                            selectedGroupId:
                                                calculatorState.selectedGroupId,
                                            topics: topics,
                                          ),
                                          SizedBox(
                                            height: context.tokens.spacing.lg,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              DsButton(
                                                label:
                                                    context.l10n.appBackAction,
                                                variant:
                                                    DsButtonVariant.secondary,
                                                icon: null,
                                                onPressed: context
                                                    .read<
                                                      FinancialRatiosCalculatorCubit
                                                    >()
                                                    .backStep,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              aside: DsAsidePanel(
                                eyebrow: context.l10n.appFormulaSection,
                                title:
                                    calculatorState.currentStep ==
                                        FinancialRatiosBuilderStep.results
                                    ? topics[calculatorState.selectedGroupId]
                                              ?.title ??
                                          currentStepContent.title
                                    : currentStepContent.title,
                                summary:
                                    calculatorState.currentStep ==
                                        FinancialRatiosBuilderStep.results
                                    ? topics[calculatorState.selectedGroupId]
                                              ?.summary ??
                                          currentStepContent.summary
                                    : currentStepContent.summary,
                                child: FinancialRatiosFormulaPanel(
                                  calculator: calculator,
                                  currentStep: calculatorState.currentStep,
                                  selectedGroupId:
                                      calculatorState.selectedGroupId,
                                ),
                              ),
                            );
                          },
                    ),
              );
          }
        },
      ),
    );
  }

  CalculatorStepContent _resolveStepContent({
    required CalculatorDescriptor calculator,
    required FinancialRatiosBuilderStep step,
  }) {
    return calculator.steps.firstWhere(
      (CalculatorStepContent item) => item.id == step.id,
      orElse: () =>
          CalculatorStepContent(id: step.id, title: step.id, summary: step.id),
    );
  }

  Map<String, String> _sectionInputs({
    required FinancialStatementsDraft draft,
    required List<CalculatorSectionContent> sections,
  }) {
    final Map<String, String> values = <String, String>{};
    for (final CalculatorSectionContent section in sections) {
      for (final CalculatorFieldContent field in section.fields) {
        values[field.id] = draft.valueFor(field.id) ?? '';
      }
    }

    return values;
  }

  String? _resolveValidationMessage(
    BuildContext context,
    String? validationKey,
  ) {
    if (validationKey == null) {
      return null;
    }

    switch (validationKey) {
      case 'financialRatiosValidationNumeric':
        return context.l10n.financialRatiosValidationNumeric;
      case 'financialRatiosValidationNetSalesNegative':
        return context.l10n.financialRatiosValidationNetSalesNegative;
      case 'financialRatiosValidationNegativeCostOfSales':
        return context.l10n.financialRatiosValidationNegativeCostOfSales;
      case 'financialRatiosValidationGrossProfitInconsistent':
        return context.l10n.financialRatiosValidationGrossProfitInconsistent;
      case 'financialRatiosValidationOperatingIncomeInconsistent':
        return context
            .l10n
            .financialRatiosValidationOperatingIncomeInconsistent;
      case 'financialRatiosValidationNetReceivablesNegative':
        return context.l10n.financialRatiosValidationNetReceivablesNegative;
      case 'financialRatiosValidationFixedAssetsNegative':
        return context.l10n.financialRatiosValidationFixedAssetsNegative;
      case 'financialRatiosValidationTotalAssetsRequired':
        return context.l10n.financialRatiosValidationTotalAssetsRequired;
      case 'financialRatiosValidationCompleteIncomeStatement':
        return context.l10n.financialRatiosValidationCompleteIncomeStatement;
      case 'financialRatiosValidationCompleteBalanceSheet':
        return context.l10n.financialRatiosValidationCompleteBalanceSheet;
      case 'financialRatiosValidationBalanceMismatch':
        return context.l10n.financialRatiosValidationBalanceMismatch;
      case 'financialRatiosValidationInventoryMismatch':
        return context.l10n.financialRatiosValidationInventoryMismatch;
      case 'validationNonNegativeNumbers':
        return context.l10n.validationNonNegativeNumbers;
      default:
        return validationKey;
    }
  }
}
