import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

@immutable
class AppColorTokens extends ThemeExtension<AppColorTokens> {
  const AppColorTokens({
    required this.background,
    required this.shellBackground,
    required this.surface,
    required this.surfaceRaised,
    required this.surfaceMuted,
    required this.surfaceStrong,
    required this.primary,
    required this.primarySoft,
    required this.secondary,
    required this.tertiary,
    required this.onPrimary,
    required this.onSecondary,
    required this.onTertiary,
    required this.onSurface,
    required this.onSurfaceMuted,
    required this.border,
    required this.borderStrong,
    required this.divider,
    required this.focus,
    required this.error,
    required this.onError,
    required this.formulaSurface,
    required this.limeAccent,
    required this.tealAccent,
    required this.blueAccent,
  });

  const AppColorTokens.premiumFinance()
      : background = const Color(0xFFF6F1E9),
        shellBackground = const Color(0xFFF2EDE4),
        surface = const Color(0xFFFBF8F2),
        surfaceRaised = const Color(0xFFFFFCF8),
        surfaceMuted = const Color(0xFFF1EBE2),
        surfaceStrong = const Color(0xFFE5DDD1),
        primary = const Color(0xFF1F5C50),
        primarySoft = const Color(0xFFE4EEE8),
        secondary = const Color(0xFF6C7F79),
        tertiary = const Color(0xFF4E6875),
        onPrimary = const Color(0xFFFFFCF8),
        onSecondary = const Color(0xFFFFFCF8),
        onTertiary = const Color(0xFFFBFCFD),
        onSurface = const Color(0xFF22302C),
        onSurfaceMuted = const Color(0xFF65726D),
        border = const Color(0xFFD9D0C4),
        borderStrong = const Color(0xFFC7BEAF),
        divider = const Color(0xFFE3DCD2),
        focus = const Color(0xFF275E54),
        error = const Color(0xFFAB594A),
        onError = const Color(0xFFFFF8F6),
        formulaSurface = const Color(0xFFF3EEE6),
        limeAccent = const Color(0xFFB5C693),
        tealAccent = const Color(0xFF8AA79F),
        blueAccent = const Color(0xFF91A7B5);

  final Color background;
  final Color blueAccent;
  final Color border;
  final Color borderStrong;
  final Color divider;
  final Color error;
  final Color focus;
  final Color formulaSurface;
  final Color limeAccent;
  final Color onError;
  final Color onPrimary;
  final Color onSecondary;
  final Color onSurface;
  final Color onSurfaceMuted;
  final Color onTertiary;
  final Color primary;
  final Color primarySoft;
  final Color secondary;
  final Color shellBackground;
  final Color surface;
  final Color surfaceMuted;
  final Color surfaceRaised;
  final Color surfaceStrong;
  final Color tealAccent;
  final Color tertiary;

  Color accentFor(String accentKey) {
    switch (accentKey) {
      case 'lime':
        return limeAccent;
      case 'teal':
        return tealAccent;
      case 'blue':
      default:
        return blueAccent;
    }
  }

  @override
  AppColorTokens copyWith({
    Color? background,
    Color? blueAccent,
    Color? border,
    Color? borderStrong,
    Color? divider,
    Color? error,
    Color? focus,
    Color? formulaSurface,
    Color? limeAccent,
    Color? onError,
    Color? onPrimary,
    Color? onSecondary,
    Color? onSurface,
    Color? onSurfaceMuted,
    Color? onTertiary,
    Color? primary,
    Color? primarySoft,
    Color? secondary,
    Color? shellBackground,
    Color? surface,
    Color? surfaceMuted,
    Color? surfaceRaised,
    Color? surfaceStrong,
    Color? tealAccent,
    Color? tertiary,
  }) {
    return AppColorTokens(
      background: background ?? this.background,
      blueAccent: blueAccent ?? this.blueAccent,
      border: border ?? this.border,
      borderStrong: borderStrong ?? this.borderStrong,
      divider: divider ?? this.divider,
      error: error ?? this.error,
      focus: focus ?? this.focus,
      formulaSurface: formulaSurface ?? this.formulaSurface,
      limeAccent: limeAccent ?? this.limeAccent,
      onError: onError ?? this.onError,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceMuted: onSurfaceMuted ?? this.onSurfaceMuted,
      onTertiary: onTertiary ?? this.onTertiary,
      primary: primary ?? this.primary,
      primarySoft: primarySoft ?? this.primarySoft,
      secondary: secondary ?? this.secondary,
      shellBackground: shellBackground ?? this.shellBackground,
      surface: surface ?? this.surface,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      surfaceStrong: surfaceStrong ?? this.surfaceStrong,
      tealAccent: tealAccent ?? this.tealAccent,
      tertiary: tertiary ?? this.tertiary,
    );
  }

