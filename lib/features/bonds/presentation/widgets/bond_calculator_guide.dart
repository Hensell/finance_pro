import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/molecules/ds_guide_steps.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:flutter/material.dart';

class BondCalculatorGuide extends StatelessWidget {
  const BondCalculatorGuide({required this.note, super.key});

  final String? note;

  @override
  Widget build(BuildContext context) {
    final List<DsGuideStep> steps = <DsGuideStep>[
      DsGuideStep(
        title: context.l10n.bondCalculatorGuideStepCashTitle,
        body: context.l10n.bondCalculatorGuideStepCashBody,
      ),
      DsGuideStep(
        title: context.l10n.bondCalculatorGuideStepMarketTitle,
        body: context.l10n.bondCalculatorGuideStepMarketBody,
      ),
      DsGuideStep(
        title: context.l10n.bondCalculatorGuideStepDecisionTitle,
        body: context.l10n.bondCalculatorGuideStepDecisionBody,
      ),
    ];

    return DsReadingSection(
      title: context.l10n.bondCalculatorGuideTitle,
      summary: note,
      child: DsGuideSteps(steps: steps),
    );
  }
}
