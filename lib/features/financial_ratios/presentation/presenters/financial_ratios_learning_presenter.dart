import 'package:finance_pro/core/utils/app_number_formatter.dart';
import 'package:finance_pro/features/financial_ratios/domain/entities/financial_ratios_models.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';

class FinancialRatiosLearningPresenter {
  const FinancialRatiosLearningPresenter();

  String formatMetric(
    ResultDescriptor descriptor,
    FinancialRatioMetric metric,
  ) {
    if (metric.status != FinancialRatioValueStatus.ok || metric.value == null) {
      return 'N/A';
    }

    switch (descriptor.format) {
      case 'percent':
        return '${AppNumberFormatter.decimal(metric.value! * 100)}%';
      case 'days':
        return '${AppNumberFormatter.decimal(metric.value!)} d';
      case 'currency':
        return AppNumberFormatter.decimal(metric.value!);
      case 'ratio':
      case null:
        return '${AppNumberFormatter.decimal(metric.value!)}x';
      default:
        return AppNumberFormatter.decimal(metric.value!);
    }
  }

  DidacticRangeContent? resolveRange(
    ResultDescriptor descriptor,
    FinancialRatioMetric metric,
  ) {
    if (metric.status != FinancialRatioValueStatus.ok || metric.value == null) {
      return null;
    }

    for (final DidacticRangeContent range in descriptor.didacticRanges) {
      final bool matchesMin = range.min == null || metric.value! >= range.min!;
      final bool matchesMax = range.max == null || metric.value! < range.max!;
      if (matchesMin && matchesMax) {
        return range;
      }
    }

    return null;
  }
}
