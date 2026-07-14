import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/design_system/molecules/ds_status_panel.dart';
import 'package:finance_pro/features/lease/presentation/cubit/lease_calculator_cubit.dart';
import 'package:finance_pro/features/lease/presentation/cubit/lease_calculator_state.dart';
import 'package:finance_pro/features/lease/presentation/widgets/lease_calculator_form.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_cubit.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaseCalculatorPage extends StatefulWidget {
  const LeaseCalculatorPage({super.key});

  @override
  State<LeaseCalculatorPage> createState() => _LeaseCalculatorPageState();
}

class _LeaseCalculatorPageState extends State<LeaseCalculatorPage> {
  final GlobalKey _resultsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final AppDependencies dependencies = context.read<AppDependencies>();
    final String localeCode = Localizations.localeOf(context).languageCode;

    return MultiBlocProvider(
      key: ValueKey<String>('lease-calculator:$localeCode'),
      providers: <BlocProvider<dynamic>>[
        BlocProvider<FeatureContentCubit>(
          create: (_) =>
              FeatureContentCubit(dependencies.loadFeatureContent)
                ..load(localeCode: localeCode, featureId: 'lease'),
        ),
        BlocProvider<LeaseCalculatorCubit>(
          create: (_) => LeaseCalculatorCubit(
            calculateLeaseComparison: dependencies.calculateLeaseComparison,
            validator: dependencies.leaseInputValidator,
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
                  featureId: 'lease',
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

              return BlocListener<LeaseCalculatorCubit, LeaseCalculatorState>(
                listenWhen:
                    (
                      LeaseCalculatorState previous,
                      LeaseCalculatorState current,
                    ) =>
                        previous.result != current.result &&
                        current.result != null,
                listener: (BuildContext context, LeaseCalculatorState state) {
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
                    final Map<String, ResultDescriptor> resultsById =
                        <String, ResultDescriptor>{
                          for (final ResultDescriptor descriptor
                              in calculator.results)
                            descriptor.id: descriptor,
                        };

                    return LeaseCalculatorForm(
                      calculator: calculator,
                      content: content,
                      resultsById: resultsById,
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
