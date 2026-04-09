import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:flutter/material.dart';

class DsCalculatorFrame extends StatelessWidget {
  const DsCalculatorFrame({
    required this.intro,
    required this.main,
    this.aside,
    this.results,
    super.key,
  });

  final Widget? aside;
  final Widget intro;
  final Widget main;
  final Widget? results;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final bool splitLayout = aside != null &&
        MediaQuery.sizeOf(context).width >= tokens.layout.breakpointTwoColumn;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        intro,
        SizedBox(height: tokens.layout.sectionGap),
        if (splitLayout)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: main),
              SizedBox(width: tokens.layout.gridGap),
              SizedBox(
                width: tokens.layout.asideWidth,
                child: aside,
              ),
            ],
          )
        else ...<Widget>[
          main,
          if (aside != null) ...<Widget>[
            SizedBox(height: tokens.layout.gridGap),
            aside!,
          ],
        ],
        if (results != null) ...<Widget>[
          SizedBox(height: tokens.layout.sectionGap),
          results!,
        ],
      ],
    );
  }
}
