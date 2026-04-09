import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:finance_pro/app/router/app_route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_support/test_app_harness.dart';

void main() {
  testWidgets('Desktop shell scrolls on short heights without overflow', (
    WidgetTester tester,
  ) async {
    final AppDependencies dependencies = createGoldenDependencies();

    tester.view.physicalSize = const Size(1180, 720);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      buildGoldenHarness(
        child: const SizedBox(height: 640),
        dependencies: dependencies,
        currentLocation: AppRoutePaths.home,
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Inicio'), findsOneWidget);
    expect(find.text('Finance Pro'), findsNothing);
  });
}
