import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsSectionHeader extends StatelessWidget {
  const DsSectionHeader({
    required this.eyebrow,
    required this.title,
    required this.summary,
    super.key,
  });

  final String eyebrow;
  final String summary;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DsText(
          eyebrow.toUpperCase(),
          tone: DsTextTone.caption,
          color: context.tokens.colors.secondary,
        ),
        SizedBox(height: context.tokens.spacing.sm),
        DsText(title, tone: DsTextTone.detail),
        SizedBox(height: context.tokens.spacing.sm),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.tokens.layout.maxReadingWidth,
          ),
          child: DsText(summary, tone: DsTextTone.bodyMuted),
        ),
      ],
    );
  }
}
