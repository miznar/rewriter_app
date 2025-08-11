import 'package:flutter/material.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_button.dart';
import '../../../../app/routes/app_routes.dart';
import '../widgets/social_login_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  (route) => false,
                ),
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(height: 40),
              const Text(
                "Let’s Sign you in.",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Welcome back\nYou’ve been missed!",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 50),
              const AuthTextField(label: "Username or Email"),
              const SizedBox(height: 16),
              const AuthTextField(
                label: "Password",
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off),
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SocialLoginButton(icon: 'assets/logos/google.png'),
                ],
              ),
              const SizedBox(height: 140),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signUp);
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AuthButton(
                text: "Login",
                onPressed: () {
                  // Perform login
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
