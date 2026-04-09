import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter/material.dart';

class LeverageModePicker extends StatelessWidget {
  const LeverageModePicker({
    required this.modes,
    required this.onSelected,
    required this.selectedModeId,
    this.selectedContent,
    super.key,
  });

  final List<CalculatorModeContent> modes;
  final ValueChanged<String> onSelected;
  final String selectedModeId;
  final Widget? selectedContent;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return DsReadingSection(
      title: context.l10n.leverageCalculatorModeSectionTitle,
      summary: context.l10n.leverageCalculatorModeSectionSummary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: modes
            .map(
              (CalculatorModeContent mode) => Padding(
                padding: EdgeInsets.only(bottom: tokens.spacing.sm),
                child: _ModeCard(
                  expandedContent: mode.id == selectedModeId
                      ? selectedContent
                      : null,
                  mode: mode,
                  onTap: () => onSelected(mode.id),
                  selected: mode.id == selectedModeId,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    this.expandedContent,
    required this.mode,
    required this.onTap,
    required this.selected,
  });

  final Widget? expandedContent;
  final CalculatorModeContent mode;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Semantics(
      button: true,
      selected: selected,
      child: GestureDetector(
        key: ValueKey<String>('leverage-mode:${mode.id}'),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(tokens.spacing.md),
          decoration: BoxDecoration(
            color: selected
                ? tokens.colors.primarySoft
                : tokens.colors.surfaceRaised,
            borderRadius: BorderRadius.circular(tokens.radii.md),
            border: Border.all(
              color: selected ? tokens.colors.primary : tokens.colors.border,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: DsText(
                      mode.label,
                      tone: DsTextTone.label,
                      color: selected
                          ? tokens.colors.primary
                          : tokens.colors.onSurface,
                    ),
                  ),
                  Icon(
                    selected
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: selected
                        ? tokens.colors.primary
                        : tokens.colors.onSurfaceMuted,
                  ),
                ],
              ),
              SizedBox(height: tokens.spacing.xs),
              DsText(mode.summary, tone: DsTextTone.bodyMuted),
              if (expandedContent != null) ...<Widget>[
                SizedBox(height: tokens.spacing.md),
                Divider(color: tokens.colors.border),
                SizedBox(height: tokens.spacing.md),
                expandedContent!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
