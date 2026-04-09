import 'dart:convert';
import 'dart:io';

import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/financial_ratios/presentation/presenters/financial_ratios_learning_presenter.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const FinancialRatiosLearningPresenter presenter =
      FinancialRatiosLearningPresenter();

  test('FinancialRatiosLearningPresenter formats ratio families correctly', () {
    final FeatureContent content = _loadContent();
    final ResultDescriptor currentRatio = _descriptor(content, 'currentRatio');
    final ResultDescriptor paymentPeriod = _descriptor(
      content,
      'averagePaymentPeriod',
    );
    final ResultDescriptor debtRatio = _descriptor(content, 'debtRatio');
    final ResultDescriptor workingCapital = _descriptor(
      content,
      'netWorkingCapital',
    );

    expect(
      presenter.formatMetric(
        currentRatio,
        const FinancialRatioMetric(
          id: 'currentRatio',
          status: FinancialRatioValueStatus.ok,
          value: 2.153846,
        ),
      ),
      '2.15x',
    );
    expect(
      presenter.formatMetric(
        paymentPeriod,
        const FinancialRatioMetric(
          id: 'averagePaymentPeriod',
          status: FinancialRatioValueStatus.ok,
          value: 89.528302,
        ),
      ),
      '89.53 d',
    );
    expect(
      presenter.formatMetric(
        debtRatio,
        const FinancialRatioMetric(
          id: 'debtRatio',
          status: FinancialRatioValueStatus.ok,
          value: 0.563492,
        ),
      ),
      '56.35%',
    );
    expect(
      presenter.formatMetric(
        workingCapital,
        const FinancialRatioMetric(
          id: 'netWorkingCapital',
          status: FinancialRatioValueStatus.ok,
          value: 300,
        ),
      ),
      '300.00',
    );
  });

  test(
    'FinancialRatiosLearningPresenter returns N/A and resolves didactic range',
    () {
      final FeatureContent content = _loadContent();
      final ResultDescriptor descriptor = _descriptor(content, 'currentRatio');

      expect(
        presenter.formatMetric(
          descriptor,
          const FinancialRatioMetric(
            id: 'currentRatio',
            status: FinancialRatioValueStatus.notAvailable,
          ),
        ),
        'N/A',
      );
      expect(
        presenter
            .resolveRange(
              descriptor,
              const FinancialRatioMetric(
                id: 'currentRatio',
                status: FinancialRatioValueStatus.ok,
                value: 2.153846,
              ),
            )
            ?.label,
        'Holgada',
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

ResultDescriptor _descriptor(FeatureContent content, String id) {
  return content.calculator!.results.firstWhere(
    (ResultDescriptor descriptor) => descriptor.id == id,
  );
}
