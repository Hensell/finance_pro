import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/core/extensions/app_localizations_x.dart';
import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_button.dart';
import 'package:finance_pro/design_system/atoms/ds_divider_rule.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_page_intro.dart';
import 'package:finance_pro/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            tokens.colors.background,
            tokens.colors.shellBackground,
          ],
        ),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool splitLayout =
              constraints.maxWidth >= tokens.layout.breakpointTwoColumn;
          final EdgeInsetsGeometry padding = EdgeInsets.all(
            constraints.maxWidth >= tokens.layout.breakpointTwoColumn
                ? tokens.layout.pagePadding
                : tokens.layout.compactPagePadding,
          );

          return SingleChildScrollView(
            padding: padding,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - tokens.layout.pagePadding,
              ),
              child: splitLayout
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 11,
                          child: _IntroCopy(
                            featureLabels: _featureLabels(context),
                          ),
                        ),
                        SizedBox(width: tokens.layout.gridGap),
                        Expanded(
                          flex: 7,
                          child: _LabIndexPanel(
                            featureLabels: _featureLabels(context),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _IntroCopy(
                          featureLabels: _featureLabels(context),
                        ),
                        SizedBox(height: tokens.layout.sectionGap),
                        _LabIndexPanel(
                          featureLabels: _featureLabels(context),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  List<String> _featureLabels(BuildContext context) {
    return <String>[
      context.l10n.featureLabel('bonds'),
      context.l10n.featureLabel('shares'),
      context.l10n.featureLabel('leverage'),
      context.l10n.featureLabel('financial_ratios'),
      context.l10n.featureLabel('lease'),
    ];
  }
}

class _IntroCopy extends StatelessWidget {
  const _IntroCopy({
    required this.featureLabels,
  });

  final List<String> featureLabels;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DsPageIntro(
          eyebrow: context.l10n.onboardingRouteLabel,
          title: context.l10n.appTitle,
          summary: context.l10n.appTagline,
        ),
        SizedBox(height: tokens.spacing.xl),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: tokens.layout.maxReadingWidth,
          ),
          child: DsText(
            context.l10n.appLoadingBody,
            tone: DsTextTone.bodyMuted,
          ),
        ),
        SizedBox(height: tokens.spacing.xl),
        Wrap(
          spacing: tokens.spacing.sm,
          runSpacing: tokens.spacing.sm,
          children: featureLabels
              .map(
                (String label) => _ModuleChip(label: label),
              )
              .toList(),
        ),
        SizedBox(height: tokens.spacing.xxl),
        DsButton(
          label: context.l10n.appPrimaryAction,
          onPressed: () => context.go(AppRoutePaths.home),
          icon: Icons.arrow_outward_rounded,
        ),
      ],
    );
  }
}

class _LabIndexPanel extends StatelessWidget {
  const _LabIndexPanel({
    required this.featureLabels,
  });

  final List<String> featureLabels;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final String modulesCount = featureLabels.length.toString().padLeft(2, '0');
    final String calculatorsCount =
        featureLabels.where((String item) => item != context.l10n.featureLabel('lease')).length
            .toString()
            .padLeft(2, '0');
    final String languagesCount =
        AppLocalizations.supportedLocales.length.toString().padLeft(2, '0');

