import 'package:finance_pro/l10n/generated/app_localizations.dart';

extension AppLocalizationsX on AppLocalizations {
  String featureLabel(String featureId) {
    switch (featureId) {
      case 'bonds':
        return featureBondsLabel;
      case 'shares':
        return featureSharesLabel;
      case 'leverage':
        return featureLeverageLabel;
      case 'lease':
        return featureLeaseLabel;
      case 'financial_ratios':
      default:
        return featureRatiosLabel;
    }
  }
}
