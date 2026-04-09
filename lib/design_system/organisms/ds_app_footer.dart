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

    return Material(
      color: tokens.colors.surfaceRaised,
      child: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: tokens.colors.border),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: tokens.layout.compactPagePadding,
            vertical: tokens.spacing.sm,
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
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: tokens.spacing.xs,
                      children: <Widget>[
                        DsText(
                          context.l10n.appFooterCreditsPrefix,
                          tone: DsTextTone.bodyMuted,
                        ),
                        DsText(
                          context.l10n.appFooterCreditsName,
                          tone: DsTextTone.label,
                          color: tokens.colors.primary,
                        ),
                        DsText(
                          context.l10n.appFooterCreditsLinkLabel,
                          tone: DsTextTone.bodyMuted,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
