import 'package:finance_pro/app/localization/app_locale_cubit.dart';
import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/core/extensions/app_localizations_x.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/organisms/ds_app_footer.dart';
import 'package:finance_pro/design_system/organisms/ds_nav_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

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
    final List<DsNavDestination> destinations = _destinations(context);
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
                child: _DesktopRail(
                  currentLocation: currentLocation,
                  destinations: destinations,
                  onSelected: (String location) =>
                      _handleNavigation(context, location),
                ),
              ),
              Expanded(child: _ShellBody(compact: false, child: child)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: tokens.colors.shellBackground,
      bottomNavigationBar: const DsAppFooter(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _CompactTopBar(
              currentLocation: currentLocation,
              destinations: destinations,
              onSelected: (String location) =>
                  _handleNavigation(context, location),
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
        icon: Icons.home_outlined,
        selectedIcon: Icons.home_rounded,
        label: context.l10n.homeRouteLabel,
        location: AppRoutePaths.home,
      ),
      DsNavDestination(
        icon: Icons.payments_outlined,
        selectedIcon: Icons.payments_rounded,
        label: context.l10n.featureLabel('bonds'),
        location: AppRoutePaths.featureLocation('bonds'),
      ),
      DsNavDestination(
        icon: Icons.show_chart_rounded,
        selectedIcon: Icons.stacked_line_chart_rounded,
        label: context.l10n.featureLabel('shares'),
        location: AppRoutePaths.featureLocation('shares'),
      ),
      DsNavDestination(
        icon: Icons.speed_outlined,
        selectedIcon: Icons.speed_rounded,
        label: context.l10n.featureLabel('leverage'),
        location: AppRoutePaths.featureLocation('leverage'),
      ),
      DsNavDestination(
        icon: Icons.analytics_outlined,
        selectedIcon: Icons.analytics_rounded,
        label: context.l10n.featureLabel('financial_ratios'),
        location: AppRoutePaths.featureLocation('financial_ratios'),
      ),
      DsNavDestination(
        icon: Icons.account_balance_outlined,
        selectedIcon: Icons.account_balance_rounded,
        label: context.l10n.featureLabel('lease'),
        location: AppRoutePaths.featureLocation('lease'),
      ),
    ];
  }

  void _handleNavigation(BuildContext context, String location) {
    if (currentLocation == location) {
      return;
    }

    GoRouter.of(context).go(location);
  }
}

class _DesktopRail extends StatelessWidget {
  const _DesktopRail({
    required this.currentLocation,
    required this.destinations,
    required this.onSelected,
  });

  static final Uri _creditsUri = Uri.parse('https://hensell.dev');

