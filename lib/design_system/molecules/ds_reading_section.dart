import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsReadingSection extends StatelessWidget {
  const DsReadingSection({
    required this.child,
    this.centerAligned = false,
    this.padding,
    this.summary,
    this.title,
    super.key,
  });

  final bool centerAligned;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final String? summary;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Container(
      padding: padding ?? EdgeInsets.all(tokens.spacing.lg),
      decoration: BoxDecoration(
        color: tokens.colors.surface,
        borderRadius: BorderRadius.circular(tokens.radii.lg),
        border: Border.all(color: tokens.colors.border),
      ),
      child: Column(
        crossAxisAlignment:
            centerAligned ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null) ...<Widget>[
            DsText(
              title!,
              tone: DsTextTone.detail,
              textAlign: centerAligned ? TextAlign.center : TextAlign.start,
            ),
            if (summary != null) SizedBox(height: tokens.spacing.sm),
          ],
          if (summary != null) ...<Widget>[
            DsText(
              summary!,
              tone: DsTextTone.bodyMuted,
              textAlign: centerAligned ? TextAlign.center : TextAlign.start,
            ),
            SizedBox(height: tokens.spacing.lg),
          ],
          child,
        ],
      ),
    );
  }
}
