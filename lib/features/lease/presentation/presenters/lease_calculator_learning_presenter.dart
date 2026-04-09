import 'dart:math';

import 'package:finance_pro/features/lease/domain/entities/lease_calculator_models.dart';
import 'package:finance_pro/features/lease/presentation/models/lease_calculator_draft.dart';

enum LeaseDecision { lease, buy, neutral }

class LeaseComparisonInsight {
  const LeaseComparisonInsight({
    required this.decision,
    required this.discountRate,
    required this.discountedResidualValue,
    required this.savings,
  });

  final LeaseDecision decision;
  final double discountRate;
  final double discountedResidualValue;
  final double savings;
}

class LeaseCalculatorLearningPresenter {
  const LeaseCalculatorLearningPresenter();

  LeaseComparisonInsight? buildInsight({
    required LeaseCalculatorDraft draft,
    required LeaseComparisonResult? result,
  }) {
    if (!draft.isComplete || result == null || draft.discountRate == null) {
      return null;
    }

    final double base = max(
      result.leasePresentValue.abs(),
      result.purchaseNetCost.abs(),
    );
    final double tolerance = base * 0.01;
    final double difference = result.difference;
    final LeaseDecision decision;

    if (difference.abs() <= tolerance) {
      decision = LeaseDecision.neutral;
    } else if (difference > 0) {
      decision = LeaseDecision.lease;
    } else {
      decision = LeaseDecision.buy;
    }

    return LeaseComparisonInsight(
      decision: decision,
      discountRate: draft.discountRate!,
      discountedResidualValue: result.discountedResidualValue,
      savings: difference.abs(),
    );
  }

  String buildLiveFormulaTex(LeaseCalculatorDraft draft) {
    final String leasePayment = _valueOrPlaceholder(
      draft.leasePayment == null ? null : _formatNumber(draft.leasePayment!),
    );
    final String purchasePrice = _valueOrPlaceholder(
      draft.purchasePrice == null ? null : _formatNumber(draft.purchasePrice!),
    );
    final String residualValue = _valueOrPlaceholder(
      draft.residualValue == null ? null : _formatNumber(draft.residualValue!),
    );
    final String periods = _valueOrPlaceholder(draft.periods?.toString());
    final String periodsExponent = draft.periods?.toString() ?? 'N';
    final String rateExpression = draft.rateDecimal == null
        ? 'k'
        : _formatNumber(draft.rateDecimal!);
    final String rate = _valueOrPlaceholder(
      draft.rateDecimal == null ? null : _formatNumber(draft.rateDecimal!),
    );

    final StringBuffer buffer = StringBuffer()
      ..write(
        'Pago = $leasePayment,\\quad P_0 = $purchasePrice,\\quad VR = $residualValue,\\quad N = $periods,\\quad k = $rate \\\\ ',
      )
      ..write(
        'VP_{lease} = \\sum_{t=1}^{$periodsExponent}\\frac{$leasePayment}{(1+$rateExpression)^t} \\\\ ',
      )
      ..write(
        'VP_{buy} = $purchasePrice - \\frac{$residualValue}{(1+$rateExpression)^{$periodsExponent}} \\\\ ',
      )
      ..write('\\Delta = VP_{buy} - VP_{lease}');

    return buffer.toString();
  }

  String _formatNumber(double value) {
    final String fixed = value.toStringAsFixed(4);
    return fixed
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }

  String _valueOrPlaceholder(String? value) {
    return value ?? r'\text{?}';
  }
}
