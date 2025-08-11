import 'package:flutter/material.dart';
import '../../../rewriter/presentation/view/rewriter_screen.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_button.dart';
import '../../../../app/routes/app_routes.dart';
import '../widgets/social_login_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final verticalSpacing = size.height * 0.02;
    final bottomSpacing = size.height * 0.04; // space above bottom button

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height - MediaQuery.of(context).padding.top),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: verticalSpacing),
                  const Icon(Icons.arrow_back),
                  SizedBox(height: size.height * 0.04),
                  const Text(
                    "Let’s Sign you in.",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    "Welcome back\nYou’ve been missed!",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                  SizedBox(height: size.height * 0.05),
                  const AuthTextField(label: "Username or Email"),
                  SizedBox(height: verticalSpacing),
                  const AuthTextField(
                    label: "Password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  SizedBox(height: verticalSpacing * 1.5),
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
                  SizedBox(height: verticalSpacing),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SocialLoginButton(icon: 'assets/logos/google.png'),
                    ],
                  ),
                  const Spacer(), // Pushes the rest down
                  Padding(
                    padding: EdgeInsets.only(bottom: bottomSpacing),
                    child: Column(
                      children: [
                        AuthButton(
                          text: "Login",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const RewriteScreen()),
                            );
                          },
                        ),
                        SizedBox(height: verticalSpacing),
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
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
