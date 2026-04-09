import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/atoms/ds_divider_rule.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
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
    final bool splitLayout =
        MediaQuery.sizeOf(context).width >= tokens.layout.breakpointTwoColumn;
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
        Wrap(
          spacing: tokens.spacing.sm,
          runSpacing: tokens.spacing.sm,
          children: content.heroPoints
              .map((String point) => _PointChip(label: point))
              .toList(),
        ),
        SizedBox(height: tokens.layout.sectionGap),
        if (singleTopic == null) ...<Widget>[
          DsDividerRule(label: context.l10n.appTopicsSection),
          SizedBox(height: tokens.spacing.lg),
          ...content.topics.map(
            (TopicContent topic) => Padding(
              padding: EdgeInsets.only(bottom: tokens.spacing.md),
              child: DsFeatureTile(
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
          ),
        ] else ...<Widget>[
          DsDividerRule(label: context.l10n.appTopicSection),
          SizedBox(height: tokens.spacing.lg),
          _SingleTopicOverview(topic: singleTopic),
        ],
      ],
    );

    final Widget aside = DsAsidePanel(
      eyebrow: content.calculator == null
          ? context.l10n.appHighlightsSection
          : context.l10n.appCalculatorSection,
      title: content.calculator?.title ?? content.title,
      summary: content.calculator?.summary ?? content.summary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...content.heroPoints.map(
            (String point) => Padding(
              padding: EdgeInsets.only(bottom: tokens.spacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: tokens.spacing.xs),
                    child: Icon(
                      Icons.circle,
                      size: 7,
                      color: tokens.colors.secondary,
                    ),
                  ),
                  SizedBox(width: tokens.spacing.sm),
                  Expanded(child: DsText(point, tone: DsTextTone.bodyMuted)),
                ],
              ),
            ),
          ),
          if (content.calculator != null) ...<Widget>[
            SizedBox(height: tokens.spacing.lg),
            DsButton(
              label: context.l10n.appOpenCalculatorAction,
              onPressed: () =>
                  context.go(AppRoutePaths.calculatorLocation(content.id)),
              stretch: true,
            ),
          ],
        ],
      ),
    );

    if (!splitLayout) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (content.calculator != null) ...<Widget>[
            aside,
            SizedBox(height: tokens.layout.sectionGap),
          ],
          main,
          if (content.calculator == null) ...<Widget>[
            SizedBox(height: tokens.layout.sectionGap),
            aside,
          ],
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

class _PointChip extends StatelessWidget {
  const _PointChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.tokens.spacing.md,
        vertical: context.tokens.spacing.sm,
      ),
      decoration: BoxDecoration(
        color: context.tokens.colors.surfaceRaised,
        borderRadius: BorderRadius.circular(context.tokens.radii.round),
        border: Border.all(color: context.tokens.colors.border),
      ),
      child: DsText(label, tone: DsTextTone.label),
    );
  }
}
