import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsFeatureTile extends StatelessWidget {
  const DsFeatureTile({
    required this.title,
    required this.summary,
    required this.actionLabel,
    required this.onPressed,
    super.key,
  });

  final String actionLabel;
  final VoidCallback onPressed;
  final String summary;
  final String title;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final BorderRadius borderRadius = BorderRadius.circular(tokens.radii.sm);

    return Semantics(
      button: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: tokens.colors.divider)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: tokens.spacing.sm,
                vertical: tokens.spacing.lg,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: _FeatureTileContent(
                      actionLabel: actionLabel,
                      summary: summary,
                      title: title,
                    ),
                  ),
                  SizedBox(width: tokens.spacing.md),
                  Padding(
                    padding: EdgeInsets.only(top: tokens.spacing.xs),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 20,
                      color: tokens.colors.onSurfaceMuted,
                    ),
                  ),
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
  });

  final String actionLabel;
  final String summary;
  final String title;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DsText(title, tone: DsTextTone.title),
        SizedBox(height: tokens.spacing.sm),
        DsText(summary, tone: DsTextTone.bodyMuted),
        SizedBox(height: tokens.spacing.md),
        DsText(
          actionLabel,
          tone: DsTextTone.label,
          color: tokens.colors.primary,
        ),
      ],
    );
  }
}
