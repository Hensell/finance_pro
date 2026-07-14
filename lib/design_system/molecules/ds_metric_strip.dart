import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsMetricItemData {
  const DsMetricItemData({required this.label, required this.value});

  final String label;
  final String value;
}

class DsMetricStrip extends StatelessWidget {
  const DsMetricStrip({required this.items, super.key});

  final List<DsMetricItemData> items;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool horizontal = constraints.maxWidth >= 640;
        final List<Widget> children = <Widget>[];

        for (int index = 0; index < items.length; index += 1) {
          if (index > 0) {
            children.add(
              horizontal
                  ? VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: tokens.colors.divider,
                    )
                  : Divider(
                      height: 1,
                      thickness: 1,
                      color: tokens.colors.divider,
                    ),
            );
          }

          children.add(
            horizontal
                ? Expanded(child: _MetricItem(item: items[index]))
                : _MetricItem(item: items[index], compact: true),
          );
        }

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: tokens.spacing.lg,
            vertical: tokens.spacing.md,
          ),
          decoration: BoxDecoration(
            color: tokens.colors.surfaceRaised,
            borderRadius: BorderRadius.circular(tokens.radii.lg),
            border: Border.all(color: tokens.colors.border),
          ),
          child: horizontal
              ? IntrinsicHeight(child: Row(children: children))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                ),
        );
      },
    );
  }
}

class _MetricItem extends StatelessWidget {
  const _MetricItem({required this.item, this.compact = false});

  final bool compact;
  final DsMetricItemData item;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    if (compact) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: tokens.spacing.md),
        child: Row(
          children: <Widget>[
            Expanded(
              child: DsText(item.label.toUpperCase(), tone: DsTextTone.caption),
            ),
            SizedBox(width: tokens.spacing.md),
            DsText(item.value, tone: DsTextTone.title),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: tokens.spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DsText(item.value, tone: DsTextTone.headline),
          SizedBox(height: tokens.spacing.xs),
          DsText(item.label.toUpperCase(), tone: DsTextTone.caption),
        ],
      ),
    );
  }
}
