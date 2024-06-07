import 'package:flutter/material.dart';
import 'package:flutter_espresso/features/onboarding/presentation/onboarding.dart';
import 'package:flutter_espresso/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Espresso',
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),
      home: const OnboardingScreen(),
    );
  }
}
