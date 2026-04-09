import 'dart:async';

import 'package:finance_pro/app/localization/app_locale_cubit.dart';
import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/core/extensions/app_localizations_x.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/organisms/ds_nav_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DsAppShell extends StatelessWidget {
  const DsAppShell({
    required this.child,
    required this.currentLocation,
    super.key,
  });

  final Widget child;
  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final bool showRail =
        MediaQuery.sizeOf(context).width >= tokens.layout.breakpointRail;

    if (showRail) {
      return Scaffold(
        backgroundColor: tokens.colors.shellBackground,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: tokens.layout.railWidth,
                child: _DesktopRail(currentLocation: currentLocation),
              ),
              Expanded(child: _ShellBody(compact: false, child: child)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: tokens.colors.shellBackground,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const _CompactTopBar(),
            Padding(
              padding: EdgeInsets.fromLTRB(
                tokens.layout.compactPagePadding,
                0,
                tokens.layout.compactPagePadding,
                tokens.spacing.sm,
              ),
              child: DsNavRail(
                currentLocation: currentLocation,
                destinations: _destinations(context),
                onSelected: (String location) =>
                    _handleNavigation(context, location),
                axis: Axis.horizontal,
              ),
            ),
            Expanded(child: _ShellBody(compact: true, child: child)),
          ],
        ),
      ),
    );
  }

  List<DsNavDestination> _destinations(BuildContext context) {
    return <DsNavDestination>[
      DsNavDestination(
        label: context.l10n.homeRouteLabel,
        location: AppRoutePaths.home,
      ),
      DsNavDestination(
        label: context.l10n.featureLabel('bonds'),
        location: AppRoutePaths.featureLocation('bonds'),
      ),
      DsNavDestination(
        label: context.l10n.featureLabel('shares'),
        location: AppRoutePaths.featureLocation('shares'),
      ),
      DsNavDestination(
        label: context.l10n.featureLabel('leverage'),
        location: AppRoutePaths.featureLocation('leverage'),
      ),
      DsNavDestination(
        label: context.l10n.featureLabel('financial_ratios'),
        location: AppRoutePaths.featureLocation('financial_ratios'),
      ),
      DsNavDestination(
        label: context.l10n.featureLabel('lease'),
        location: AppRoutePaths.featureLocation('lease'),
      ),
    ];
  }

  void _handleNavigation(BuildContext context, String location) {
    if (currentLocation == location) {
      return;
    }

    final GoRouter router = GoRouter.of(context);
    FocusManager.instance.primaryFocus?.unfocus();

    scheduleMicrotask(() {
      router.go(location);
    });
  }
}

class _DesktopRail extends StatelessWidget {
  const _DesktopRail({required this.currentLocation});

  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Padding(
      padding: EdgeInsets.all(tokens.spacing.lg),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: tokens.colors.surfaceRaised,
          borderRadius: BorderRadius.circular(tokens.radii.xl),
          border: Border.all(color: tokens.colors.border),
        ),
        child: Padding(
          padding: EdgeInsets.all(tokens.spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(
                    context,
                  ).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: DsNavRail(
                      currentLocation: currentLocation,
                      destinations: _destinations(context),
                      onSelected: (String location) =>
                          _handleNavigation(context, location),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DsNavDestination> _destinations(BuildContext context) {
    return <DsNavDestination>[
      DsNavDestination(
        label: context.l10n.homeRouteLabel,
        location: AppRoutePaths.home,
      ),
      DsNavDestination(
        label: context.l10n.featureLabel('bonds'),
        location: AppRoutePaths.featureLocation('bonds'),
      ),
      DsNavDestination(
        label: context.l10n.featureLabel('shares'),
        location: AppRoutePaths.featureLocation('shares'),
      ),
      DsNavDestination(
        label: context.l10n.featureLabel('leverage'),
        location: AppRoutePaths.featureLocation('leverage'),
      ),
      DsNavDestination(
        label: context.l10n.featureLabel('financial_ratios'),
        location: AppRoutePaths.featureLocation('financial_ratios'),
      ),
      DsNavDestination(
        label: context.l10n.featureLabel('lease'),
        location: AppRoutePaths.featureLocation('lease'),
      ),
    ];
  }

  void _handleNavigation(BuildContext context, String location) {
    if (currentLocation == location) {
      return;
    }

    final GoRouter router = GoRouter.of(context);
    FocusManager.instance.primaryFocus?.unfocus();

    scheduleMicrotask(() {
      router.go(location);
    });
  }
}

class _CompactTopBar extends StatelessWidget {
  const _CompactTopBar();

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        tokens.layout.compactPagePadding,
        tokens.spacing.md,
        tokens.layout.compactPagePadding,
        tokens.spacing.sm,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DsText(context.l10n.appTitle, tone: DsTextTone.detail),
                SizedBox(height: tokens.spacing.xs / 2),
                DsText(
                  context.l10n.appTagline,
                  tone: DsTextTone.bodyMuted,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          SizedBox(width: tokens.spacing.md),
          const _LanguagePicker(),
        ],
      ),
    );
  }
}

class _LanguagePicker extends StatelessWidget {
  const _LanguagePicker();

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return BlocBuilder<AppLocaleCubit, Locale>(
      builder: (BuildContext context, Locale locale) {
        return PopupMenuButton<Locale>(
          tooltip: context.l10n.appToggleLanguageLabel,
          onSelected: context.read<AppLocaleCubit>().setLocale,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
            PopupMenuItem<Locale>(
              value: const Locale('es'),
              child: Text(context.l10n.appSpanishLabel),
            ),
            PopupMenuItem<Locale>(
              value: const Locale('en'),
              child: Text(context.l10n.appEnglishLabel),
            ),
          ],
          child: Container(
            width: null,
            padding: EdgeInsets.symmetric(
              horizontal: tokens.spacing.md,
              vertical: tokens.spacing.sm,
            ),
            decoration: BoxDecoration(
              color: tokens.colors.surfaceRaised,
              borderRadius: BorderRadius.circular(tokens.radii.round),
              border: Border.all(color: tokens.colors.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.translate_rounded,
                  size: 18,
                  color: tokens.colors.onSurface,
                ),
                SizedBox(width: tokens.spacing.xs),
                DsText(
                  locale.languageCode == 'es'
                      ? context.l10n.appSpanishLabel
                      : context.l10n.appEnglishLabel,
                  tone: DsTextTone.label,
                  color: tokens.colors.onSurface,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ShellBody extends StatelessWidget {
  const _ShellBody({required this.child, required this.compact});

  final Widget child;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return SingleChildScrollView(
      padding: EdgeInsets.all(
        compact ? tokens.layout.compactPagePadding : tokens.layout.pagePadding,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: tokens.layout.maxContentWidth),
          child: child,
        ),
      ),
    );
  }
}
