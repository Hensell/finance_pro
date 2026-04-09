import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/presentation/presenters/financial_ratios_learning_presenter.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter/material.dart';

class FinancialRatioGroupView extends StatelessWidget {
  const FinancialRatioGroupView({
    required this.descriptors,
    required this.onGroupSelected,
    required this.presenter,
    required this.result,
    required this.selectedGroupId,
    required this.topics,
    super.key,
  });

  final Map<String, ResultDescriptor> descriptors;
  final ValueChanged<String> onGroupSelected;
  final FinancialRatiosLearningPresenter presenter;
  final FinancialRatiosResult result;
  final String selectedGroupId;
  final Map<String, TopicContent> topics;

  @override
  Widget build(BuildContext context) {
    final FinancialRatioGroupResult selectedGroup = result.groups.firstWhere(
      (FinancialRatioGroupResult group) => group.id == selectedGroupId,
      orElse: () => result.groups.first,
    );
    final TopicContent? topic = topics[selectedGroup.id];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          spacing: context.tokens.spacing.sm,
          runSpacing: context.tokens.spacing.sm,
          children: result.groups
              .map(
                (FinancialRatioGroupResult group) => _GroupChip(
                  isActive: group.id == selectedGroup.id,
                  label: topics[group.id]?.title ?? group.id,
                  onTap: () => onGroupSelected(group.id),
                ),
              )
              .toList(),
        ),
        SizedBox(height: context.tokens.spacing.lg),
        if (topic != null) ...<Widget>[
          DsText(topic.title, tone: DsTextTone.headline),
          SizedBox(height: context.tokens.spacing.xs),
          DsText(topic.summary, tone: DsTextTone.bodyMuted),
          SizedBox(height: context.tokens.spacing.lg),
        ],
        Wrap(
          spacing: context.tokens.layout.gridGap,
          runSpacing: context.tokens.spacing.md,
          children: selectedGroup.metrics
              .map(
                (FinancialRatioMetric metric) => _MetricCard(
                  descriptor: descriptors[metric.id],
                  metric: metric,
                  presenter: presenter,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _GroupChip extends StatelessWidget {
  const _GroupChip({
    required this.isActive,
    required this.label,
    required this.onTap,
  });

  final bool isActive;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(tokens.radii.round),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: tokens.spacing.md,
          vertical: tokens.spacing.sm,
        ),
        decoration: BoxDecoration(
          color: isActive
              ? tokens.colors.secondary.withValues(alpha: 0.12)
              : tokens.colors.surfaceRaised,
          borderRadius: BorderRadius.circular(tokens.radii.round),
          border: Border.all(
            color: isActive ? tokens.colors.secondary : tokens.colors.border,
          ),
        ),
        child: DsText(
          label,
          tone: DsTextTone.label,
          color: isActive ? tokens.colors.secondary : tokens.colors.onSurface,
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.descriptor,
    required this.metric,
    required this.presenter,
  });

  final ResultDescriptor? descriptor;
  final FinancialRatioMetric metric;
  final FinancialRatiosLearningPresenter presenter;

  @override
  Widget build(BuildContext context) {
    final ResultDescriptor resolvedDescriptor =
        descriptor ?? ResultDescriptor(id: metric.id, label: metric.id);
    final DidacticRangeContent? didacticRange = presenter.resolveRange(
      resolvedDescriptor,
      metric,
    );
    final tokens = context.tokens;

    return SizedBox(
      width:
          MediaQuery.sizeOf(context).width >=
              tokens.layout.breakpointGridTwoColumn
          ? (tokens.layout.maxReadingWidth - tokens.layout.gridGap) / 2
          : double.infinity,
      child: DsReadingSection(
        title: resolvedDescriptor.label,
        summary: resolvedDescriptor.summary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DsText(
              presenter.formatMetric(resolvedDescriptor, metric),
              tone: DsTextTone.title,
            ),
            if (resolvedDescriptor.formula != null) ...<Widget>[
              SizedBox(height: tokens.spacing.sm),
              DsText(
                resolvedDescriptor.formula!,
                tone: DsTextTone.caption,
                color: tokens.colors.secondary,
              ),
            ],
            if (didacticRange != null) ...<Widget>[
              SizedBox(height: tokens.spacing.md),
              Container(
                padding: EdgeInsets.all(tokens.spacing.sm),
                decoration: BoxDecoration(
                  color: tokens.colors.surfaceRaised,
                  borderRadius: BorderRadius.circular(tokens.radii.md),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DsText(didacticRange.label, tone: DsTextTone.label),
                    SizedBox(height: tokens.spacing.xs),
                    DsText(didacticRange.summary, tone: DsTextTone.bodyMuted),
                  ],
                ),
              ),
            ],
            if (metric.note != null) ...<Widget>[
              SizedBox(height: tokens.spacing.md),
              DsText(
                _resolveNote(context, metric.note!),
                tone: DsTextTone.bodyMuted,
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _resolveNote(BuildContext context, String noteKey) {
    switch (noteKey) {
      case 'financialRatiosMetricCurrentRatioNote':
        return context.l10n.financialRatiosMetricCurrentRatioNote;
      case 'financialRatiosMetricQuickRatioNote':
        return context.l10n.financialRatiosMetricQuickRatioNote;
      case 'financialRatiosMetricCashRatioNote':
        return context.l10n.financialRatiosMetricCashRatioNote;
      case 'financialRatiosMetricInventoryTurnoverNote':
        return context.l10n.financialRatiosMetricInventoryTurnoverNote;
      case 'financialRatiosMetricDaysInventoryNote':
        return context.l10n.financialRatiosMetricDaysInventoryNote;
      case 'financialRatiosMetricReceivablesTurnoverNote':
        return context.l10n.financialRatiosMetricReceivablesTurnoverNote;
      case 'financialRatiosMetricCollectionPeriodNote':
        return context.l10n.financialRatiosMetricCollectionPeriodNote;
      case 'financialRatiosMetricPayablesTurnoverNote':
        return context.l10n.financialRatiosMetricPayablesTurnoverNote;
      case 'financialRatiosMetricPaymentPeriodNote':
        return context.l10n.financialRatiosMetricPaymentPeriodNote;
      case 'financialRatiosMetricTotalAssetTurnoverNote':
        return context.l10n.financialRatiosMetricTotalAssetTurnoverNote;
      case 'financialRatiosMetricFixedAssetTurnoverNote':
        return context.l10n.financialRatiosMetricFixedAssetTurnoverNote;
      case 'financialRatiosMetricDebtRatioNote':
        return context.l10n.financialRatiosMetricDebtRatioNote;
      case 'financialRatiosMetricDebtToEquityNote':
        return context.l10n.financialRatiosMetricDebtToEquityNote;
      case 'financialRatiosMetricEquityMultiplierNote':
        return context.l10n.financialRatiosMetricEquityMultiplierNote;
      case 'financialRatiosMetricInterestCoverageNote':
        return context.l10n.financialRatiosMetricInterestCoverageNote;
      case 'financialRatiosMetricGrossMarginNote':
        return context.l10n.financialRatiosMetricGrossMarginNote;
      case 'financialRatiosMetricOperatingMarginNote':
        return context.l10n.financialRatiosMetricOperatingMarginNote;
      case 'financialRatiosMetricNetMarginNote':
        return context.l10n.financialRatiosMetricNetMarginNote;
      case 'financialRatiosMetricReturnOnAssetsNote':
        return context.l10n.financialRatiosMetricReturnOnAssetsNote;
      case 'financialRatiosMetricReturnOnEquityNote':
        return context.l10n.financialRatiosMetricReturnOnEquityNote;
      case 'financialRatiosMetricDupontNetMarginNote':
        return context.l10n.financialRatiosMetricDupontNetMarginNote;
      case 'financialRatiosMetricDupontAssetTurnoverNote':
        return context.l10n.financialRatiosMetricDupontAssetTurnoverNote;
      case 'financialRatiosMetricDupontEquityMultiplierNote':
        return context.l10n.financialRatiosMetricDupontEquityMultiplierNote;
      case 'financialRatiosMetricDupontRoeNote':
        return context.l10n.financialRatiosMetricDupontRoeNote;
      default:
        return noteKey;
    }
  }
}
