import 'dart:convert';
import 'dart:io';

import 'package:finance_pro/features/bonds/presentation/models/bond_calculator_draft.dart';
import 'package:finance_pro/features/bonds/presentation/presenters/bond_calculator_learning_presenter.dart';
import 'package:finance_pro/features/lease/presentation/models/lease_calculator_draft.dart';
import 'package:finance_pro/features/lease/presentation/presenters/lease_calculator_learning_presenter.dart';
import 'package:finance_pro/features/leverage/domain/entities/leverage_calculator_models.dart';
import 'package:finance_pro/features/leverage/presentation/models/leverage_calculator_draft.dart';
import 'package:finance_pro/features/leverage/presentation/presenters/leverage_calculator_learning_presenter.dart';
import 'package:finance_pro/features/shares/domain/entities/share_calculator_models.dart';
import 'package:finance_pro/features/shares/presentation/models/share_calculator_draft.dart';
import 'package:finance_pro/features/shares/presentation/presenters/share_calculator_learning_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('all localized content formulas use supported TeX syntax', () {
    final List<String> invalid = <String>[];
    final List<File> files = Directory('assets/content')
        .listSync(recursive: true)
        .whereType<File>()
        .where((File file) => file.path.endsWith('.json'))
        .toList();

    for (final File file in files) {
      final Object? content = json.decode(file.readAsStringSync());
      final List<String> formulas = <String>[];
      _collectTex(content, formulas);

      for (final String tex in formulas) {
        final Math formula = Math.tex(tex);
        if (formula.parseError != null) {
          invalid.add('${file.path}: $tex');
        }
      }
    }

    expect(
      invalid,
      isEmpty,
      reason: 'Unsupported TeX expressions:\n${invalid.join('\n')}',
    );
  });

  test('all live calculator formulas use supported TeX syntax', () {
    final List<String> formulas = _liveFormulas();
    final List<String> invalid = formulas
        .where((String tex) => Math.tex(tex).parseError != null)
        .toList();

    expect(
      invalid,
      isEmpty,
      reason: 'Unsupported live TeX expressions:\n${invalid.join('\n')}',
    );
  });

  testWidgets('all live calculator formulas build without fallback', (
    WidgetTester tester,
  ) async {
    final List<String> errors = <String>[];
    final List<String> formulas = _liveFormulas();

    await tester.pumpWidget(
      MaterialApp(
        home: SingleChildScrollView(
          child: Column(
            children: formulas
                .map(
                  (String tex) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      tex,
                      onErrorFallback: (FlutterMathException error) {
                        errors.add('$tex: ${error.message}');
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(errors, isEmpty, reason: errors.join('\n'));
  });
}

List<String> _liveFormulas() {
  const BondCalculatorLearningPresenter bondPresenter =
      BondCalculatorLearningPresenter();
  const ShareCalculatorLearningPresenter sharePresenter =
      ShareCalculatorLearningPresenter();
  const LeverageCalculatorLearningPresenter leveragePresenter =
      LeverageCalculatorLearningPresenter();
  const LeaseCalculatorLearningPresenter leasePresenter =
      LeaseCalculatorLearningPresenter();
  const ShareCalculatorDraft emptyShareDraft = ShareCalculatorDraft();
  const ShareCalculatorDraft completeShareDraft = ShareCalculatorDraft(
    dividend: 4,
    initialGrowthRate: 5,
    periods: 4,
    requiredReturn: 12,
    terminalGrowthRate: 3,
  );

  return <String>[
    bondPresenter.buildLiveFormulaTex(const BondCalculatorDraft()),
    bondPresenter.buildLiveFormulaTex(
      const BondCalculatorDraft(
        annualInterest: 80,
        yearsToMaturity: 5,
        parValue: 1000,
        requiredReturn: 10,
      ),
    ),
    for (final ShareCalculationMode mode
        in ShareCalculationMode.values) ...<String>[
      sharePresenter.buildLiveFormulaTex(mode: mode, draft: emptyShareDraft),
      sharePresenter.buildLiveFormulaTex(mode: mode, draft: completeShareDraft),
    ],
    leveragePresenter.buildLiveFormulaTex(
      mode: LeverageMode.operating,
      draft: const LeverageCalculatorDraft(),
    ),
    leveragePresenter.buildLiveFormulaTex(
      mode: LeverageMode.operating,
      draft: const LeverageCalculatorDraft(
        salesVolume: 1000,
        salePrice: 25,
        variableCost: 12,
        fixedCost: 5000,
      ),
    ),
    leveragePresenter.buildLiveFormulaTex(
      mode: LeverageMode.financial,
      draft: const LeverageCalculatorDraft(),
    ),
    leveragePresenter.buildLiveFormulaTex(
      mode: LeverageMode.financial,
      draft: const LeverageCalculatorDraft(
        earningsBeforeInterestAndTaxes: 10000,
        interest: 1500,
        preferredDividends: 500,
        taxRate: 30,
      ),
    ),
    leasePresenter.buildLiveFormulaTex(const LeaseCalculatorDraft()),
    leasePresenter.buildLiveFormulaTex(
      const LeaseCalculatorDraft(
        leasePayment: 450,
        periods: 4,
        discountRate: 11,
        purchasePrice: 1450,
        residualValue: 300,
      ),
    ),
  ];
}

void _collectTex(Object? value, List<String> formulas) {
  if (value is List<Object?>) {
    for (final Object? item in value) {
      _collectTex(item, formulas);
    }
    return;
  }

  if (value is! Map<String, Object?>) {
    return;
  }

  for (final MapEntry<String, Object?> entry in value.entries) {
    if (entry.key == 'tex' && entry.value is String) {
      formulas.add(entry.value! as String);
    } else {
      _collectTex(entry.value, formulas);
    }
  }
}
