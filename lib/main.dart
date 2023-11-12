import 'package:finance_pro/screens/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance Pro',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffD9ED92)),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(),
            bodyMedium: TextStyle(),
          ).apply(
              bodyColor: const Color(0xff1B1B1F), displayColor: Colors.red)),
      home: const SplashScreen(),
    );
  }
}
