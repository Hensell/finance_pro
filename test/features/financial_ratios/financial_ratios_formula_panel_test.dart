import 'dart:convert';
import 'dart:io';

import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:finance_pro/features/financial_ratios/presentation/widgets/financial_ratios_formula_panel.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_app_harness.dart';

void main() {
  testWidgets('FinancialRatiosFormulaPanel filters formulas by builder step', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();
    final FeatureContent content = _loadContent();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: SingleChildScrollView(
          child: FinancialRatiosFormulaPanel(
            calculator: content.calculator!,
            currentStep: FinancialRatiosBuilderStep.balanceSheet,
            selectedGroupId: 'liquidity',
          ),
        ),
        dependencies: dependencies,
        currentLocation: '/feature/financial_ratios/calculator',
        useShell: false,
      ),
    );
    await tester.pump();

    expect(find.text('ACTIVOS CORRIENTES'), findsOneWidget);
    expect(find.text('ECUACIÓN CONTABLE'), findsOneWidget);
    expect(find.text('VENTAS NETAS'), findsNothing);
    expect(find.text('LIQUIDEZ CORRIENTE'), findsNothing);
  });

  testWidgets('FinancialRatiosFormulaPanel filters formulas by result group', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();
    final FeatureContent content = _loadContent();

    await tester.pumpWidget(
      buildGoldenHarness(
        child: SingleChildScrollView(
          child: FinancialRatiosFormulaPanel(
            calculator: content.calculator!,
            currentStep: FinancialRatiosBuilderStep.results,
            selectedGroupId: 'dupont',
          ),
        ),
        dependencies: dependencies,
        currentLocation: '/feature/financial_ratios/calculator',
        useShell: false,
      ),
    );
    await tester.pump();

    expect(find.text('DUPONT'), findsOneWidget);
    expect(find.text('ROE'), findsNothing);
    expect(find.text('LIQUIDEZ CORRIENTE'), findsNothing);
  });

  testWidgets(
    'FinancialRatiosFormulaPanel shows fallback when no formulas apply',
    (WidgetTester tester) async {
      final AppDependencies dependencies = createGoldenDependencies();

      await tester.pumpWidget(
        buildGoldenHarness(
          child: const SingleChildScrollView(
            child: FinancialRatiosFormulaPanel(
              calculator: CalculatorDescriptor(
                id: 'financial_ratios',
                title: 'Builder',
                summary: 'Summary',
                submitLabel: 'Submit',
              ),
              currentStep: FinancialRatiosBuilderStep.results,
              selectedGroupId: 'liquidity',
            ),
          ),
          dependencies: dependencies,
          currentLocation: '/feature/financial_ratios/calculator',
          useShell: false,
        ),
      );
      await tester.pump();

      expect(
        find.text(
          'Selecciona un paso o una familia de razones para ver las fórmulas relevantes.',
        ),
        findsOneWidget,
      );
    },
  );
}

FeatureContent _loadContent() {
  final String raw = File(
    'assets/content/es/financial_ratios.json',
  ).readAsStringSync();
  return FeatureContent.fromJson(jsonDecode(raw) as Map<String, dynamic>);
}
