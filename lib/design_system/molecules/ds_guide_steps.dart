import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsGuideStep {
  const DsGuideStep({required this.title, required this.body});

  final String body;
  final String title;
}

class DsGuideSteps extends StatelessWidget {
  const DsGuideSteps({required this.steps, super.key});

  final List<DsGuideStep> steps;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: tokens.colors.divider)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: steps
            .map(
              (DsGuideStep step) => DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: tokens.colors.divider),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: tokens.spacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DsText(step.title, tone: DsTextTone.label),
                      SizedBox(height: tokens.spacing.xs),
                      DsText(step.body, tone: DsTextTone.bodyMuted),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
