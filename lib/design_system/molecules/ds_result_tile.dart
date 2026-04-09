import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsResultTile extends StatelessWidget {
  const DsResultTile({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.tokens.spacing.md),
      decoration: BoxDecoration(
        color: context.tokens.colors.surfaceRaised,
        borderRadius: BorderRadius.circular(context.tokens.radii.md),
        border: Border.all(color: context.tokens.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DsText(
            label.toUpperCase(),
            tone: DsTextTone.caption,
            color: context.tokens.colors.onSurfaceMuted,
          ),
          SizedBox(height: context.tokens.spacing.xs),
          DsText(value, tone: DsTextTone.title),
        ],
      ),
    );
  }
}
