import 'package:finance_pro/core/assets/app_assets.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/molecules/ds_feature_tile.dart';
import 'package:flutter/material.dart';

class DsFeatureCard extends StatelessWidget {
  const DsFeatureCard({
    required this.accent,
    required this.featureId,
    required this.kicker,
    required this.onPressed,
    required this.summary,
    required this.title,
    this.featured = false,
    super.key,
  });

  final String accent;
  final bool featured;
  final String featureId;
  final String kicker;
  final VoidCallback onPressed;
  final String summary;
  final String title;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return DsFeatureTile(
      actionLabel: context.l10n.appExploreAction,
      eyebrow: kicker,
      featured: featured,
      leading: Container(
        width: featured ? 112 : 64,
        height: featured ? 112 : 64,
        decoration: BoxDecoration(
          color: tokens.colors.accentFor(accent),
          borderRadius: BorderRadius.circular(tokens.radii.lg),
        ),
        child: Padding(
          padding: EdgeInsets.all(tokens.spacing.md),
          child: Image.asset(AppAssets.iconForFeature(featureId)),
        ),
      ),
      onPressed: onPressed,
      summary: summary,
      title: title,
    );
  }
}
