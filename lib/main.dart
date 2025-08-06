import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/homescreen/home_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

  runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  const MyApp({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rewriter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute:
      hasSeenOnboarding ? AppRoutes.home : AppRoutes.onboarding,
      routes: {
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String home = '/home';
}