  @override
  AppColorTokens lerp(covariant ThemeExtension<AppColorTokens>? other, double t) {
    if (other is! AppColorTokens) {
      return this;
    }

    return AppColorTokens(
      background: Color.lerp(background, other.background, t) ?? background,
      blueAccent: Color.lerp(blueAccent, other.blueAccent, t) ?? blueAccent,
      border: Color.lerp(border, other.border, t) ?? border,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t) ?? borderStrong,
      divider: Color.lerp(divider, other.divider, t) ?? divider,
      error: Color.lerp(error, other.error, t) ?? error,
      focus: Color.lerp(focus, other.focus, t) ?? focus,
      formulaSurface:
          Color.lerp(formulaSurface, other.formulaSurface, t) ?? formulaSurface,
      limeAccent: Color.lerp(limeAccent, other.limeAccent, t) ?? limeAccent,
      onError: Color.lerp(onError, other.onError, t) ?? onError,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t) ?? onPrimary,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t) ?? onSecondary,
      onSurface: Color.lerp(onSurface, other.onSurface, t) ?? onSurface,
      onSurfaceMuted:
          Color.lerp(onSurfaceMuted, other.onSurfaceMuted, t) ?? onSurfaceMuted,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t) ?? onTertiary,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      primarySoft: Color.lerp(primarySoft, other.primarySoft, t) ?? primarySoft,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      shellBackground:
          Color.lerp(shellBackground, other.shellBackground, t) ?? shellBackground,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t) ?? surfaceMuted,
      surfaceRaised:
          Color.lerp(surfaceRaised, other.surfaceRaised, t) ?? surfaceRaised,
      surfaceStrong:
          Color.lerp(surfaceStrong, other.surfaceStrong, t) ?? surfaceStrong,
      tealAccent: Color.lerp(tealAccent, other.tealAccent, t) ?? tealAccent,
      tertiary: Color.lerp(tertiary, other.tertiary, t) ?? tertiary,
    );
  }
}

@immutable
class AppSpacingTokens extends ThemeExtension<AppSpacingTokens> {
  const AppSpacingTokens({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.xxxl,
  });

  const AppSpacingTokens.standard()
      : xs = 8,
        sm = 12,
        md = 16,
        lg = 24,
        xl = 32,
        xxl = 48,
        xxxl = 72;

  final double lg;
  final double md;
  final double sm;
  final double xl;
  final double xs;
  final double xxl;
  final double xxxl;

  @override
  AppSpacingTokens copyWith({
    double? lg,
    double? md,
    double? sm,
    double? xl,
    double? xs,
    double? xxl,
    double? xxxl,
  }) {
    return AppSpacingTokens(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      xxxl: xxxl ?? this.xxxl,
    );
  }

  @override
  AppSpacingTokens lerp(covariant ThemeExtension<AppSpacingTokens>? other, double t) {
    if (other is! AppSpacingTokens) {
      return this;
    }

    return AppSpacingTokens(
      xs: lerpDouble(xs, other.xs, t) ?? xs,
      sm: lerpDouble(sm, other.sm, t) ?? sm,
      md: lerpDouble(md, other.md, t) ?? md,
      lg: lerpDouble(lg, other.lg, t) ?? lg,
      xl: lerpDouble(xl, other.xl, t) ?? xl,
      xxl: lerpDouble(xxl, other.xxl, t) ?? xxl,
      xxxl: lerpDouble(xxxl, other.xxxl, t) ?? xxxl,
    );
  }
}

