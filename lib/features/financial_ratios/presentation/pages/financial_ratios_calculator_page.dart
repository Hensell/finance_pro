import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/design_system/molecules/ds_status_panel.dart';
import 'package:finance_pro/features/financial_ratios/presentation/cubit/financial_ratios_calculator_cubit.dart';
import 'package:finance_pro/features/financial_ratios/presentation/cubit/financial_ratios_calculator_state.dart';
import 'package:finance_pro/features/financial_ratios/presentation/mappers/financial_ratios_input_mapper.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:finance_pro/features/financial_ratios/presentation/widgets/financial_ratios_calculator_form.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_cubit.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_state.dart';
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
                child: Builder(
                  builder: (BuildContext context) {
                    final Map<String, TopicContent> topics =
                        <String, TopicContent>{
                          for (final TopicContent topic in content.topics)
                            topic.id: topic,
                        };
                    final Map<String, ResultDescriptor> descriptors =
                        <String, ResultDescriptor>{
                          for (final ResultDescriptor descriptor
                              in calculator.results)
                            descriptor.id: descriptor,
                        };

                    return FinancialRatiosCalculatorForm(
                      calculator: calculator,
                      content: content,
                      topics: topics,
                      descriptors: descriptors,
                      resultsKey: _resultsKey,
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
