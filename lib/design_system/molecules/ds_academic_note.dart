import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsAcademicNote extends StatelessWidget {
  const DsAcademicNote({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Container(
      padding: EdgeInsets.all(tokens.spacing.lg),
      decoration: BoxDecoration(
        color: tokens.colors.primarySoft,
        borderRadius: BorderRadius.circular(tokens.radii.lg),
        border: Border.all(
          color: tokens.colors.primary.withValues(alpha: 0.18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.menu_book_outlined,
                size: 22,
                color: tokens.colors.primary,
              ),
              SizedBox(width: tokens.spacing.sm),
              Expanded(
                child: DsText(
                  context.l10n.academicContextTitle,
                  tone: DsTextTone.detail,
                  color: tokens.colors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: tokens.spacing.sm),
          DsText(context.l10n.academicContextBody, tone: DsTextTone.bodyMuted),
          SizedBox(height: tokens.spacing.md),
          DsText(
            context.l10n.academicReferencesLabel.toUpperCase(),
            tone: DsTextTone.caption,
            color: tokens.colors.primary,
          ),
          SizedBox(height: tokens.spacing.xs),
          DsText(
            context.l10n.academicReferencesBody,
            tone: DsTextTone.bodyMuted,
          ),
        ],
      ),
    );
  }
}
