import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsMetricItemData {
  const DsMetricItemData({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;
}

class DsMetricStrip extends StatelessWidget {
  const DsMetricStrip({
    required this.items,
    super.key,
  });

  final List<DsMetricItemData> items;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int columns = constraints.maxWidth >=
                tokens.layout.breakpointGridTwoColumn
            ? items.length.clamp(1, 3)
            : 1;
        final double width = columns == 1
            ? constraints.maxWidth
            : (constraints.maxWidth -
                    ((columns - 1) * tokens.layout.gridGap)) /
                columns;

        return Wrap(
          spacing: tokens.layout.gridGap,
          runSpacing: tokens.layout.gridGap,
          children: items
              .map(
                (DsMetricItemData item) => Container(
                  width: width,
                  padding: EdgeInsets.all(tokens.spacing.lg),
                  decoration: BoxDecoration(
                    color: tokens.colors.surfaceRaised,
                    borderRadius: BorderRadius.circular(tokens.radii.lg),
                    border: Border.all(color: tokens.colors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DsText(
                        item.label.toUpperCase(),
                        tone: DsTextTone.caption,
                      ),
                      SizedBox(height: tokens.spacing.xs),
                      DsText(item.value, tone: DsTextTone.headline),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
