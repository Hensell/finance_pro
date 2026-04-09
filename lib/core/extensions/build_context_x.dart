import 'package:finance_pro/app/theme/app_theme.dart';
import 'package:finance_pro/app/theme/app_theme_contract.dart';
import 'package:finance_pro/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  AppThemeContract get tokens => Theme.of(this).contract;
}
