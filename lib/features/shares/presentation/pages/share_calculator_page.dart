import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/design_system/molecules/ds_status_panel.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_cubit.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_state.dart';
import 'package:finance_pro/features/shares/domain/entities/share_calculation_mode_x.dart';
import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/presentation/cubit/share_calculator_cubit.dart';
import 'package:finance_pro/features/shares/presentation/cubit/share_calculator_state.dart';
import 'package:finance_pro/features/shares/presentation/mappers/share_calculator_input_mapper.dart';
import 'package:finance_pro/features/shares/presentation/widgets/share_calculator_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShareCalculatorPage extends StatefulWidget {
  const ShareCalculatorPage({super.key});

  @override
  State<ShareCalculatorPage> createState() => _ShareCalculatorPageState();
}

class _ShareCalculatorPageState extends State<ShareCalculatorPage> {
  final GlobalKey _resultsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final AppDependencies dependencies = context.read<AppDependencies>();
    final String localeCode = Localizations.localeOf(context).languageCode;

    return MultiBlocProvider(
      key: ValueKey<String>('share-calculator:$localeCode'),
      providers: <BlocProvider<dynamic>>[
        BlocProvider<FeatureContentCubit>(
          create: (_) =>
              FeatureContentCubit(dependencies.loadFeatureContent)
                ..load(localeCode: localeCode, featureId: 'shares'),
        ),
        BlocProvider<ShareCalculatorCubit>(
          create: (_) => ShareCalculatorCubit(
            calculateShareValuation: dependencies.calculateShareValuation,
            inputMapper: const ShareCalculatorInputMapper(),
            validator: dependencies.shareInputValidator,
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
                  featureId: 'shares',
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

              return BlocListener<ShareCalculatorCubit, ShareCalculatorState>(
                listenWhen:
                    (
                      ShareCalculatorState previous,
                      ShareCalculatorState current,
                    ) =>
                        previous.result != current.result &&
                        current.result != null,
                listener: (BuildContext context, ShareCalculatorState state) {
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
                child: BlocBuilder<ShareCalculatorCubit, ShareCalculatorState>(
                  buildWhen:
                      (
                        ShareCalculatorState previous,
                        ShareCalculatorState current,
                      ) => previous.mode != current.mode,
                  builder: (BuildContext context, ShareCalculatorState state) {
                    final ShareCalculationMode mode = state.mode;
                    final String modeId = mode.contentId;

                    // PERF: Lazy Resolution Parsing - These O(N) operations
                    // only run when the calculator mode changes.
                    final CalculatorModeContent currentMode = calculator.modes
                        .firstWhere(
                          (CalculatorModeContent item) => item.id == modeId,
                        );

                    final TopicContent currentTopic = content.topics.firstWhere(
                      (TopicContent item) => item.id == modeId,
                    );

                    final List<CalculatorSectionContent> sections = calculator
                        .sections
                        .where(
                          (CalculatorSectionContent section) =>
                              section.modeIds.isEmpty ||
                              section.modeIds.contains(modeId),
                        )
                        .toList();

                    return ShareCalculatorForm(
                      calculator: calculator,
                      content: content,
                      currentMode: currentMode,
                      currentTopic: currentTopic,
                      mode: mode,
                      modeId: modeId,
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
