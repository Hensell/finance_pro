import 'package:finance_pro/app/app.dart';
import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

Future<void> bootstrapApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TeXRenderingServer.start();

  final AppDependencies dependencies = AppDependencies.create();
  runApp(FinanceProApp(dependencies: dependencies));
}
