import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:flutter/material.dart';

enum DsTextTone {
  display,
  headline,
  title,
  body,
  bodyMuted,
  label,
  caption,
  detail,
}

class DsText extends StatelessWidget {
  const DsText(
    this.data, {
    required this.tone,
    this.color,
    this.maxLines,
    this.textAlign,
    super.key,
  });

  final Color? color;
  final String data;
  final int? maxLines;
  final DsTextTone tone;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: _resolveStyle(context).copyWith(color: color),
      textAlign: textAlign,
    );
  }

  TextStyle _resolveStyle(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return switch (tone) {
      DsTextTone.display => textTheme.displayLarge!,
      DsTextTone.headline => textTheme.headlineLarge!,
      DsTextTone.title => textTheme.titleLarge!,
      DsTextTone.body => textTheme.bodyLarge!,
      DsTextTone.bodyMuted => textTheme.bodyMedium!,
      DsTextTone.label => textTheme.labelLarge!,
      DsTextTone.caption => textTheme.labelMedium!.copyWith(
          letterSpacing: 1.4,
          color: context.tokens.colors.onSurfaceMuted,
        ),
      DsTextTone.detail => textTheme.titleMedium!,
    };
  }
}