    return Container(
      padding: EdgeInsets.all(tokens.spacing.xl),
      decoration: BoxDecoration(
        color: tokens.colors.surfaceRaised,
        borderRadius: BorderRadius.circular(tokens.radii.xl),
        border: Border.all(color: tokens.colors.border),
        boxShadow: <BoxShadow>[tokens.shadows.floating],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DsText(
            context.l10n.onboardingIndexLabel,
            tone: DsTextTone.caption,
            color: tokens.colors.secondary,
          ),
          SizedBox(height: tokens.spacing.md),
          const DsDividerRule(),
          SizedBox(height: tokens.spacing.xl),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: CustomPaint(
              painter: _LabSignalPainter(
                axisColor: tokens.colors.divider,
                lineColor: tokens.colors.tertiary,
                markerColor: tokens.colors.primary,
              ),
            ),
          ),
          SizedBox(height: tokens.spacing.xl),
          ...featureLabels.asMap().entries.map(
                (MapEntry<int, String> entry) => Padding(
                  padding: EdgeInsets.only(bottom: tokens.spacing.md),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 34,
                        child: DsText(
                          '${entry.key + 1}'.padLeft(2, '0'),
                          tone: DsTextTone.caption,
                        ),
                      ),
                      Expanded(
                        child: DsText(entry.value, tone: DsTextTone.detail),
                      ),
                    ],
                  ),
                ),
              ),
          SizedBox(height: tokens.spacing.lg),
          const DsDividerRule(),
          SizedBox(height: tokens.spacing.lg),
          Wrap(
            spacing: tokens.spacing.md,
            runSpacing: tokens.spacing.md,
            children: <Widget>[
              _StatBlock(
                label: context.l10n.onboardingStatModules,
                value: modulesCount,
              ),
              _StatBlock(
                label: context.l10n.onboardingStatCalculators,
                value: calculatorsCount,
              ),
              _StatBlock(
                label: context.l10n.onboardingStatLanguages,
                value: languagesCount,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ModuleChip extends StatelessWidget {
  const _ModuleChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.tokens.spacing.md,
        vertical: context.tokens.spacing.sm,
      ),
      decoration: BoxDecoration(
        color: context.tokens.colors.surfaceRaised,
        borderRadius: BorderRadius.circular(context.tokens.radii.round),
        border: Border.all(color: context.tokens.colors.border),
      ),
      child: DsText(label, tone: DsTextTone.label),
    );
  }
}

class _StatBlock extends StatelessWidget {
  const _StatBlock({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Container(
      constraints: const BoxConstraints(minWidth: 132),
      padding: EdgeInsets.all(tokens.spacing.md),
      decoration: BoxDecoration(
        color: tokens.colors.surface,
        borderRadius: BorderRadius.circular(tokens.radii.lg),
        border: Border.all(color: tokens.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DsText(label.toUpperCase(), tone: DsTextTone.caption),
          SizedBox(height: tokens.spacing.xs),
          DsText(value, tone: DsTextTone.detail),
        ],
      ),
    );
  }
}

class _LabSignalPainter extends CustomPainter {
  _LabSignalPainter({
    required this.axisColor,
    required this.lineColor,
    required this.markerColor,
  });

  final Color axisColor;
  final Color lineColor;
  final Color markerColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint axisPaint = Paint()
      ..color = axisColor
      ..strokeWidth = 1;
    final Paint linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    final Paint markerPaint = Paint()
      ..color = markerColor
      ..style = PaintingStyle.fill;

    final double baseline = size.height * 0.78;
    canvas.drawLine(
      Offset(0, baseline),
      Offset(size.width, baseline),
      axisPaint,
    );

    for (int index = 1; index < 6; index++) {
      final double x = (size.width / 6) * index;
      canvas.drawLine(
        Offset(x, baseline - 72),
        Offset(x, baseline),
        axisPaint,
      );
    }

    final Path path = Path()
      ..moveTo(0, baseline - 18)
      ..lineTo(size.width * 0.18, baseline - 42)
      ..lineTo(size.width * 0.34, baseline - 30)
      ..lineTo(size.width * 0.48, baseline - 84)
      ..lineTo(size.width * 0.68, baseline - 56)
      ..lineTo(size.width * 0.84, baseline - 96)
      ..lineTo(size.width, baseline - 70);

    canvas.drawPath(path, linePaint);

    for (final Offset point in <Offset>[
      Offset(0, baseline - 18),
      Offset(size.width * 0.18, baseline - 42),
      Offset(size.width * 0.34, baseline - 30),
      Offset(size.width * 0.48, baseline - 84),
      Offset(size.width * 0.68, baseline - 56),
      Offset(size.width * 0.84, baseline - 96),
      Offset(size.width, baseline - 70),
    ]) {
      canvas.drawCircle(point, 4, markerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
