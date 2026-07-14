import 'package:finance_pro/app/app.dart';
import 'package:finance_pro/app/bootstrap/app_dependencies.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrapApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppDependencies dependencies = AppDependencies.create();
  runApp(FinanceProApp(dependencies: dependencies));
}
