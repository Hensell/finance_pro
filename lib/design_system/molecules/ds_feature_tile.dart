import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsFeatureTile extends StatelessWidget {
  const DsFeatureTile({
    required this.title,
    required this.summary,
    required this.actionLabel,
    required this.onPressed,
    this.eyebrow,
    this.featured = false,
    this.leading,
    super.key,
  });

  final String actionLabel;
  final String? eyebrow;
  final bool featured;
  final Widget? leading;
  final VoidCallback onPressed;
  final String summary;
  final String title;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final bool split = featured &&
        leading != null &&
        MediaQuery.sizeOf(context).width >=
            context.tokens.layout.breakpointTwoColumn;
    final Widget content = _FeatureTileContent(
      actionLabel: actionLabel,
      eyebrow: eyebrow,
      summary: summary,
      title: title,
    );

    return Semantics(
      button: true,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color:
                  featured ? tokens.colors.surfaceRaised : tokens.colors.surface,
              borderRadius: BorderRadius.circular(tokens.radii.lg),
              border: Border.all(
                color:
                    featured ? tokens.colors.borderStrong : tokens.colors.border,
              ),
              boxShadow: featured ? <BoxShadow>[tokens.shadows.soft] : null,
            ),
            child: Padding(
              padding: EdgeInsets.all(
                featured ? tokens.spacing.xl : tokens.spacing.lg,
              ),
              child: !split || leading == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (leading != null) ...<Widget>[
                          leading!,
                          SizedBox(height: tokens.spacing.xl),
                        ],
                        content,
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(child: content),
                        SizedBox(width: tokens.spacing.xl),
                        leading!,
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureTileContent extends StatelessWidget {
  const _FeatureTileContent({
    required this.actionLabel,
    required this.summary,
    required this.title,
    this.eyebrow,
  });

  final String actionLabel;
  final String? eyebrow;
  final String summary;
  final String title;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Column(
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
        DsText(title, tone: DsTextTone.headline),
        SizedBox(height: tokens.spacing.sm),
        DsText(summary, tone: DsTextTone.bodyMuted),
        SizedBox(height: tokens.spacing.xl),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DsText(actionLabel, tone: DsTextTone.label),
            SizedBox(width: tokens.spacing.xs),
            Icon(
              Icons.arrow_outward_rounded,
              size: 18,
              color: tokens.colors.onSurface,
            ),
          ],
        ),
      ],
    );
  }
}
