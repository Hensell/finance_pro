import 'package:finance_pro/features/financial_ratios/domain/usecases/calculate_financial_ratios.dart';
import 'package:finance_pro/features/financial_ratios/domain/validators/financial_ratios_input_validator.dart';
import 'package:finance_pro/features/financial_ratios/presentation/cubit/financial_ratios_calculator_cubit.dart';
import 'package:finance_pro/features/financial_ratios/presentation/mappers/financial_ratios_input_mapper.dart';
import 'package:finance_pro/features/financial_ratios/presentation/models/financial_ratios_builder_step.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FinancialRatiosCalculatorCubit createCubit() {
    return FinancialRatiosCalculatorCubit(
      calculateFinancialRatios: const CalculateFinancialRatios(),
      inputMapper: const FinancialRatiosInputMapper(),
      validator: const FinancialRatiosInputValidator(),
    );
  }

  test(
    'cubit advances from income statement to balance sheet when step 1 is valid',
    () {
      final FinancialRatiosCalculatorCubit cubit = createCubit();
      addTearDown(cubit.close);

      _fillIncomeStatement(cubit);

      cubit.continueStep();

      expect(cubit.state.currentStep, FinancialRatiosBuilderStep.balanceSheet);
      expect(cubit.state.validationKey, isNull);
    },
  );

  test('cubit blocks analysis when the balance sheet does not tie', () {
    final FinancialRatiosCalculatorCubit cubit = createCubit();
    addTearDown(cubit.close);

    _fillIncomeStatement(cubit);
    cubit.continueStep();
    _fillBalanceSheet(cubit, equity: '500');

    cubit.continueStep();

    expect(cubit.state.currentStep, FinancialRatiosBuilderStep.balanceSheet);
    expect(
      cubit.state.validationKey,
      'financialRatiosValidationBalanceMismatch',
    );
    expect(cubit.state.result, isNull);
  });

  test(
    'cubit blocks continuation when income statement fields are missing',
    () {
      final FinancialRatiosCalculatorCubit cubit = createCubit();
      addTearDown(cubit.close);

      _fillIncomeStatement(cubit);
      cubit.updateField('grossSales', '');

      cubit.continueStep();

      expect(
        cubit.state.currentStep,
        FinancialRatiosBuilderStep.incomeStatement,
      );
      expect(
        cubit.state.validationKey,
        'financialRatiosValidationCompleteIncomeStatement',
      );
    },
  );

  test('cubit blocks analysis when inventory differs between statements', () {
    final FinancialRatiosCalculatorCubit cubit = createCubit();
    addTearDown(cubit.close);

    _fillIncomeStatement(cubit);
    cubit.continueStep();
    _fillBalanceSheet(cubit, inventory: '200', equity: '570');

    cubit.continueStep();

    expect(cubit.state.currentStep, FinancialRatiosBuilderStep.balanceSheet);
    expect(
      cubit.state.validationKey,
      'financialRatiosValidationInventoryMismatch',
    );
    expect(cubit.state.result, isNull);
  });

  test(
    'cubit calculates grouped results and clears stale output after editing',
    () {
      final FinancialRatiosCalculatorCubit cubit = createCubit();
      addTearDown(cubit.close);

      _fillIncomeStatement(cubit);
      cubit.continueStep();
      _fillBalanceSheet(cubit);

      cubit.continueStep();

      expect(cubit.state.currentStep, FinancialRatiosBuilderStep.results);
      expect(cubit.state.result, isNotNull);

      cubit.updateField('equity', '560');

      expect(cubit.state.result, isNull);
      expect(cubit.state.currentStep, FinancialRatiosBuilderStep.results);
    },
  );

  test('cubit fills sample data and keeps the draft editable', () {
    final FinancialRatiosCalculatorCubit cubit = createCubit();
    addTearDown(cubit.close);

    cubit.fillWithSampleData();

    expect(cubit.state.currentStep, FinancialRatiosBuilderStep.results);
    expect(cubit.state.result, isNotNull);
    expect(cubit.state.draft.incomeStatement.grossSales, '1000');
    expect(cubit.state.draft.balanceSheet.equity, '550');

    cubit.updateField('equity', '560');

    expect(cubit.state.result, isNull);
    expect(cubit.state.draft.balanceSheet.equity, '560');
  });
}

void _fillIncomeStatement(FinancialRatiosCalculatorCubit cubit) {
  final Map<String, String> values = <String, String>{
    'grossSales': '1000',
    'salesDiscounts': '50',
    'salesReturns': '20',
    'beginningInventory': '200',
    'purchases': '500',
    'purchaseExpenses': '20',
    'purchaseDiscounts': '10',
    'endingInventory': '180',
    'sellingExpenses': '120',
    'administrativeExpenses': '80',
    'interestExpense': '30',
    'incomeTaxExpense': '45',
  };

  values.forEach(cubit.updateField);
}

void _fillBalanceSheet(
  FinancialRatiosCalculatorCubit cubit, {
  String inventory = '180',
  String equity = '550',
}) {
  final Map<String, String> values = <String, String>{
    'cashAndCashEquivalents': '150',
    'accountsReceivable': '240',
    'allowanceForDoubtfulAccounts': '20',
    'advancesToSuppliers': '10',
    'inventory': inventory,
    'propertyPlantAndEquipment': '900',
    'accumulatedDepreciation': '200',
    'accountsPayable': '130',
    'shortTermBankDebt': '90',
    'taxesPayable': '40',
    'longTermNotesPayable': '200',
    'mortgagePayable': '150',
    'bondsPayable': '100',
    'equity': equity,
  };

  values.forEach(cubit.updateField);
}
