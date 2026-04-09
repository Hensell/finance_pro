import 'package:finance_pro/app/theme/app_theme.dart';
import 'package:finance_pro/design_system/atoms/ds_formula.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tex/flutter_tex.dart';

void main() {
  testWidgets('DsFormula renders through flutter_tex', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.build(useGoogleFonts: false),
        home: const Scaffold(
          body: DsFormula(
            label: 'Valor presente',
            tex: r'P_0 = \frac{D_1}{k-g}',
          ),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('VALOR PRESENTE'), findsOneWidget);
    expect(find.byType(TeXWidget), findsOneWidget);
  });
}
