import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class DsAppFooter extends StatelessWidget {
  const DsAppFooter({super.key});

  static final Uri _creditsUri = Uri.parse('https://hensell.dev');

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final double footerHeight = (tokens.spacing.sm * 2) + 24;

    return SafeArea(
      top: false,
      child: SizedBox(
        height: footerHeight,
        child: Material(
          color: tokens.colors.surfaceRaised,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: tokens.colors.border),
              ),
            ),
            child: Center(
              child: Link(
                uri: _creditsUri,
                target: LinkTarget.blank,
                builder: (BuildContext context, FollowLink? openLink) {
                  return InkWell(
                    onTap: openLink,
                    borderRadius: BorderRadius.circular(tokens.radii.round),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: tokens.spacing.sm,
                        vertical: tokens.spacing.xs,
                      ),
                      child: DsText(
                        context.l10n.appFooterCreditsLabel,
                        tone: DsTextTone.bodyMuted,
                        color: tokens.colors.onSurfaceMuted,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
