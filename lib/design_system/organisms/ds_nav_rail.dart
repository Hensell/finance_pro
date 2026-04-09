import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';

class DsNavDestination {
  const DsNavDestination({
    required this.label,
    required this.location,
  });

  final String label;
  final String location;
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
            label: destination.label,
            location: destination.location,
            onTap: () => onSelected(destination.location),
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
    required this.label,
    required this.location,
    required this.onTap,
  });

  final bool active;
  final Axis axis;
  final String label;
  final String location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final bool horizontal = axis == Axis.horizontal;

    return Semantics(
      button: true,
      selected: active,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          key: ValueKey<String>('nav-item:$location'),
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: horizontal
                  ? (active
                      ? tokens.colors.primarySoft
                      : tokens.colors.surfaceRaised)
                  : (active ? tokens.colors.primarySoft : Colors.transparent),
              borderRadius: BorderRadius.circular(
                horizontal ? tokens.radii.round : tokens.radii.md,
              ),
              border: Border.all(
                color: horizontal
                    ? (active
                        ? tokens.colors.primary.withValues(alpha: 0.24)
                        : tokens.colors.border)
                    : (active
                        ? tokens.colors.primary.withValues(alpha: 0.16)
                        : Colors.transparent),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontal ? tokens.spacing.md : tokens.spacing.sm,
                vertical:
                    horizontal ? tokens.spacing.sm : tokens.spacing.sm + 2,
              ),
              child: SizedBox(
                width: horizontal ? null : double.infinity,
                child: horizontal
                    ? DsText(
                        label,
                        tone: DsTextTone.label,
                        color: active
                            ? tokens.colors.primary
                            : tokens.colors.onSurface,
                      )
                    : Row(
                        children: <Widget>[
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: active
                                  ? tokens.colors.primary
                                  : tokens.colors.borderStrong.withValues(
                                      alpha: 0.7,
                                    ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: tokens.spacing.sm),
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
      ),
    );
  }
}
