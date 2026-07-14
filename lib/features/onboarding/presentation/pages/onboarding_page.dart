import 'dart:async';

import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({this.autoRedirect = true, super.key});

  final bool autoRedirect;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  Timer? _redirectTimer;

  @override
  void initState() {
    super.initState();

    if (!widget.autoRedirect) {
      return;
    }

    _redirectTimer = Timer(const Duration(milliseconds: 900), () {
      if (!mounted) {
        return;
      }

      context.go(AppRoutePaths.home);
    });
  }

  @override
  void dispose() {
    _redirectTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Scaffold(
      backgroundColor: tokens.colors.shellBackground,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(tokens.layout.compactPagePadding),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: tokens.layout.maxReadingWidth,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DsText(
                    context.l10n.appTitle,
                    tone: DsTextTone.headline,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: tokens.spacing.sm),
                  DsText(
                    context.l10n.appSplashLabel,
                    tone: DsTextTone.bodyMuted,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: tokens.spacing.lg),
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: tokens.colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
