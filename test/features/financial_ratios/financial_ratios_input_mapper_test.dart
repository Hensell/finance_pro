import 'package:finance_pro/features/financial_ratios/presentation/mappers/financial_ratios_input_mapper.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:flutter_test/flutter_test.dart';

import 'financial_ratios_test_data.dart';

void main() {
  const FinancialRatiosInputMapper mapper = FinancialRatiosInputMapper();

  test(
    'FinancialRatiosInputMapper parses a complete draft into typed input',
    () {
      final input = mapper.toLooseInput(makeValidFinancialStatementsDraft());

      expect(input.incomeStatement.grossSales, 1000);
      expect(input.incomeStatement.endingInventory, 180);
      expect(input.balanceSheet.inventory, 180);
      expect(input.balanceSheet.equity, 550);
    },
  );

  test('FinancialRatiosInputMapper flags invalid numeric capture', () {
    final draft = makeValidFinancialStatementsDraft().updateField(
      'grossSales',
      'abc',
    );

    expect(mapper.hasInvalidNumber(draft), isTrue);
  });

  test('FinancialRatiosInputMapper detects missing fields by builder step', () {
    final incomeDraft = makeValidFinancialStatementsDraft().updateField(
      'grossSales',
      '',
    );
    final balanceDraft = makeValidFinancialStatementsDraft().updateField(
      'inventory',
      '',
    );

    expect(
      mapper.hasMissingFieldsForStep(
        incomeDraft,
        FinancialRatiosBuilderStep.incomeStatement,
      ),
      isTrue,
    );
    expect(
      mapper.hasMissingFieldsForStep(
        balanceDraft,
        FinancialRatiosBuilderStep.balanceSheet,
      ),
      isTrue,
    );
    expect(
      mapper.hasMissingFieldsForStep(
        makeValidFinancialStatementsDraft(),
        FinancialRatiosBuilderStep.results,
      ),
      isFalse,
    );
  });
}
