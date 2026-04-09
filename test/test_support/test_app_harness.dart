import 'dart:convert';
import 'dart:io';

import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/localization/app_locale_cubit.dart';
import 'package:finance_pro/app/theme/app_theme.dart';
import 'package:finance_pro/design_system/organisms/ds_app_shell.dart';
import 'package:finance_pro/features/bonds/domain/usecases/calculate_bond_value.dart';
import 'package:finance_pro/features/bonds/domain/validators/bond_input_validator.dart';
import 'package:finance_pro/features/financial_ratios/domain/usecases/calculate_financial_ratios.dart';
import 'package:finance_pro/features/financial_ratios/domain/usecases/derive_financial_statements.dart';
import 'package:finance_pro/features/financial_ratios/domain/validators/financial_ratios_input_validator.dart';
import 'package:finance_pro/features/home/domain/entities/home_content.dart';
import 'package:finance_pro/features/home/domain/repositories/home_repository.dart';
import 'package:finance_pro/features/home/domain/usecases/load_home_content.dart';
import 'package:finance_pro/features/lease/domain/usecases/calculate_lease_comparison.dart';
import 'package:finance_pro/features/lease/domain/validators/lease_input_validator.dart';
import 'package:finance_pro/features/leverage/domain/usecases/calculate_financial_leverage.dart';
import 'package:finance_pro/features/leverage/domain/usecases/calculate_operating_leverage.dart';
import 'package:finance_pro/features/leverage/domain/validators/leverage_input_validator.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/domain/repositories/feature_content_repository.dart';
import 'package:finance_pro/features/shared_content/domain/usecases/load_feature_content.dart';
import 'package:finance_pro/features/shares/domain/usecases/calculate_share_valuation.dart';
import 'package:finance_pro/features/shares/domain/validators/share_input_validator.dart';
import 'package:finance_pro/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

AppDependencies createGoldenDependencies() {
  final Map<String, HomeContent> homes = <String, HomeContent>{
    'es': _readHome('es'),
    'en': _readHome('en'),
  };
  final Map<String, Map<String, FeatureContent>> features =
      <String, Map<String, FeatureContent>>{
        'es': _readFeatureMap('es'),
        'en': _readFeatureMap('en'),
      };

  final HomeRepository homeRepository = _FakeHomeRepository(homes);
  final FeatureContentRepository featureRepository =
      _FakeFeatureContentRepository(features);
  const DeriveFinancialStatements deriveFinancialStatements =
      DeriveFinancialStatements();

  return AppDependencies(
    homeRepository: homeRepository,
    featureContentRepository: featureRepository,
    loadHomeContent: LoadHomeContent(homeRepository),
    loadFeatureContent: LoadFeatureContent(featureRepository),
    calculateBondValue: const CalculateBondValue(),
    bondInputValidator: const BondInputValidator(),
    calculateShareValuation: const CalculateShareValuation(),
    shareInputValidator: const ShareInputValidator(),
    calculateOperatingLeverage: const CalculateOperatingLeverage(),
    calculateFinancialLeverage: const CalculateFinancialLeverage(),
    leverageInputValidator: const LeverageInputValidator(),
    calculateLeaseComparison: const CalculateLeaseComparison(),
    leaseInputValidator: const LeaseInputValidator(),
    deriveFinancialStatements: deriveFinancialStatements,
    calculateFinancialRatios: const CalculateFinancialRatios(
      deriveFinancialStatements: deriveFinancialStatements,
    ),
    financialRatiosInputValidator: const FinancialRatiosInputValidator(
      deriveFinancialStatements: deriveFinancialStatements,
    ),
  );
}

Widget buildGoldenHarness({
  required Widget child,
  required AppDependencies dependencies,
  required String currentLocation,
  bool useShell = true,
}) {
  return MultiRepositoryProvider(
    providers: <RepositoryProvider<dynamic>>[
      RepositoryProvider<AppDependencies>.value(value: dependencies),
    ],
    child: BlocProvider<AppLocaleCubit>(
      create: (_) => AppLocaleCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('es'),
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.build(useGoogleFonts: false),
        home: useShell
            ? DsAppShell(currentLocation: currentLocation, child: child)
            : child,
      ),
    ),
  );
}

Map<String, FeatureContent> _readFeatureMap(String localeCode) {
  return <String, FeatureContent>{
    'bonds': _readFeature(localeCode, 'bonds'),
    'shares': _readFeature(localeCode, 'shares'),
    'leverage': _readFeature(localeCode, 'leverage'),
    'financial_ratios': _readFeature(localeCode, 'financial_ratios'),
    'lease': _readFeature(localeCode, 'lease'),
  };
}

FeatureContent _readFeature(String localeCode, String fileName) {
  final String source = File(
    'assets/content/$localeCode/$fileName.json',
  ).readAsStringSync();
  return FeatureContent.fromJson(jsonDecode(source) as Map<String, dynamic>);
}

HomeContent _readHome(String localeCode) {
  final String source = File(
    'assets/content/$localeCode/home.json',
  ).readAsStringSync();
  return HomeContent.fromJson(jsonDecode(source) as Map<String, dynamic>);
}

final class _FakeHomeRepository implements HomeRepository {
  const _FakeHomeRepository(this._contentByLocale);

  final Map<String, HomeContent> _contentByLocale;

  @override
  Future<HomeContent> load({required String localeCode}) async {
    return _contentByLocale[localeCode] ?? _contentByLocale['es']!;
  }
}

final class _FakeFeatureContentRepository implements FeatureContentRepository {
  const _FakeFeatureContentRepository(this._contentByLocale);

  final Map<String, Map<String, FeatureContent>> _contentByLocale;

  @override
  Future<FeatureContent> load({
    required String localeCode,
    required String featureId,
  }) async {
    return _contentByLocale[localeCode]?[featureId] ??
        _contentByLocale['es']![featureId]!;
  }
}
