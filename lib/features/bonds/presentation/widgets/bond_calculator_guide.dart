import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:flutter/material.dart';

class BondCalculatorGuide extends StatelessWidget {
  const BondCalculatorGuide({required this.note, super.key});

  final String? note;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final bool stacked =
        MediaQuery.sizeOf(context).width < tokens.layout.breakpointTwoColumn;
    final List<_GuideStepData> steps = <_GuideStepData>[
      _GuideStepData(
        number: 1,
        title: context.l10n.bondCalculatorGuideStepCashTitle,
        body: context.l10n.bondCalculatorGuideStepCashBody,
      ),
      _GuideStepData(
        number: 2,
        title: context.l10n.bondCalculatorGuideStepMarketTitle,
        body: context.l10n.bondCalculatorGuideStepMarketBody,
      ),
      _GuideStepData(
        number: 3,
        title: context.l10n.bondCalculatorGuideStepDecisionTitle,
        body: context.l10n.bondCalculatorGuideStepDecisionBody,
      ),
    ];

    return DsReadingSection(
      title: context.l10n.bondCalculatorGuideTitle,
      summary: note,
      child: stacked
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: steps
                  .map(
                    (_GuideStepData step) => Padding(
                      padding: EdgeInsets.only(bottom: tokens.spacing.md),
                      child: _GuideStepCard(step: step),
                    ),
                  )
                  .toList(),
            )
          : Wrap(
              spacing: tokens.layout.gridGap,
              runSpacing: tokens.spacing.md,
              children: steps
                  .map(
                    (_GuideStepData step) =>
                        SizedBox(width: 220, child: _GuideStepCard(step: step)),
                  )
                  .toList(),
            ),
    );
  }
}

class _GuideStepCard extends StatelessWidget {
  const _GuideStepCard({required this.step});

  final _GuideStepData step;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Container(
      padding: EdgeInsets.all(tokens.spacing.md),
      decoration: BoxDecoration(
        color: tokens.colors.surfaceRaised,
        borderRadius: BorderRadius.circular(tokens.radii.md),
        border: Border.all(color: tokens.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: tokens.colors.primarySoft,
              borderRadius: BorderRadius.circular(tokens.radii.round),
            ),
            child: DsText(
              step.number.toString(),
              tone: DsTextTone.label,
              color: tokens.colors.primary,
            ),
          ),
          SizedBox(height: tokens.spacing.sm),
          DsText(step.title, tone: DsTextTone.label),
          SizedBox(height: tokens.spacing.xs),
          DsText(step.body, tone: DsTextTone.bodyMuted),
        ],
      ),
    );
  }
}

class _GuideStepData {
  const _GuideStepData({
    required this.body,
    required this.number,
    required this.title,
  });

  final String body;
  final int number;
  final String title;
}
