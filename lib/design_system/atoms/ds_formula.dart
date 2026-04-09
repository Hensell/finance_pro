import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_divider_rule.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class DsFormula extends StatelessWidget {
  const DsFormula({
    required this.label,
    required this.tex,
    super.key,
  });

  final String label;
  final String tex;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(tokens.spacing.lg),
      decoration: BoxDecoration(
        color: tokens.colors.formulaSurface,
        borderRadius: BorderRadius.circular(tokens.radii.md),
        border: Border.all(color: tokens.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DsText(
            label.toUpperCase(),
            tone: DsTextTone.caption,
            color: tokens.colors.secondary,
          ),
          SizedBox(height: tokens.spacing.sm),
          const DsDividerRule(),
          SizedBox(height: tokens.spacing.md),
          TeXWidget(
            content: '\$\$$tex\$\$',
          ),
        ],
      ),
    );
  }
}
