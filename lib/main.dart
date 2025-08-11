import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/routes/app_routes.dart';
import 'core/themes/app_theme.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        extensions: <ThemeExtension<dynamic>>[AppColors.light],
      ),
      initialRoute: hasSeenOnboarding ? AppRoutes.home : AppRoutes.onboarding,
      routes: AppRoutes.routes,
    );
  }
}
