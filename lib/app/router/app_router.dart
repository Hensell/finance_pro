import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/design_system/organisms/ds_app_shell.dart';
import 'package:finance_pro/features/bonds/presentation/pages/bond_calculator_page.dart';
import 'package:finance_pro/features/financial_ratios/presentation/pages/financial_ratios_calculator_page.dart';
import 'package:finance_pro/features/home/presentation/pages/home_page.dart';
import 'package:finance_pro/features/lease/presentation/pages/lease_calculator_page.dart';
import 'package:finance_pro/features/leverage/presentation/pages/leverage_calculator_page.dart';
import 'package:finance_pro/features/not_found/presentation/pages/not_found_page.dart';
import 'package:finance_pro/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:finance_pro/features/shared_content/presentation/pages/feature_overview_page.dart';
import 'package:finance_pro/features/shared_content/presentation/pages/topic_page.dart';
import 'package:finance_pro/features/shares/presentation/pages/share_calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter()
    : config = GoRouter(
        errorPageBuilder: (BuildContext context, GoRouterState state) => _page(
          state: state,
          child: const DsAppShell(
            currentLocation: AppRoutePaths.notFound,
            child: NotFoundPage(),
          ),
        ),
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutePaths.root,
            redirect: (BuildContext context, GoRouterState state) =>
                AppRoutePaths.home,
          ),
          GoRoute(
            path: AppRoutePaths.onboarding,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                _page(state: state, child: const OnboardingPage()),
          ),
          ShellRoute(
            pageBuilder:
                (BuildContext context, GoRouterState state, Widget child) =>
                    _page(
                      state: state,
                      child: DsAppShell(
                        currentLocation: state.uri.path,
                        child: child,
                      ),
                    ),
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutePaths.home,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    _page(state: state, child: const HomePage()),
              ),
              GoRoute(
                path: AppRoutePaths.notFound,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    _page(state: state, child: const NotFoundPage()),
              ),
              GoRoute(
                path: AppRoutePaths.feature,
                redirect: _guardFeature,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    _page(
                      state: state,
                      child: FeatureOverviewPage(
                        featureId: state.pathParameters['featureId']!,
                      ),
                    ),
              ),
              GoRoute(
                path: AppRoutePaths.topic,
                redirect: _guardFeature,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    _page(
                      state: state,
                      child: TopicPage(
                        featureId: state.pathParameters['featureId']!,
                        topicId: state.pathParameters['topicId']!,
                      ),
                    ),
              ),
              GoRoute(
                path: AppRoutePaths.calculator,
                redirect: _guardFeature,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    _page(
                      state: state,
                      child: _calculatorFor(state.pathParameters['featureId']!),
                    ),
              ),
            ],
          ),
        ],
      );

  final GoRouter config;

  static const Set<String> _supportedFeatures = <String>{
    'bonds',
    'shares',
    'leverage',
    'financial_ratios',
    'lease',
  };

  static String? _guardFeature(BuildContext context, GoRouterState state) {
    final String? featureId = state.pathParameters['featureId'];
    return _supportedFeatures.contains(featureId)
        ? null
        : AppRoutePaths.notFound;
  }

  static NoTransitionPage<void> _page({
    required GoRouterState state,
    required Widget child,
  }) {
    return NoTransitionPage<void>(
      key: state.pageKey,
      name: state.name,
      arguments: state.extra,
      child: child,
    );
  }

  static Widget _calculatorFor(String featureId) {
    switch (featureId) {
      case 'bonds':
        return const BondCalculatorPage();
      case 'shares':
        return const ShareCalculatorPage();
      case 'leverage':
        return const LeverageCalculatorPage();
      case 'lease':
        return const LeaseCalculatorPage();
      case 'financial_ratios':
        return const FinancialRatiosCalculatorPage();
      default:
        return const NotFoundPage();
    }
  }
}