@immutable
class AppRadiusTokens extends ThemeExtension<AppRadiusTokens> {
  const AppRadiusTokens({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.round,
  });

  const AppRadiusTokens.standard()
      : sm = 14,
        md = 18,
        lg = 24,
        xl = 32,
        round = 999;

  final double lg;
  final double md;
  final double round;
  final double sm;
  final double xl;

  @override
  AppRadiusTokens copyWith({
    double? lg,
    double? md,
    double? round,
    double? sm,
    double? xl,
  }) {
    return AppRadiusTokens(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      round: round ?? this.round,
    );
  }

  @override
  AppRadiusTokens lerp(covariant ThemeExtension<AppRadiusTokens>? other, double t) {
    if (other is! AppRadiusTokens) {
      return this;
    }

    return AppRadiusTokens(
      sm: lerpDouble(sm, other.sm, t) ?? sm,
      md: lerpDouble(md, other.md, t) ?? md,
      lg: lerpDouble(lg, other.lg, t) ?? lg,
      xl: lerpDouble(xl, other.xl, t) ?? xl,
      round: lerpDouble(round, other.round, t) ?? round,
    );
  }
}

@immutable
class AppLayoutTokens extends ThemeExtension<AppLayoutTokens> {
  const AppLayoutTokens({
    required this.maxContentWidth,
    required this.maxReadingWidth,
    required this.railWidth,
    required this.asideWidth,
    required this.gridGap,
    required this.pagePadding,
    required this.compactPagePadding,
    required this.sectionGap,
    required this.featureCardHeight,
    required this.breakpointRail,
    required this.breakpointTwoColumn,
    required this.breakpointGridTwoColumn,
  });

  const AppLayoutTokens.web()
      : maxContentWidth = 1280,
        maxReadingWidth = 720,
        railWidth = 292,
        asideWidth = 344,
        gridGap = 24,
        pagePadding = 32,
        compactPagePadding = 20,
        sectionGap = 40,
        featureCardHeight = 292,
        breakpointRail = 1120,
        breakpointTwoColumn = 920,
        breakpointGridTwoColumn = 760;

  final double asideWidth;
  final double breakpointGridTwoColumn;
  final double breakpointRail;
  final double breakpointTwoColumn;
  final double compactPagePadding;
  final double featureCardHeight;
  final double gridGap;
  final double maxContentWidth;
  final double maxReadingWidth;
  final double pagePadding;
  final double railWidth;
  final double sectionGap;

  @override
  AppLayoutTokens copyWith({
    double? asideWidth,
    double? breakpointGridTwoColumn,
    double? breakpointRail,
    double? breakpointTwoColumn,
    double? compactPagePadding,
    double? featureCardHeight,
    double? gridGap,
    double? maxContentWidth,
    double? maxReadingWidth,
    double? pagePadding,
    double? railWidth,
    double? sectionGap,
  }) {
    return AppLayoutTokens(
      asideWidth: asideWidth ?? this.asideWidth,
      breakpointGridTwoColumn:
          breakpointGridTwoColumn ?? this.breakpointGridTwoColumn,
      breakpointRail: breakpointRail ?? this.breakpointRail,
      breakpointTwoColumn: breakpointTwoColumn ?? this.breakpointTwoColumn,
      compactPagePadding: compactPagePadding ?? this.compactPagePadding,
      featureCardHeight: featureCardHeight ?? this.featureCardHeight,
      gridGap: gridGap ?? this.gridGap,
      maxContentWidth: maxContentWidth ?? this.maxContentWidth,
      maxReadingWidth: maxReadingWidth ?? this.maxReadingWidth,
      pagePadding: pagePadding ?? this.pagePadding,
      railWidth: railWidth ?? this.railWidth,
      sectionGap: sectionGap ?? this.sectionGap,
    );
  }

