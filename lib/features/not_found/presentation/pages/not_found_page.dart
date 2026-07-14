import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: tokens.layout.maxReadingWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: tokens.spacing.xxl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: tokens.colors.primarySoft,
                  borderRadius: BorderRadius.circular(tokens.radii.lg),
                ),
                child: Icon(
                  Icons.explore_off_outlined,
                  color: tokens.colors.primary,
                  size: 32,
                ),
              ),
              SizedBox(height: tokens.spacing.lg),
              DsText(
                context.l10n.notFoundTitle,
                tone: DsTextTone.headline,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: tokens.spacing.sm),
              DsText(
                context.l10n.notFoundBody,
                tone: DsTextTone.bodyMuted,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: tokens.spacing.xl),
              DsButton(
                label: context.l10n.notFoundAction,
                icon: Icons.home_outlined,
                onPressed: () => context.go(AppRoutePaths.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
