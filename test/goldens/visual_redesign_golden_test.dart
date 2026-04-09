import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:finance_pro/features/bonds/presentation/pages/bond_calculator_page.dart';
import 'package:finance_pro/features/home/presentation/pages/home_page.dart';
import 'package:finance_pro/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:finance_pro/features/shared_content/presentation/pages/feature_overview_page.dart';
import 'package:finance_pro/features/shared_content/presentation/pages/topic_page.dart';
import 'package:finance_pro/features/shares/presentation/pages/share_calculator_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../test_support/test_app_harness.dart';

void main() {
  final AppDependencies dependencies = createGoldenDependencies();

  testGoldens('Onboarding visual redesign', (WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      buildGoldenHarness(
        child: const OnboardingPage(),
        dependencies: dependencies,
        currentLocation: AppRoutePaths.onboarding,
        useShell: false,
      ),
      wrapper: noWrap(),
      surfaceSize: _devices.first.size,
    );

    await multiScreenGolden(
      tester,
      'onboarding_redesign',
      devices: _devices,
      autoHeight: true,
      customPump: _settle,
    );
  });

  testGoldens('Home visual redesign', (WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      buildGoldenHarness(
        child: const HomePage(),
        dependencies: dependencies,
        currentLocation: AppRoutePaths.home,
      ),
      wrapper: noWrap(),
      surfaceSize: _devices.first.size,
    );

    await multiScreenGolden(
      tester,
      'home_redesign',
      devices: _devices,
      autoHeight: true,
      customPump: _settle,
    );
  });

  testGoldens('Feature overview visual redesign', (WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      buildGoldenHarness(
        child: const FeatureOverviewPage(featureId: 'bonds'),
        dependencies: dependencies,
        currentLocation: AppRoutePaths.featureLocation('bonds'),
      ),
      wrapper: noWrap(),
      surfaceSize: _devices.first.size,
    );

    await multiScreenGolden(
      tester,
      'feature_overview_redesign',
      devices: _devices,
      autoHeight: true,
      customPump: _settle,
    );
  });

  testGoldens('Topic page visual redesign', (WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      buildGoldenHarness(
        child: const TopicPage(featureId: 'shares', topicId: 'zero_growth'),
        dependencies: dependencies,
        currentLocation: AppRoutePaths.topicLocation(
          featureId: 'shares',
          topicId: 'zero_growth',
        ),
      ),
      wrapper: noWrap(),
      surfaceSize: _devices.first.size,
    );

    await multiScreenGolden(
      tester,
      'topic_page_redesign',
      devices: _devices,
      autoHeight: true,
      customPump: _settle,
    );
  });

  testGoldens('Bond calculator visual redesign', (WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      buildGoldenHarness(
        child: const BondCalculatorPage(),
        dependencies: dependencies,
        currentLocation: AppRoutePaths.calculatorLocation('bonds'),
      ),
      wrapper: noWrap(),
      surfaceSize: _devices.first.size,
    );

    await multiScreenGolden(
      tester,
      'bond_calculator_redesign',
      devices: _devices,
      autoHeight: true,
      customPump: _settle,
    );
  });

  testGoldens('Share calculator visual redesign', (WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      buildGoldenHarness(
        child: const ShareCalculatorPage(),
        dependencies: dependencies,
        currentLocation: AppRoutePaths.calculatorLocation('shares'),
      ),
      wrapper: noWrap(),
      surfaceSize: _devices.first.size,
    );

    await multiScreenGolden(
      tester,
      'share_calculator_redesign',
      devices: _devices,
      autoHeight: true,
      customPump: _settle,
    );
  });
}

Future<void> _settle(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 250));
  await tester.pumpAndSettle();
}

const List<Device> _devices = <Device>[
  Device(name: 'desktop_1440', size: Size(1440, 1600)),
  Device(name: 'desktop_1024', size: Size(1024, 1520)),
  Device(name: 'tablet_768', size: Size(768, 1360)),
  Device(name: 'mobile_390', size: Size(390, 1320)),
];
