import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/localization/app_locale_cubit.dart';
import 'package:finance_pro/app/router/app_router.dart';
import 'package:finance_pro/app/theme/app_theme.dart';
import 'package:finance_pro/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FinanceProApp extends StatefulWidget {
  const FinanceProApp({
    required this.dependencies,
    this.useGoogleFonts = true,
    super.key,
  });

  final AppDependencies dependencies;
  final bool useGoogleFonts;

  @override
  State<FinanceProApp> createState() => _FinanceProAppState();
}

class _FinanceProAppState extends State<FinanceProApp> {
  late final AppLocaleCubit _localeCubit = AppLocaleCubit();
  late final AppRouter _appRouter = AppRouter();

  @override
  void dispose() {
    _localeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: <RepositoryProvider<dynamic>>[
        RepositoryProvider<AppDependencies>.value(value: widget.dependencies),
      ],
      child: BlocProvider<AppLocaleCubit>.value(
        value: _localeCubit,
        child: BlocBuilder<AppLocaleCubit, Locale>(
          builder: (BuildContext context, Locale locale) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              locale: locale,
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              theme: AppTheme.build(
                useGoogleFonts: widget.useGoogleFonts,
              ),
              routerConfig: _appRouter.config,
            );
          },
        ),
      ),
    );
  }
}
