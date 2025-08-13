import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'app/routes/app_routes.dart';
import 'core/themes/app_theme.dart';
import 'features/login_screen/login_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/presentation/view/sign_in_screen.dart';
import 'features/auth/presentation/view/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

  runApp(
    ProviderScope(
      child: MyApp(hasSeenOnboarding: hasSeenOnboarding),
    ),
  );
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
