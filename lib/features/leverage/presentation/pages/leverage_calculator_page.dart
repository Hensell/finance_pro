import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/design_system/molecules/ds_status_panel.dart';
import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:finance_pro/features/leverage/domain/entities/leverage_mode_x.dart';
import 'package:finance_pro/features/leverage/presentation/cubit/leverage_calculator_cubit.dart';
import 'package:finance_pro/features/leverage/presentation/cubit/leverage_calculator_state.dart';
import 'package:finance_pro/features/leverage/presentation/widgets/leverage_calculator_form.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_cubit.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeverageCalculatorPage extends StatefulWidget {
  const LeverageCalculatorPage({super.key});

  @override
  State<LeverageCalculatorPage> createState() => _LeverageCalculatorPageState();
}

class _LeverageCalculatorPageState extends State<LeverageCalculatorPage> {
  final GlobalKey _resultsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final AppDependencies dependencies = context.read<AppDependencies>();
    final String localeCode = Localizations.localeOf(context).languageCode;

    return MultiBlocProvider(
      key: ValueKey<String>('leverage-calculator:$localeCode'),
      providers: <BlocProvider<dynamic>>[
        BlocProvider<FeatureContentCubit>(
          create: (_) =>
              FeatureContentCubit(dependencies.loadFeatureContent)
                ..load(localeCode: localeCode, featureId: 'leverage'),
        ),
        BlocProvider<LeverageCalculatorCubit>(
          create: (_) => LeverageCalculatorCubit(
            calculateFinancialLeverage: dependencies.calculateFinancialLeverage,
            calculateOperatingLeverage: dependencies.calculateOperatingLeverage,
            validator: dependencies.leverageInputValidator,
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
                  featureId: 'leverage',
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
                LeverageCalculatorCubit,
                LeverageCalculatorState
              >(
                listenWhen:
                    (
                      LeverageCalculatorState previous,
                      LeverageCalculatorState current,
                    ) =>
                        previous.result != current.result &&
                        current.result != null,
                listener:
                    (BuildContext context, LeverageCalculatorState state) {
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
                      LeverageCalculatorCubit,
                      LeverageCalculatorState
                    >(
                      buildWhen:
                          (
                            LeverageCalculatorState previous,
                            LeverageCalculatorState current,
                          ) => previous.mode != current.mode,
                      builder:
                          (
                            BuildContext context,
                            LeverageCalculatorState state,
                          ) {
                            final LeverageMode mode = state.mode;
                            final String selectedModeId = mode.calculatorModeId;

                            // PERF: Lazy Resolution Parsing - These O(N) operations
                            // only run when the calculator mode changes.
                            final TopicContent currentTopic = content.topics
                                .firstWhere(
                                  (TopicContent item) =>
                                      item.id == mode.topicId,
                                );

                            final List<CalculatorSectionContent> sections =
                                calculator.sections
                                    .where(
                                      (CalculatorSectionContent section) =>
                                          section.modeIds.isEmpty ||
                                          section.modeIds.contains(
                                            selectedModeId,
                                          ),
                                    )
                                    .toList();

                            final CalculatorModeContent currentMode = calculator
                                .modes
                                .firstWhere(
                                  (CalculatorModeContent item) =>
                                      item.id == selectedModeId,
                                );

                            return LeverageCalculatorForm(
                              calculator: calculator,
                              content: content,
                              currentMode: currentMode,
                              currentTopic: currentTopic,
                              mode: mode,
                              resultsKey: _resultsKey,
                              sections: sections,
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
