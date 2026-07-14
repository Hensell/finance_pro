import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsNavDestination {
  const DsNavDestination({
    required this.icon,
    required this.label,
    required this.location,
    this.selectedIcon,
  });

  final IconData icon;
  final String label;
  final String location;
  final IconData? selectedIcon;
}

class DsNavRail extends StatelessWidget {
  const DsNavRail({
    required this.currentLocation,
    required this.destinations,
    required this.onSelected,
    this.axis = Axis.vertical,
    super.key,
  });

  final Axis axis;
  final String currentLocation;
  final List<DsNavDestination> destinations;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    final List<Widget> items = destinations
        .map(
          (DsNavDestination destination) => _NavItem(
            active: _isActive(destination.location),
            axis: axis,
            icon: destination.icon,
            label: destination.label,
            location: destination.location,
            onTap: () => onSelected(destination.location),
            selectedIcon: destination.selectedIcon,
          ),
        )
        .toList();

    if (axis == Axis.horizontal) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items
              .map(
                (Widget item) => Padding(
                  padding: EdgeInsets.only(right: tokens.spacing.sm),
                  child: item,
                ),
              )
              .toList(),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: items
          .map(
            (Widget item) => Padding(
              padding: EdgeInsets.only(bottom: tokens.spacing.xs),
              child: item,
            ),
          )
          .toList(),
    );
  }

  bool _isActive(String location) {
    if (location == '/home') {
      return currentLocation == location;
    }

    return currentLocation.startsWith(location);
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.active,
    required this.axis,
    required this.icon,
    required this.label,
    required this.location,
    required this.onTap,
    this.selectedIcon,
  });

  final bool active;
  final Axis axis;
  final IconData icon;
  final String label;
  final String location;
  final VoidCallback onTap;
  final IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final bool horizontal = axis == Axis.horizontal;

    final BorderRadius borderRadius = BorderRadius.circular(
      horizontal ? tokens.radii.round : tokens.radii.md,
    );

    return Semantics(
      selected: active,
      child: Material(
        color: horizontal
            ? (active ? tokens.colors.primarySoft : tokens.colors.surfaceRaised)
            : (active ? tokens.colors.primarySoft : Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(
            color: horizontal
                ? (active
                      ? tokens.colors.primary.withValues(alpha: 0.24)
                      : tokens.colors.border)
                : (active
                      ? tokens.colors.primary.withValues(alpha: 0.16)
                      : Colors.transparent),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          key: ValueKey<String>('nav-item:$location'),
          borderRadius: borderRadius,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontal ? tokens.spacing.md : tokens.spacing.sm,
                vertical: tokens.spacing.sm,
              ),
              child: Row(
                mainAxisSize: horizontal ? MainAxisSize.min : MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    active ? selectedIcon ?? icon : icon,
                    size: 20,
                    color: active
                        ? tokens.colors.primary
                        : tokens.colors.onSurfaceMuted,
                  ),
                  SizedBox(width: tokens.spacing.sm),
                  if (horizontal)
                    DsText(
                      label,
                      tone: DsTextTone.label,
                      color: active
                          ? tokens.colors.primary
                          : tokens.colors.onSurface,
                    )
                  else
                    Expanded(
                      child: DsText(
                        label,
                        tone: DsTextTone.label,
                        color: active
                            ? tokens.colors.primary
                            : tokens.colors.onSurface,
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
