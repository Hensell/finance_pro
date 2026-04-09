import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/core/state/app_load_status.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/molecules/ds_aside_panel.dart';
import 'package:finance_pro/design_system/molecules/ds_page_intro.dart';
import 'package:finance_pro/design_system/molecules/ds_status_panel.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_cubit.dart';
import 'package:finance_pro/features/shared_content/presentation/cubit/feature_content_state.dart';
import 'package:finance_pro/features/shared_content/presentation/widgets/content_section_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({required this.featureId, required this.topicId, super.key});

  final String featureId;
  final String topicId;

  @override
  Widget build(BuildContext context) {
    final String localeCode = Localizations.localeOf(context).languageCode;

    return BlocProvider<FeatureContentCubit>(
      key: ValueKey<String>('topic:$localeCode:$featureId:$topicId'),
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
              );
            case AppLoadStatus.success:
              final FeatureContent? content = state.content;
              TopicContent? topic;
              if (content != null) {
                for (final TopicContent item in content.topics) {
                  if (item.id == topicId) {
                    topic = item;
                    break;
                  }
                }
              }

              if (content == null || topic == null) {
                return DsStatusPanel(
                  title: context.l10n.appEmptyTitle,
                  body: context.l10n.appEmptyBody,
                );
              }

              if (content.topics.length == 1) {
                return _SingleTopicRedirect(featureId: content.id);
              }

              return _TopicBody(content: content, topic: topic);
          }
        },
      ),
    );
  }
}

class _SingleTopicRedirect extends StatefulWidget {
  const _SingleTopicRedirect({required this.featureId});

  final String featureId;

  @override
  State<_SingleTopicRedirect> createState() => _SingleTopicRedirectState();
}

class _SingleTopicRedirectState extends State<_SingleTopicRedirect> {
  bool _redirectScheduled = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_redirectScheduled) {
      return;
    }

    _redirectScheduled = true;
    final GoRouter router = GoRouter.of(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      router.go(AppRoutePaths.featureLocation(widget.featureId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return DsStatusPanel(
      title: context.l10n.appLoadingTitle,
      body: context.l10n.appLoadingBody,
    );
  }
}

class _TopicBody extends StatelessWidget {
  const _TopicBody({required this.content, required this.topic});

  final FeatureContent content;
  final TopicContent topic;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final bool splitLayout =
        MediaQuery.sizeOf(context).width >= tokens.layout.breakpointTwoColumn;
    final Widget main = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DsButton(
          label: context.l10n.appBackHomeAction,
          onPressed: () =>
              context.go(AppRoutePaths.featureLocation(content.id)),
          variant: DsButtonVariant.ghost,
          icon: Icons.arrow_back_rounded,
        ),
        SizedBox(height: tokens.spacing.lg),
        DsPageIntro(
          eyebrow: content.title,
          title: topic.title,
          summary: topic.summary,
          compact: true,
        ),
        SizedBox(height: tokens.layout.sectionGap),
        ...topic.sections.map(
          (ContentSection section) => Padding(
            padding: EdgeInsets.only(bottom: tokens.spacing.md),
            child: ContentSectionView(section: section),
          ),
        ),
      ],
    );

    final Widget aside = DsAsidePanel(
      eyebrow: content.title,
      title: topic.title,
      summary: content.summary,
      child: content.calculator == null
          ? const SizedBox.shrink()
          : DsButton(
              label: context.l10n.appOpenCalculatorAction,
              onPressed: () =>
                  context.go(AppRoutePaths.calculatorLocation(content.id)),
              stretch: true,
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
