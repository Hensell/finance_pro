import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/design_system/atoms/ds_divider_rule.dart';
import 'package:finance_pro/design_system/molecules/ds_feature_card.dart';
import 'package:finance_pro/design_system/molecules/ds_metric_strip.dart';
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
      create: (BuildContext context) => HomeCubit(
        context.read<AppDependencies>().loadHomeContent,
      )..load(localeCode),
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
    final HomeModuleSummary? featuredModule =
        content.modules.isEmpty ? null : content.modules.first;
    final List<HomeModuleSummary> secondaryModules = content.modules.length > 1
        ? content.modules.skip(1).toList()
        : const <HomeModuleSummary>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DsPageIntro(
          eyebrow: content.eyebrow,
          title: content.title,
          summary: content.summary,
        ),
        SizedBox(height: tokens.layout.sectionGap),
        DsMetricStrip(
          items: content.highlights
              .map(
                (HomeHighlight highlight) => DsMetricItemData(
                  label: highlight.label,
                  value: highlight.value,
                ),
              )
              .toList(),
        ),
        if (featuredModule != null) ...<Widget>[
          SizedBox(height: tokens.layout.sectionGap),
          DsDividerRule(label: context.l10n.appTopicsSection),
          SizedBox(height: tokens.spacing.lg),
          DsFeatureCard(
            accent: featuredModule.accent,
            featureId: featuredModule.id,
            kicker: featuredModule.kicker,
            featured: true,
            onPressed: () =>
                context.go(AppRoutePaths.featureLocation(featuredModule.id)),
            summary: featuredModule.summary,
            title: featuredModule.title,
          ),
        ],
        if (secondaryModules.isNotEmpty) ...<Widget>[
          SizedBox(height: tokens.layout.sectionGap),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final int columns = constraints.maxWidth >=
                      tokens.layout.breakpointGridTwoColumn
                  ? 2
                  : 1;
              final double cardWidth = columns == 1
                  ? constraints.maxWidth
                  : (constraints.maxWidth -
                          ((columns - 1) * tokens.layout.gridGap)) /
                      columns;

              return Wrap(
                spacing: tokens.layout.gridGap,
                runSpacing: tokens.layout.gridGap,
                children: secondaryModules
                    .map(
                      (HomeModuleSummary module) => SizedBox(
                        width: cardWidth,
                        child: DsFeatureCard(
                          accent: module.accent,
                          featureId: module.id,
                          kicker: module.kicker,
                          onPressed: () =>
                              context.go(AppRoutePaths.featureLocation(module.id)),
                          summary: module.summary,
                          title: module.title,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ],
    );
  }
}
