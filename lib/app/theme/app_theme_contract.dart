import 'package:finance_pro/design_system/theme/app_theme_tokens.dart';

abstract interface class AppThemeContract {
  AppColorTokens get colors;
  AppLayoutTokens get layout;
  AppMotionTokens get motion;
  AppRadiusTokens get radii;
  AppShadowTokens get shadows;
  AppSpacingTokens get spacing;
}
