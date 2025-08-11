import 'package:flutter/material.dart';
import '../../features/auth/presentation/view/sign_in_screen.dart';
import '../../features/auth/presentation/view/sign_up_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/homescreen/home_screen.dart';
import '../../features/login_screen/login_screen.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';

  static final Map<String, WidgetBuilder> routes = {
    onboarding: (context) => const OnboardingScreen(),
    home: (context) => const HomeScreen(),
    login: (context) => const LoginScreen(),
    signIn: (context) => const SignInScreen(),
    signUp: (context) => const SignUpScreen(),
  };
}
