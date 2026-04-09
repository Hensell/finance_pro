import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_formula.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
import 'package:finance_pro/design_system/molecules/ds_reading_section.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter/material.dart';

class ContentSectionView extends StatelessWidget {
  const ContentSectionView({required this.section, super.key});

  final ContentSection section;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return DsReadingSection(
      title: section.title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DsText(section.body, tone: DsTextTone.bodyMuted),
          if (section.bullets.isNotEmpty) ...<Widget>[
            SizedBox(height: tokens.spacing.md),
            ...section.bullets.map(
              (String bullet) => Padding(
                padding: EdgeInsets.only(bottom: tokens.spacing.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: tokens.spacing.xs),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: tokens.colors.secondary,
                      ),
                    ),
                    SizedBox(width: tokens.spacing.sm),
                    Expanded(child: DsText(bullet, tone: DsTextTone.body)),
                  ],
                ),
              ),
            ),
          ],
          if (section.formulas.isNotEmpty) ...<Widget>[
            SizedBox(height: tokens.spacing.lg),
            ...section.formulas.map(
              (FormulaContent formula) => Padding(
                padding: EdgeInsets.only(bottom: tokens.spacing.md),
                child: DsFormula(label: formula.label, tex: formula.tex),
              ),
            ),
          ],
          if (section.formulaLegend.isNotEmpty) ...<Widget>[
            SizedBox(height: tokens.spacing.md),
            _FormulaLegendView(items: section.formulaLegend),
          ],
          if (section.exampleTable != null) ...<Widget>[
            SizedBox(height: tokens.spacing.lg),
            _ExampleTableView(table: section.exampleTable!),
          ],
        ],
      ),
    );
  }
}

class _FormulaLegendView extends StatelessWidget {
  const _FormulaLegendView({required this.items});

  final List<FormulaLegendItem> items;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(tokens.spacing.md),
      decoration: BoxDecoration(
        color: tokens.colors.surfaceRaised,
        borderRadius: BorderRadius.circular(tokens.radii.md),
        border: Border.all(color: tokens.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (FormulaLegendItem item) => Padding(
                padding: EdgeInsets.only(bottom: tokens.spacing.sm),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(
                      context,
                    ).style.copyWith(color: tokens.colors.onSurface),
                    children: <InlineSpan>[
                      TextSpan(
                        text: '${item.symbol}: ',
                        style: DefaultTextStyle.of(context).style.copyWith(
                          fontWeight: FontWeight.w600,
                          color: tokens.colors.onSurface,
                        ),
                      ),
                      TextSpan(text: item.meaning),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ExampleTableView extends StatelessWidget {
  const _ExampleTableView({required this.table});

  final ExampleTable table;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DsText(table.title, tone: DsTextTone.label),
        SizedBox(height: tokens.spacing.sm),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: table.columns
                .map((String column) => DataColumn(label: Text(column)))
                .toList(),
            rows: table.rows
                .map(
                  (ExampleRow row) => DataRow(
                    cells: row.cells
                        .map((String cell) => DataCell(Text(cell)))
                        .toList(),
                  ),
                )
                .toList(),
          ),
        ),
        if (table.footnote != null) ...<Widget>[
          SizedBox(height: tokens.spacing.xs),
          DsText(table.footnote!, tone: DsTextTone.bodyMuted),
        ],
      ],
    );
  }
}
