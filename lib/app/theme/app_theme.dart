import 'package:finance_pro/app/theme/app_theme_contract.dart';
import 'package:finance_pro/design_system/theme/app_theme_tokens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData build({
    bool useGoogleFonts = true,
  }) {
    const AppColorTokens colors = AppColorTokens.premiumFinance();
    const AppSpacingTokens spacing = AppSpacingTokens.standard();
    const AppRadiusTokens radii = AppRadiusTokens.standard();
    const AppLayoutTokens layout = AppLayoutTokens.web();
    const AppMotionTokens motion = AppMotionTokens.standard();
    const AppShadowTokens shadows = AppShadowTokens.premium();

    final ThemeData base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: colors.primary,
        primary: colors.primary,
        secondary: colors.secondary,
        tertiary: colors.tertiary,
        surface: colors.surfaceRaised,
        error: colors.error,
      ).copyWith(
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        tertiary: colors.tertiary,
        onTertiary: colors.onTertiary,
        surface: colors.surfaceRaised,
        onSurface: colors.onSurface,
        error: colors.error,
        onError: colors.onError,
      ),
      scaffoldBackgroundColor: colors.shellBackground,
      canvasColor: colors.surfaceRaised,
      splashFactory: NoSplash.splashFactory,
    );

    return base.copyWith(
      cardColor: colors.surfaceRaised,
      dividerColor: colors.divider,
      hoverColor: colors.primary.withValues(alpha: 0.04),
      highlightColor: colors.primary.withValues(alpha: 0.04),
      focusColor: colors.focus,
      textTheme: _buildTextTheme(
        base.textTheme,
        colors,
        useGoogleFonts: useGoogleFonts,
      ),
      inputDecorationTheme: _buildInputDecorationTheme(
        colors,
        spacing,
        radii,
        useGoogleFonts: useGoogleFonts,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.focus,
        selectionColor: colors.primary.withValues(alpha: 0.18),
        selectionHandleColor: colors.focus,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          elevation: 0,
          minimumSize: const Size(0, 52),
          padding: EdgeInsets.symmetric(
            horizontal: spacing.lg,
            vertical: spacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radii.md),
          ),
        textStyle: _labelLargeStyle(
          colors,
          useGoogleFonts: useGoogleFonts,
        ),
      ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.onSurface,
          backgroundColor: colors.surfaceRaised,
          elevation: 0,
          minimumSize: const Size(0, 52),
          side: BorderSide(color: colors.borderStrong),
          padding: EdgeInsets.symmetric(
            horizontal: spacing.lg,
            vertical: spacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radii.md),
          ),
        textStyle: _labelLargeStyle(
          colors,
          useGoogleFonts: useGoogleFonts,
        ),
      ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.onSurface,
          minimumSize: const Size(0, 44),
          padding: EdgeInsets.symmetric(
            horizontal: spacing.sm,
            vertical: spacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radii.round),
          ),
        textStyle: _labelLargeStyle(
          colors,
          useGoogleFonts: useGoogleFonts,
        ),
      ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: colors.onSurface,
          backgroundColor: colors.surfaceRaised,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radii.round),
          ),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: colors.surfaceMuted,
        selectedColor: colors.primarySoft,
        disabledColor: colors.surfaceStrong,
        side: BorderSide(color: colors.border),
        padding: EdgeInsets.symmetric(
          horizontal: spacing.sm,
          vertical: spacing.xs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii.round),
        ),
        labelStyle: _labelLargeStyle(
          colors,
          useGoogleFonts: useGoogleFonts,
        ).copyWith(fontSize: 13),
        secondaryLabelStyle: _labelLargeStyle(
          colors,
          useGoogleFonts: useGoogleFonts,
        ).copyWith(fontSize: 13),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: colors.surfaceRaised,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii.lg),
          side: BorderSide(color: colors.border),
        ),
        textStyle: _bodyStyle(
          colors,
          useGoogleFonts: useGoogleFonts,
        ),
      ),
      dataTableTheme: DataTableThemeData(
        headingRowColor: WidgetStatePropertyAll<Color>(colors.surfaceMuted),
        dataRowColor: WidgetStatePropertyAll<Color>(colors.surfaceRaised),
        headingTextStyle: _labelLargeStyle(
          colors,
          useGoogleFonts: useGoogleFonts,
        ),
        dataTextStyle: _bodyStyle(
          colors,
          useGoogleFonts: useGoogleFonts,
        ),
        dividerThickness: 0.6,
        dataRowMinHeight: 56,
        dataRowMaxHeight: 72,
        headingRowHeight: 52,
      ),
      dividerTheme: DividerThemeData(
        color: colors.divider,
        thickness: 0.8,
        space: spacing.lg,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        colors,
        spacing,
        radii,
        layout,
        motion,
        shadows,
      ],
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme(
    AppColorTokens colors,
    AppSpacingTokens spacing,
    AppRadiusTokens radii,
    {
    required bool useGoogleFonts,
    }
  ) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colors.surfaceRaised,
      hintStyle: _bodyMutedStyle(
        colors,
        useGoogleFonts: useGoogleFonts,
      ),
      labelStyle: _bodyMutedStyle(
        colors,
        useGoogleFonts: useGoogleFonts,
      ),
      floatingLabelStyle: _labelLargeStyle(
        colors,
        useGoogleFonts: useGoogleFonts,
      ).copyWith(
        color: colors.primary,
      ),
      suffixStyle: _labelLargeStyle(
        colors,
        useGoogleFonts: useGoogleFonts,
      ).copyWith(
        color: colors.onSurfaceMuted,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: spacing.md,
        vertical: spacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radii.md),
        borderSide: BorderSide(color: colors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radii.md),
        borderSide: BorderSide(color: colors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radii.md),
        borderSide: BorderSide(
          color: colors.focus,
          width: 1.3,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radii.md),
        borderSide: BorderSide(color: colors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radii.md),
        borderSide: BorderSide(
          color: colors.error,
          width: 1.3,
        ),
      ),
    );
  }

  static TextTheme _buildTextTheme(
    TextTheme base,
    AppColorTokens colors, {
    required bool useGoogleFonts,
  }) {
    final TextTheme sans = useGoogleFonts
        ? GoogleFonts.plusJakartaSansTextTheme(base).apply(
            bodyColor: colors.onSurface,
            displayColor: colors.onSurface,
          )
        : base.apply(
            bodyColor: colors.onSurface,
            displayColor: colors.onSurface,
          );

    return sans.copyWith(
      displayLarge: _headlineFont(
        useGoogleFonts,
        textStyle: sans.displayLarge?.copyWith(
          color: colors.onSurface,
          fontSize: 68,
          height: 0.95,
          fontWeight: FontWeight.w600,
        ),
      ),
      displayMedium: _headlineFont(
        useGoogleFonts,
        textStyle: sans.displayMedium?.copyWith(
          color: colors.onSurface,
          fontSize: 54,
          height: 0.98,
          fontWeight: FontWeight.w600,
        ),
      ),
      headlineLarge: _headlineFont(
        useGoogleFonts,
        textStyle: sans.headlineLarge?.copyWith(
          color: colors.onSurface,
          fontSize: 40,
          height: 1.02,
          fontWeight: FontWeight.w600,
        ),
      ),
      headlineMedium: _headlineFont(
        useGoogleFonts,
        textStyle: sans.headlineMedium?.copyWith(
          color: colors.onSurface,
          fontSize: 30,
          height: 1.08,
          fontWeight: FontWeight.w600,
        ),
      ),
      titleLarge: sans.titleLarge?.copyWith(
        color: colors.onSurface,
        fontSize: 23,
        height: 1.24,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: sans.titleMedium?.copyWith(
        color: colors.onSurface,
        fontSize: 18,
        height: 1.32,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: _bodyStyle(colors, useGoogleFonts: useGoogleFonts),
      bodyMedium: _bodyMutedStyle(colors, useGoogleFonts: useGoogleFonts),
      labelLarge: _labelLargeStyle(colors, useGoogleFonts: useGoogleFonts),
      labelMedium: _uiFont(
        useGoogleFonts,
        textStyle: sans.labelMedium?.copyWith(
          color: colors.onSurfaceMuted,
          fontSize: 11.5,
          height: 1.2,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  static TextStyle _bodyStyle(
    AppColorTokens colors, {
    required bool useGoogleFonts,
  }) {
    return _uiFont(
      useGoogleFonts,
      textStyle: TextStyle(
        color: colors.onSurface,
        fontSize: 16,
        height: 1.66,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextStyle _bodyMutedStyle(
    AppColorTokens colors, {
    required bool useGoogleFonts,
  }) {
    return _uiFont(
      useGoogleFonts,
      textStyle: TextStyle(
        color: colors.onSurfaceMuted,
        fontSize: 14,
        height: 1.68,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextStyle _labelLargeStyle(
    AppColorTokens colors, {
    bool useGoogleFonts = true,
  }) {
    return _uiFont(
      useGoogleFonts,
      textStyle: TextStyle(
        color: colors.onSurface,
        fontSize: 14,
        height: 1.25,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextStyle _headlineFont(
    bool useGoogleFonts, {
    required TextStyle? textStyle,
  }) {
    if (!useGoogleFonts) {
      return textStyle ?? const TextStyle();
    }

    return GoogleFonts.newsreader(textStyle: textStyle);
  }

  static TextStyle _uiFont(
    bool useGoogleFonts, {
    required TextStyle? textStyle,
  }) {
    if (!useGoogleFonts) {
      return textStyle ?? const TextStyle();
    }

    return GoogleFonts.plusJakartaSans(textStyle: textStyle);
  }
}

extension ThemeDataContractX on ThemeData {
  AppThemeContract get contract => _AppThemeData(this);
}

final class _AppThemeData implements AppThemeContract {
  _AppThemeData(this._themeData);

  final ThemeData _themeData;

  @override
  AppColorTokens get colors =>
      _themeData.extension<AppColorTokens>() ??
      const AppColorTokens.premiumFinance();

  @override
  AppLayoutTokens get layout =>
      _themeData.extension<AppLayoutTokens>() ?? const AppLayoutTokens.web();

  @override
  AppMotionTokens get motion =>
      _themeData.extension<AppMotionTokens>() ??
      const AppMotionTokens.standard();

  @override
  AppRadiusTokens get radii =>
      _themeData.extension<AppRadiusTokens>() ?? const AppRadiusTokens.standard();

  @override
  AppShadowTokens get shadows =>
      _themeData.extension<AppShadowTokens>() ??
      const AppShadowTokens.premium();

  @override
  AppSpacingTokens get spacing =>
      _themeData.extension<AppSpacingTokens>() ??
      const AppSpacingTokens.standard();
}
