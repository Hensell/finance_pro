import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/molecules/ds_guide_steps.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:flutter/material.dart';

class ShareCalculatorGuide extends StatelessWidget {
  const ShareCalculatorGuide({required this.note, super.key});

  final String? note;

  @override
  Widget build(BuildContext context) {
    final List<DsGuideStep> steps = <DsGuideStep>[
      DsGuideStep(
        title: context.l10n.shareCalculatorGuideStepModelTitle,
        body: context.l10n.shareCalculatorGuideStepModelBody,
      ),
      DsGuideStep(
        title: context.l10n.shareCalculatorGuideStepDividendTitle,
        body: context.l10n.shareCalculatorGuideStepDividendBody,
      ),
      DsGuideStep(
        title: context.l10n.shareCalculatorGuideStepInterpretTitle,
        body: context.l10n.shareCalculatorGuideStepInterpretBody,
      ),
    ];

    return DsReadingSection(
      title: context.l10n.shareCalculatorGuideTitle,
      summary: note,
      child: DsGuideSteps(steps: steps),
    );
  }
}
