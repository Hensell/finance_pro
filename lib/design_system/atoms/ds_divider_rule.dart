import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsDividerRule extends StatelessWidget {
  const DsDividerRule({
    this.label,
    super.key,
  });

  final String? label;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    if (label == null) {
      return Container(
        height: 1,
        width: double.infinity,
        color: tokens.colors.divider,
      );
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 1,
            color: tokens.colors.divider,
          ),
        ),
        SizedBox(width: tokens.spacing.sm),
        DsText(label!, tone: DsTextTone.caption),
        SizedBox(width: tokens.spacing.sm),
        Expanded(
          child: Container(
            height: 1,
            color: tokens.colors.divider,
          ),
        ),
      ],
    );
  }
}
