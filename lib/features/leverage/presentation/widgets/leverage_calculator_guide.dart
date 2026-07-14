import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/molecules/ds_guide_steps.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:flutter/material.dart';

class LeverageCalculatorGuide extends StatelessWidget {
  const LeverageCalculatorGuide({required this.note, super.key});

  final String? note;

  @override
  Widget build(BuildContext context) {
    final List<DsGuideStep> steps = <DsGuideStep>[
      DsGuideStep(
        title: context.l10n.leverageCalculatorGuideStepModeTitle,
        body: context.l10n.leverageCalculatorGuideStepModeBody,
      ),
      DsGuideStep(
        title: context.l10n.leverageCalculatorGuideStepBaseTitle,
        body: context.l10n.leverageCalculatorGuideStepBaseBody,
      ),
      DsGuideStep(
        title: context.l10n.leverageCalculatorGuideStepInterpretTitle,
        body: context.l10n.leverageCalculatorGuideStepInterpretBody,
      ),
    ];

    return DsReadingSection(
      title: context.l10n.leverageCalculatorGuideTitle,
      summary: note,
      child: DsGuideSteps(steps: steps),
    );
  }
}
