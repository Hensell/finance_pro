import 'package:finance_pro/features/bonds/domain/entities/bond_calculator_models.dart';
import 'package:finance_pro/features/bonds/presentation/models/bond_calculator_draft.dart';

enum BondPricePosition { premium, atPar, discount }

class BondPriceInsight {
  const BondPriceInsight({
    required this.couponRate,
    required this.position,
    required this.priceGap,
    required this.requiredReturn,
  });

  final double couponRate;
  final BondPricePosition position;
  final double priceGap;
  final double requiredReturn;
}

class BondCalculatorLearningPresenter {
  const BondCalculatorLearningPresenter();

  BondPriceInsight? buildInsight({
    required BondCalculatorDraft draft,
    required BondCalculatorResult? result,
  }) {
    final double? couponRate = draft.couponRate;
    if (!draft.isComplete ||
        couponRate == null ||
        result == null ||
        draft.parValue == null ||
        draft.requiredReturn == null) {
      return null;
    }

    final double priceGap = result.presentValue - draft.parValue!;
    final double tolerance = draft.parValue! * 0.005;
    final BondPricePosition position;

    if (priceGap.abs() <= tolerance) {
      position = BondPricePosition.atPar;
    } else if (priceGap > 0) {
      position = BondPricePosition.premium;
    } else {
      position = BondPricePosition.discount;
    }

    return BondPriceInsight(
      couponRate: couponRate,
      position: position,
      priceGap: priceGap,
      requiredReturn: draft.requiredReturn!,
    );
  }

  String buildLiveFormulaTex(BondCalculatorDraft draft) {
    final String annualInterest = _valueOrPlaceholder(
      draft.annualInterest == null
          ? null
          : _formatNumber(draft.annualInterest!),
    );
    final String years = _valueOrPlaceholder(draft.yearsToMaturity?.toString());
    final String parValue = _valueOrPlaceholder(
      draft.parValue == null ? null : _formatNumber(draft.parValue!),
    );
    final String yearsExponent = draft.yearsToMaturity?.toString() ?? 'N';
    final String rateExpression = draft.requiredReturn == null
        ? 'k_d'
        : _formatNumber(draft.requiredReturn! / 100);
    final String requiredReturn = _valueOrPlaceholder(
      draft.requiredReturn == null
          ? null
          : _formatNumber(draft.requiredReturn! / 100),
    );

    final StringBuffer buffer = StringBuffer()
      ..write(
        'I = $annualInterest,\\quad N = $years,\\quad M = $parValue,\\quad k_d = $requiredReturn \\\\ ',
      )
      ..write('B_0 = $annualInterest\\sum_{t=1}^{$yearsExponent}')
      ..write('\\frac{1}{(1+$rateExpression)^t}')
      ..write('+\\frac{$parValue}{(1+$rateExpression)^{$yearsExponent}}');

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
