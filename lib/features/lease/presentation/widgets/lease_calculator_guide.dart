import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/molecules/ds_guide_steps.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:flutter/material.dart';

class LeaseCalculatorGuide extends StatelessWidget {
  const LeaseCalculatorGuide({required this.note, super.key});

  final String? note;

  @override
  Widget build(BuildContext context) {
    final List<DsGuideStep> steps = <DsGuideStep>[
      DsGuideStep(
        title: context.l10n.leaseCalculatorGuideStepLeaseTitle,
        body: context.l10n.leaseCalculatorGuideStepLeaseBody,
      ),
      DsGuideStep(
        title: context.l10n.leaseCalculatorGuideStepBuyTitle,
        body: context.l10n.leaseCalculatorGuideStepBuyBody,
      ),
      DsGuideStep(
        title: context.l10n.leaseCalculatorGuideStepDecisionTitle,
        body: context.l10n.leaseCalculatorGuideStepDecisionBody,
      ),
    ];

    return DsReadingSection(
      title: context.l10n.leaseCalculatorGuideTitle,
      summary: note,
      child: DsGuideSteps(steps: steps),
    );
  }
}
