import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:flutter/material.dart';

class DsResultGrid extends StatelessWidget {
  const DsResultGrid({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int columns = constraints.maxWidth >=
                tokens.layout.breakpointGridTwoColumn
            ? 2
            : 1;
        final double width = columns == 1
            ? constraints.maxWidth
            : (constraints.maxWidth -
                    ((columns - 1) * tokens.layout.gridGap)) /
                columns;

        return Wrap(
          spacing: tokens.layout.gridGap,
          runSpacing: tokens.layout.gridGap,
          children: children
              .map((Widget child) => SizedBox(width: width, child: child))
              .toList(),
        );
      },
    );
  }
}
