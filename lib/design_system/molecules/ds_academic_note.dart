import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsAcademicNote extends StatelessWidget {
  const DsAcademicNote({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: tokens.colors.divider)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: tokens.spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DsText(context.l10n.academicContextTitle, tone: DsTextTone.detail),
            SizedBox(height: tokens.spacing.sm),
            DsText(
              context.l10n.academicContextBody,
              tone: DsTextTone.bodyMuted,
            ),
            SizedBox(height: tokens.spacing.md),
            DsText(
              context.l10n.academicReferencesLabel,
              tone: DsTextTone.label,
            ),
            SizedBox(height: tokens.spacing.xs),
            DsText(
              context.l10n.academicReferencesBody,
              tone: DsTextTone.bodyMuted,
            ),
          ],
        ),
      ),
    );
  }
}