  final String currentLocation;
  final List<DsNavDestination> destinations;
  final ValueChanged<String> onSelected;

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
              const _BrandLockup(),
              SizedBox(height: tokens.spacing.lg),
              Divider(color: tokens.colors.divider, height: 1),
              SizedBox(height: tokens.spacing.lg),
              DsText(
                context.l10n.shellModulesLabel.toUpperCase(),
                tone: DsTextTone.caption,
                color: tokens.colors.onSurfaceMuted,
              ),
              SizedBox(height: tokens.spacing.sm),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(
                    context,
                  ).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: DsNavRail(
                      currentLocation: currentLocation,
                      destinations: destinations,
                      onSelected: onSelected,
                    ),
                  ),
                ),
              ),
              SizedBox(height: tokens.spacing.md),
              const _LanguagePicker(stretch: true),
              SizedBox(height: tokens.spacing.sm),
              Link(
                uri: _creditsUri,
                target: LinkTarget.blank,
                builder: (BuildContext context, FollowLink? openLink) {
                  return TextButton(
                    onPressed: openLink,
                    child: DsText(
                      context.l10n.appFooterCreditsLabel,
                      tone: DsTextTone.bodyMuted,
                      color: tokens.colors.onSurfaceMuted,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompactTopBar extends StatelessWidget {
  const _CompactTopBar({
    required this.currentLocation,
    required this.destinations,
    required this.onSelected,
  });

  final String currentLocation;
  final List<DsNavDestination> destinations;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final DsNavDestination activeDestination = destinations.firstWhere(
      (DsNavDestination destination) =>
          _isActive(currentLocation, destination.location),
      orElse: () => destinations.first,
    );

    return Material(
      color: tokens.colors.surfaceRaised,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: tokens.colors.border)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            tokens.layout.compactPagePadding,
            tokens.spacing.sm,
            tokens.layout.compactPagePadding,
            tokens.spacing.sm,
          ),
          child: Row(
            children: <Widget>[
              const _BrandMark(size: 40),
              SizedBox(width: tokens.spacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DsText(context.l10n.appTitle, tone: DsTextTone.detail),
                    DsText(
                      activeDestination.label,
                      tone: DsTextTone.bodyMuted,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(width: tokens.spacing.xs),
              const _LanguagePicker(compact: true),
              SizedBox(width: tokens.spacing.xs),
              IconButton(
                tooltip: context.l10n.shellModulesLabel,
                onPressed: () => _showNavigationSheet(context),
                icon: const Icon(Icons.menu_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNavigationSheet(BuildContext context) {
    final tokens = context.tokens;

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: tokens.colors.onSurface.withValues(alpha: 0.28),
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext sheetContext) => _CompactNavigationSheet(
        currentLocation: currentLocation,
        destinations: destinations,
        onSelected: (String location) {
          Navigator.of(sheetContext).pop();
          onSelected(location);
        },
      ),
    );
  }

  bool _isActive(String current, String destination) {
    if (destination == AppRoutePaths.home) {
      return current == destination;
    }

    return current.startsWith(destination);
  }
}

class _CompactNavigationSheet extends StatelessWidget {
  const _CompactNavigationSheet({
    required this.currentLocation,
    required this.destinations,
    required this.onSelected,
  });

  final String currentLocation;
  final List<DsNavDestination> destinations;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 620),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: tokens.colors.surfaceRaised,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(tokens.radii.xl),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            tokens.layout.compactPagePadding,
            tokens.spacing.md,
            tokens.layout.compactPagePadding,
            tokens.spacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: tokens.colors.borderStrong,
                    borderRadius: BorderRadius.circular(tokens.radii.round),
                  ),
                ),
              ),
              SizedBox(height: tokens.spacing.lg),
              Row(
                children: <Widget>[
                  Expanded(
                    child: DsText(
                      context.l10n.shellModulesLabel,
                      tone: DsTextTone.title,
                    ),
                  ),
                  IconButton(
                    tooltip: MaterialLocalizations.of(context).closeButtonLabel,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              SizedBox(height: tokens.spacing.md),
              Flexible(
                child: SingleChildScrollView(
                  child: DsNavRail(
                    currentLocation: currentLocation,
                    destinations: destinations,
                    onSelected: onSelected,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BrandLockup extends StatelessWidget {
  const _BrandLockup();

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Row(
      children: <Widget>[
        const _BrandMark(size: 46),
        SizedBox(width: tokens.spacing.sm),
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
      ],
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Semantics(
      image: true,
      label: context.l10n.appTitle,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: tokens.colors.primary,
          borderRadius: BorderRadius.circular(tokens.radii.md),
        ),
        child: Icon(
          Icons.auto_graph_rounded,
          size: size * 0.52,
          color: tokens.colors.onPrimary,
        ),
      ),
    );
  }
}

class _LanguagePicker extends StatelessWidget {
  const _LanguagePicker({this.compact = false, this.stretch = false});

  final bool compact;
  final bool stretch;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return BlocBuilder<AppLocaleCubit, Locale>(
      builder: (BuildContext context, Locale locale) {
        final Widget picker = PopupMenuButton<Locale>(
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
            constraints: const BoxConstraints(minHeight: 44),
            padding: EdgeInsets.symmetric(
              horizontal: compact ? tokens.spacing.sm : tokens.spacing.md,
              vertical: tokens.spacing.sm,
            ),
            decoration: BoxDecoration(
              color: tokens.colors.surfaceRaised,
              borderRadius: BorderRadius.circular(tokens.radii.round),
              border: Border.all(color: tokens.colors.border),
            ),
            child: Row(
              mainAxisSize: stretch ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.translate_rounded,
                  size: 18,
                  color: tokens.colors.onSurface,
                ),
                SizedBox(width: tokens.spacing.xs),
                DsText(
                  compact
                      ? locale.languageCode.toUpperCase()
                      : locale.languageCode == 'es'
                      ? context.l10n.appSpanishLabel
                      : context.l10n.appEnglishLabel,
                  tone: DsTextTone.label,
                  color: tokens.colors.onSurface,
                ),
                if (!compact) ...<Widget>[
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: tokens.colors.onSurfaceMuted,
                  ),
                ],
              ],
            ),
          ),
        );

        return stretch
            ? SizedBox(width: double.infinity, child: picker)
            : picker;
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

    return Scrollbar(
      child: SingleChildScrollView(
        primary: true,
        padding: EdgeInsets.all(
          compact
              ? tokens.layout.compactPagePadding
              : tokens.layout.pagePadding,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: tokens.layout.maxContentWidth,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