  @override
  AppLayoutTokens lerp(covariant ThemeExtension<AppLayoutTokens>? other, double t) {
    if (other is! AppLayoutTokens) {
      return this;
    }

    return AppLayoutTokens(
      asideWidth: lerpDouble(asideWidth, other.asideWidth, t) ?? asideWidth,
      breakpointGridTwoColumn:
          lerpDouble(
            breakpointGridTwoColumn,
            other.breakpointGridTwoColumn,
            t,
          ) ??
          breakpointGridTwoColumn,
      breakpointRail:
          lerpDouble(breakpointRail, other.breakpointRail, t) ?? breakpointRail,
      breakpointTwoColumn:
          lerpDouble(breakpointTwoColumn, other.breakpointTwoColumn, t) ??
          breakpointTwoColumn,
      compactPagePadding:
          lerpDouble(compactPagePadding, other.compactPagePadding, t) ??
          compactPagePadding,
      featureCardHeight:
          lerpDouble(featureCardHeight, other.featureCardHeight, t) ??
          featureCardHeight,
      gridGap: lerpDouble(gridGap, other.gridGap, t) ?? gridGap,
      maxContentWidth:
          lerpDouble(maxContentWidth, other.maxContentWidth, t) ??
          maxContentWidth,
      maxReadingWidth:
          lerpDouble(maxReadingWidth, other.maxReadingWidth, t) ??
          maxReadingWidth,
      pagePadding: lerpDouble(pagePadding, other.pagePadding, t) ?? pagePadding,
      railWidth: lerpDouble(railWidth, other.railWidth, t) ?? railWidth,
      sectionGap: lerpDouble(sectionGap, other.sectionGap, t) ?? sectionGap,
    );
  }
}

@immutable
class AppMotionTokens extends ThemeExtension<AppMotionTokens> {
  const AppMotionTokens({
    required this.fast,
    required this.regular,
    required this.slow,
  });

  const AppMotionTokens.standard()
      : fast = const Duration(milliseconds: 120),
        regular = const Duration(milliseconds: 180),
        slow = const Duration(milliseconds: 260);

  final Duration fast;
  final Duration regular;
  final Duration slow;

  @override
  AppMotionTokens copyWith({
    Duration? fast,
    Duration? regular,
    Duration? slow,
  }) {
    return AppMotionTokens(
      fast: fast ?? this.fast,
      regular: regular ?? this.regular,
      slow: slow ?? this.slow,
    );
  }

  @override
  AppMotionTokens lerp(covariant ThemeExtension<AppMotionTokens>? other, double t) {
    if (other is! AppMotionTokens) {
      return this;
    }

    return AppMotionTokens(
      fast: _lerpDuration(fast, other.fast, t),
      regular: _lerpDuration(regular, other.regular, t),
      slow: _lerpDuration(slow, other.slow, t),
    );
  }
}

@immutable
class AppShadowTokens extends ThemeExtension<AppShadowTokens> {
  const AppShadowTokens({
    required this.soft,
    required this.floating,
  });

  const AppShadowTokens.premium()
      : soft = const BoxShadow(
          color: Color(0x120E1513),
          blurRadius: 24,
          offset: Offset(0, 10),
        ),
        floating = const BoxShadow(
          color: Color(0x180E1513),
          blurRadius: 34,
          offset: Offset(0, 18),
        );

  final BoxShadow floating;
  final BoxShadow soft;

  @override
  AppShadowTokens copyWith({
    BoxShadow? floating,
    BoxShadow? soft,
  }) {
    return AppShadowTokens(
      floating: floating ?? this.floating,
      soft: soft ?? this.soft,
    );
  }

  @override
  AppShadowTokens lerp(covariant ThemeExtension<AppShadowTokens>? other, double t) {
    if (other is! AppShadowTokens) {
      return this;
    }

    return AppShadowTokens(
      floating: BoxShadow.lerp(floating, other.floating, t) ?? floating,
      soft: BoxShadow.lerp(soft, other.soft, t) ?? soft,
    );
  }
}

Duration _lerpDuration(Duration a, Duration b, double t) {
  return Duration(
    microseconds: lerpDouble(
      a.inMicroseconds.toDouble(),
      b.inMicroseconds.toDouble(),
      t,
    )?.round() ??
        a.inMicroseconds,
  );
}
