import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';
import 'features/homescreen/home_screen.dart';
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
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.light.background,
        cardColor: AppColors.light.card,
        iconTheme: const IconThemeData(color: Colors.blue),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
        extensions: <ThemeExtension<dynamic>>[
          AppColors.light, // ✅ This is required to use `AppColors` in screens
        ],
      ),
      initialRoute:
      hasSeenOnboarding ? AppRoutes.home : AppRoutes.onboarding,
      routes: {
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        // AppRoutes.login: (context) => const LoginScreen(), // if needed
      },
    );
  }
}

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String login = '/login'; // Add this if you're using login navigation

