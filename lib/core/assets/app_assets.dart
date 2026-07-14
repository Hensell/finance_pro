final class AppAssets {
  static const String bondIcon = 'assets/icons/bonos.png';
  static const String leverageIcon = 'assets/icons/apalan.png';
  static const String leaseIcon = 'assets/icons/arren.png';
  static const String ratiosIcon = 'assets/icons/razon.png';
  static const String sharesIcon = 'assets/icons/shares.png';

  static String iconForFeature(String featureId) {
    switch (featureId) {
      case 'bonds':
        return bondIcon;
      case 'shares':
        return sharesIcon;
      case 'leverage':
        return leverageIcon;
      case 'lease':
        return leaseIcon;
      case 'financial_ratios':
      default:
        return ratiosIcon;
    }
  }
}
