import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:flutter/material.dart';

class DsStatusPanel extends StatelessWidget {
  const DsStatusPanel({
    required this.title,
    required this.body,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final String? actionLabel;
  final String body;
  final VoidCallback? onAction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.tokens.layout.maxReadingWidth,
        ),
        child: DsReadingSection(
          title: title,
          summary: body,
          centerAligned: true,
          padding: EdgeInsets.all(context.tokens.spacing.xl),
          child: onAction == null || actionLabel == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(top: context.tokens.spacing.lg),
                  child: DsButton(
                    label: actionLabel!,
                    onPressed: onAction,
                  ),
                ),
        ),
      ),
    );
  }
}
