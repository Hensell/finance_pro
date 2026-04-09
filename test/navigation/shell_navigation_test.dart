import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/localization/app_locale_cubit.dart';
import 'package:finance_pro/app/router/app_router.dart';
import 'package:finance_pro/app/theme/app_theme.dart';
import 'package:finance_pro/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_support/test_app_harness.dart';

void main() {
  testWidgets('Desktop shell navigates through every module entry', (
    WidgetTester tester,
  ) async {
    final appRouter = AppRouter();
    final dependencies = createGoldenDependencies();

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
    await tester.pumpAndSettle();

    appRouter.config.go('/feature/bonds');
    await tester.pumpAndSettle();
    expect(
      find.text(
        'Un bono vale el presente de los cupones y del valor a la par descontados al rendimiento requerido por el mercado.',
      ),
      findsOneWidget,
    );

    await _tapRailItem(tester, 'Acciones');
    expect(
      appRouter.config.routeInformationProvider.value.uri.path,
      '/feature/shares',
    );
    expect(
      find.text(
        'La valuación de acciones depende de los dividendos esperados, la etapa de crecimiento y el rendimiento que exige el inversionista.',
      ),
      findsOneWidget,
    );

    await _tapRailItem(tester, 'Apalancamiento');
    expect(
      appRouter.config.routeInformationProvider.value.uri.path,
      '/feature/leverage',
    );
    expect(
      find.text(
        'El apalancamiento muestra cuánto se amplifica el beneficio cuando cambian ventas, costos fijos o compromisos financieros.',
      ),
      findsOneWidget,
    );

    await _tapRailItem(tester, 'Razones financieras');
    expect(
      appRouter.config.routeInformationProvider.value.uri.path,
      '/feature/financial_ratios',
    );
    expect(
      find.text(
        'Convierte estado de resultados y balance general en señales comparables sobre liquidez, actividad, deuda, rentabilidad y lectura integrada.',
      ),
      findsOneWidget,
    );

    await _tapRailItem(tester, 'Arrendamiento financiero');
    expect(
      appRouter.config.routeInformationProvider.value.uri.path,
      '/feature/lease',
    );
    expect(
      find.text(
        'El arrendamiento financiero se estudia comparando el valor presente de sus pagos contra la alternativa de comprar hoy y recuperar un valor residual al final.',
      ),
      findsWidgets,
    );

    await _tapRailItem(tester, 'Inicio');
    expect(appRouter.config.routeInformationProvider.value.uri.path, '/home');
  });

  testWidgets(
    'Desktop shell leaves focused calculators without navigation exceptions',
    (WidgetTester tester) async {
      final appRouter = AppRouter();
      final dependencies = createGoldenDependencies();

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
      await tester.pumpAndSettle();

      await _assertFocusedCalculatorCanNavigateBack(
        tester: tester,
        appRouter: appRouter,
        calculatorLocation: '/feature/bonds/calculator',
        featureLabel: 'Bonos',
        expectedLocation: '/feature/bonds',
      );
      await _assertFocusedCalculatorCanNavigateBack(
        tester: tester,
        appRouter: appRouter,
        calculatorLocation: '/feature/shares/calculator',
        featureLabel: 'Acciones',
        expectedLocation: '/feature/shares',
      );
      await _assertFocusedCalculatorCanNavigateBack(
        tester: tester,
        appRouter: appRouter,
        calculatorLocation: '/feature/leverage/calculator',
        featureLabel: 'Apalancamiento',
        expectedLocation: '/feature/leverage',
      );
      await _assertFocusedCalculatorCanNavigateBack(
        tester: tester,
        appRouter: appRouter,
        calculatorLocation: '/feature/lease/calculator',
        featureLabel: 'Arrendamiento financiero',
        expectedLocation: '/feature/lease',
      );
      await _assertFocusedCalculatorCanNavigateBack(
        tester: tester,
        appRouter: appRouter,
        calculatorLocation: '/feature/financial_ratios/calculator',
        featureLabel: 'Razones financieras',
        expectedLocation: '/feature/financial_ratios',
      );
    },
  );
}

Future<void> _tapRailItem(WidgetTester tester, String label) async {
  await tester.ensureVisible(find.text(label).first);
  await tester.tap(find.text(label).first);
  await tester.pumpAndSettle();
  expect(tester.takeException(), isNull);
}

Future<void> _assertFocusedCalculatorCanNavigateBack({
  required WidgetTester tester,
  required AppRouter appRouter,
  required String calculatorLocation,
  required String featureLabel,
  required String expectedLocation,
}) async {
  appRouter.config.go(calculatorLocation);
  await tester.pumpAndSettle();

  final Finder field = find.byType(TextField).first;
  await tester.ensureVisible(field);
  await tester.tap(field);
  await tester.pump();
  await tester.enterText(field, '100');
  await tester.pump();

  await _tapRailItem(tester, featureLabel);
  expect(
    appRouter.config.routeInformationProvider.value.uri.path,
    expectedLocation,
  );
}
