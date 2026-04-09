import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsAsidePanel extends StatelessWidget {
  const DsAsidePanel({
    required this.child,
    this.eyebrow,
    this.title,
    this.summary,
    super.key,
  });

  final Widget child;
  final String? eyebrow;
  final String? summary;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Container(
      padding: EdgeInsets.all(tokens.spacing.lg),
      decoration: BoxDecoration(
        color: tokens.colors.surfaceRaised,
        borderRadius: BorderRadius.circular(tokens.radii.lg),
        border: Border.all(color: tokens.colors.border),
        boxShadow: <BoxShadow>[tokens.shadows.soft],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (eyebrow != null) ...<Widget>[
            DsText(
              eyebrow!.toUpperCase(),
              tone: DsTextTone.caption,
              color: tokens.colors.secondary,
            ),
            SizedBox(height: tokens.spacing.sm),
          ],
          if (title != null) ...<Widget>[
            DsText(title!, tone: DsTextTone.detail),
            SizedBox(height: tokens.spacing.sm),
          ],
          if (summary != null) ...<Widget>[
            DsText(summary!, tone: DsTextTone.bodyMuted),
            SizedBox(height: tokens.spacing.lg),
          ],
          child,
        ],
      ),
    );
  }
}
