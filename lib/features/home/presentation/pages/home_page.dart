import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_page_intro.dart';
import 'package:finance_pro/design_system/molecules/ds_status_panel.dart';
import 'package:finance_pro/features/home/domain/entities/home_content.dart';
import 'package:finance_pro/features/home/presentation/cubit/home_cubit.dart';
import 'package:finance_pro/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String localeCode = Localizations.localeOf(context).languageCode;

    return BlocProvider<HomeCubit>(
      key: ValueKey<String>('home:$localeCode'),
      create: (BuildContext context) =>
          HomeCubit(context.read<AppDependencies>().loadHomeContent)
            ..load(localeCode),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
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
                onAction: () => context.read<HomeCubit>().load(localeCode),
              );
            case AppLoadStatus.success:
              final HomeContent? content = state.content;
              if (content == null) {
                return DsStatusPanel(
                  title: context.l10n.appEmptyTitle,
                  body: context.l10n.appEmptyBody,
                );
              }

              return _HomeBody(content: content);
          }
        },
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({required this.content});

  final HomeContent content;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final HomeModuleSummary? featuredModule = content.modules.isEmpty
        ? null
        : content.modules.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DsPageIntro(title: content.title, summary: content.summary),
        if (featuredModule != null) ...<Widget>[
          SizedBox(height: tokens.spacing.lg),
          Wrap(
            spacing: tokens.spacing.sm,
            runSpacing: tokens.spacing.sm,
            children: <Widget>[
              DsButton(
                label: context.l10n.homeStartAction,
                onPressed: () => context.go(
                  AppRoutePaths.featureLocation(featuredModule.id),
                ),
              ),
              DsButton(
                label: context.l10n.homePracticeAction,
                variant: DsButtonVariant.ghost,
                onPressed: () => context.go(
                  AppRoutePaths.calculatorLocation(featuredModule.id),
                ),
              ),
            ],
          ),
        ],
        if (content.modules.isNotEmpty) ...<Widget>[
          SizedBox(height: tokens.spacing.xxl),
          DsText(context.l10n.homeModulesSection, tone: DsTextTone.title),
          SizedBox(height: tokens.spacing.md),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: tokens.colors.divider)),
            ),
            child: Column(
              children: <Widget>[
                for (int index = 0; index < content.modules.length; index += 1)
                  _HomeModuleRow(
                    index: index + 1,
                    module: content.modules[index],
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _HomeModuleRow extends StatelessWidget {
  const _HomeModuleRow({required this.index, required this.module});

  final int index;
  final HomeModuleSummary module;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.go(AppRoutePaths.featureLocation(module.id)),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: tokens.colors.divider)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: tokens.spacing.lg),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 44,
                  child: DsText(
                    index.toString().padLeft(2, '0'),
                    tone: DsTextTone.caption,
                    color: tokens.colors.onSurfaceMuted,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DsText(module.title, tone: DsTextTone.title),
                      SizedBox(height: tokens.spacing.xs),
                      DsText(module.summary, tone: DsTextTone.bodyMuted),
                      SizedBox(height: tokens.spacing.xs),
                      DsText(
                        module.kicker,
                        tone: DsTextTone.caption,
                        color: tokens.colors.secondary,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: tokens.spacing.md),
                Padding(
                  padding: EdgeInsets.only(top: tokens.spacing.xs),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 20,
                    color: tokens.colors.onSurfaceMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
