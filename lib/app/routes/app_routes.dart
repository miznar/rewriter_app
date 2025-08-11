import 'package:flutter/material.dart';
import '../../features/auth/presentation/view/sign_in_screen.dart';


class AppRoutes {
  static const String signIn = '/signin';
  static const String signUp = '/signup';


  static final Map<String, WidgetBuilder> routes = {
    signIn: (context) => SignInScreen(),

  };
}
