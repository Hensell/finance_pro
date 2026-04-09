import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/localization/app_locale_cubit.dart';
import 'package:finance_pro/app/router/app_router.dart';
import 'package:finance_pro/app/theme/app_theme.dart';
import 'package:finance_pro/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/test_app_harness.dart';

void main() {
  testWidgets(
    'TopicPage redirects single-topic features back to the feature overview',
    (WidgetTester tester) async {
      final AppRouter appRouter = AppRouter();
      final AppDependencies dependencies = createGoldenDependencies();

      await tester.pumpWidget(
        MultiRepositoryProvider(
          providers: <RepositoryProvider<dynamic>>[
            RepositoryProvider<AppDependencies>.value(value: dependencies),
          ],
          child: BlocProvider<AppLocaleCubit>(
            create: (_) => AppLocaleCubit(),
            child: MaterialApp.router(
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
              routerConfig: appRouter.config,
            ),
          ),
        ),
      );

      appRouter.config.go('/feature/bonds/topic/bond_valuation');
      await tester.pumpAndSettle();

      expect(
        appRouter.config.routeInformationProvider.value.uri.path,
        '/feature/bonds',
      );
      expect(find.text('Valuación e interpretación del bono'), findsOneWidget);
    },
  );
}
