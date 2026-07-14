import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/atoms/ds_divider_rule.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_academic_note.dart';
import 'package:finance_pro/design_system/molecules/ds_aside_panel.dart';
import 'package:finance_pro/design_system/molecules/ds_feature_tile.dart';
import 'package:finance_pro/design_system/molecules/ds_page_intro.dart';
import 'package:finance_pro/design_system/molecules/ds_status_panel.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_cubit.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_state.dart';
import 'package:finance_pro/features/shared_content/presentation/widgets/content_section_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureOverviewPage extends StatelessWidget {
  const FeatureOverviewPage({required this.featureId, super.key});

  final String featureId;

  @override
  Widget build(BuildContext context) {
    final String localeCode = Localizations.localeOf(context).languageCode;

    return BlocProvider<FeatureContentCubit>(
      key: ValueKey<String>('feature:$localeCode:$featureId'),
      create: (BuildContext context) => FeatureContentCubit(
        context.read<AppDependencies>().loadFeatureContent,
      )..load(localeCode: localeCode, featureId: featureId),
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
                  featureId: featureId,
                ),
              );
            case AppLoadStatus.success:
              final FeatureContent? content = state.content;
              if (content == null) {
                return DsStatusPanel(
                  title: context.l10n.appEmptyTitle,
                  body: context.l10n.appEmptyBody,
                );
              }

              return _FeatureOverviewBody(content: content);
          }
        },
      ),
    );
  }
}

class _FeatureOverviewBody extends StatelessWidget {
  const _FeatureOverviewBody({required this.content});

  final FeatureContent content;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final TopicContent? singleTopic = content.topics.length == 1
        ? content.topics.first
        : null;
    final CalculatorDescriptor? calculator = content.calculator;
    final Widget main = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DsPageIntro(
          eyebrow: content.eyebrow,
          title: content.title,
          summary: content.summary,
          compact: true,
        ),
        SizedBox(height: tokens.spacing.xl),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content.heroPoints
              .map((String point) => _LearningPoint(label: point))
              .toList(),
        ),
        SizedBox(height: tokens.layout.sectionGap),
        if (singleTopic == null) ...<Widget>[
          DsDividerRule(label: context.l10n.appTopicsSection),
          SizedBox(height: tokens.spacing.lg),
          ...content.topics.map(
            (TopicContent topic) => DsFeatureTile(
              actionLabel: context.l10n.appReadTopicAction,
              title: topic.title,
              summary: topic.summary,
              onPressed: () => context.go(
                AppRoutePaths.topicLocation(
                  featureId: content.id,
                  topicId: topic.id,
                ),
              ),
            ),
          ),
        ] else ...<Widget>[
          DsDividerRule(label: context.l10n.appTopicSection),
          SizedBox(height: tokens.spacing.lg),
          _SingleTopicOverview(topic: singleTopic),
        ],
        SizedBox(height: tokens.layout.sectionGap),
        const DsAcademicNote(),
      ],
    );

    final Widget? aside = calculator == null
        ? null
        : DsAsidePanel(
            eyebrow: context.l10n.appCalculatorSection,
            title: calculator.title,
            summary: calculator.summary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DsButton(
                  label: context.l10n.appOpenCalculatorAction,
                  onPressed: () =>
                      context.go(AppRoutePaths.calculatorLocation(content.id)),
                  stretch: true,
                ),
              ],
            ),
          );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool splitLayout = aside != null && constraints.maxWidth >= 1040;

        if (aside == null) {
          return main;
        }

        if (!splitLayout) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              main,
              SizedBox(height: tokens.layout.sectionGap),
              aside,
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: main),
            SizedBox(width: tokens.layout.gridGap),
            SizedBox(width: tokens.layout.asideWidth, child: aside),
          ],
        );
      },
    );
  }
}

class _SingleTopicOverview extends StatelessWidget {
  const _SingleTopicOverview({required this.topic});

  final TopicContent topic;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DsText(topic.title, tone: DsTextTone.headline),
        SizedBox(height: tokens.spacing.sm),
        DsText(topic.summary, tone: DsTextTone.bodyMuted),
        SizedBox(height: tokens.spacing.lg),
        ...topic.sections.map(
          (ContentSection section) => Padding(
            padding: EdgeInsets.only(bottom: tokens.spacing.md),
            child: ContentSectionView(section: section),
          ),
        ),
      ],
    );
  }
}

class _LearningPoint extends StatelessWidget {
  const _LearningPoint({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Padding(
      padding: EdgeInsets.only(bottom: tokens.spacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: tokens.spacing.sm),
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: tokens.colors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: tokens.spacing.sm),
          Expanded(child: DsText(label, tone: DsTextTone.bodyMuted)),
        ],
      ),
    );
  }
}
