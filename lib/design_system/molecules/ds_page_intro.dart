import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsPageIntro extends StatelessWidget {
  const DsPageIntro({
    required this.eyebrow,
    required this.title,
    required this.summary,
    this.compact = false,
    this.maxWidth,
    super.key,
  });

  final bool compact;
  final String eyebrow;
  final double? maxWidth;
  final String summary;
  final String title;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? tokens.layout.maxReadingWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DsText(
            eyebrow.toUpperCase(),
            tone: DsTextTone.caption,
            color: tokens.colors.secondary,
          ),
          SizedBox(height: tokens.spacing.sm),
          DsText(
            title,
            tone: compact ? DsTextTone.headline : DsTextTone.display,
          ),
          SizedBox(height: tokens.spacing.md),
          DsText(summary, tone: DsTextTone.bodyMuted),
        ],
      ),
    );
  }
}
