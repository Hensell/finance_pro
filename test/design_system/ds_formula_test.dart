import 'package:finance_pro/app/theme/app_theme.dart';
import 'package:finance_pro/design_system/atoms/ds_formula.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DsFormula renders correctly', (WidgetTester tester) async {
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

    expect(find.text('Valor presente'), findsOneWidget);

    // We find DsFormula because Math widget doesn't expose its texString
    final dsFormula = tester.widget<DsFormula>(find.byType(DsFormula));
    expect(dsFormula.tex, r'P_0 = \frac{D_1}{k-g}');
  });
}
