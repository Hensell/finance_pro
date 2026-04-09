import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:flutter/material.dart';

enum DsButtonVariant {
  primary,
  secondary,
  ghost,
  quiet,
}

class DsButton extends StatelessWidget {
  const DsButton({
    required this.label,
    required this.onPressed,
    this.variant = DsButtonVariant.primary,
    this.icon,
    this.stretch = false,
    super.key,
  });

  final IconData? icon;
  final String label;
  final VoidCallback? onPressed;
  final bool stretch;
  final DsButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final Widget button = switch (variant) {
      DsButtonVariant.primary => _buildFilledButton(
          context,
          icon ?? Icons.arrow_outward_rounded,
        ),
      DsButtonVariant.secondary => _buildOutlinedButton(
          context,
          icon ?? Icons.arrow_outward_rounded,
        ),
      DsButtonVariant.ghost => _buildTextButton(
          context,
          icon ?? Icons.chevron_right_rounded,
        ),
      DsButtonVariant.quiet => _buildQuietButton(
          context,
          icon ?? Icons.chevron_right_rounded,
        ),
    };

    if (!stretch) {
      return button;
    }

    return SizedBox(
      width: double.infinity,
      child: button,
    );
  }

  Widget _buildFilledButton(BuildContext context, IconData resolvedIcon) {
    if (icon == null) {
      return FilledButton(
        key: ValueKey<String>('ds-button:$label'),
        onPressed: onPressed,
        child: Text(label),
      );
    }

    return FilledButton.icon(
      key: ValueKey<String>('ds-button:$label'),
      onPressed: onPressed,
      icon: Icon(resolvedIcon),
      label: Text(label),
    );
  }

  Widget _buildOutlinedButton(BuildContext context, IconData resolvedIcon) {
    if (icon == null) {
      return OutlinedButton(
        key: ValueKey<String>('ds-button:$label'),
        onPressed: onPressed,
        child: Text(label),
      );
    }

    return OutlinedButton.icon(
      key: ValueKey<String>('ds-button:$label'),
      onPressed: onPressed,
      icon: Icon(resolvedIcon),
      label: Text(label),
    );
  }

  Widget _buildTextButton(BuildContext context, IconData resolvedIcon) {
    if (icon == null) {
      return TextButton(
        key: ValueKey<String>('ds-button:$label'),
        onPressed: onPressed,
        child: Text(label),
      );
    }

    return TextButton.icon(
      key: ValueKey<String>('ds-button:$label'),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: context.tokens.colors.onSurface,
      ),
      icon: Icon(resolvedIcon),
      label: Text(label),
    );
  }

  Widget _buildQuietButton(BuildContext context, IconData resolvedIcon) {
    final tokens = context.tokens;

    final ButtonStyle style = OutlinedButton.styleFrom(
      foregroundColor: tokens.colors.onSurface,
      backgroundColor: tokens.colors.surfaceMuted,
      minimumSize: const Size(0, 48),
      side: BorderSide(color: tokens.colors.border),
    );

    if (icon == null) {
      return OutlinedButton(
        key: ValueKey<String>('ds-button:$label'),
        onPressed: onPressed,
        style: style,
        child: Text(label),
      );
    }

    return OutlinedButton.icon(
      key: ValueKey<String>('ds-button:$label'),
      onPressed: onPressed,
      style: style,
      icon: Icon(resolvedIcon),
      label: Text(label),
    );
  }
}
