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
  testWidgets('Splash hides footer and redirects to home before footer appears', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();
    final AppRouter appRouter = AppRouter();

    tester.view.physicalSize = const Size(1440, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

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

    await tester.pump();

    expect(find.text('Finance Pro'), findsOneWidget);
    expect(find.text('© 2026 Hensell Dev'), findsNothing);

    await tester.pump(const Duration(milliseconds: 950));
    await tester.pumpAndSettle();

    expect(appRouter.config.routeInformationProvider.value.uri.path, '/home');
    expect(find.text('© 2026 Hensell Dev'), findsOneWidget);
    expect(find.text('Inicio'), findsOneWidget);
  });
}
