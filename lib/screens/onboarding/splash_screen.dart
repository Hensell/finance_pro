import 'package:finance_pro/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const HomeScreen();
          } else {
            return const Center(
                child: Text(
              'Bienvenidos a la APP de finanzas II',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ));
          }
        },
      ),
    );
  }

  Future<void> _initializeApp() async {
    // Simula una inicialización de base de datos asíncrona
    await Future.delayed(const Duration(seconds: 3));
  }
}
