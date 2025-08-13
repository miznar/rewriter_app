import 'package:flutter/material.dart';
import '../../core/themes/app_theme.dart';
import '../../app/routes/app_routes.dart';
import '../../shared/widgets/app_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signIn);
  }

  void _navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUp);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isTablet = screenWidth > 600;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppHeader(
            title: 'Rewrite',
            onSignInTap: () => _navigateToSignIn(context),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 64 : 24,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Transform Your Text ',
                        style: TextStyle(
                          fontSize: isTablet ? 30 : 24,
                          fontWeight: FontWeight.bold,
                          color: colors.primaryText,
                        ),
                      ),
                      TextSpan(
                        text: 'Instantly',
                        style: TextStyle(
                          fontSize: isTablet ? 30 : 24,
                          fontWeight: FontWeight.bold,
                          color: colors.accentText,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Subtitle
                Text(
                  'Rewrite any text with AI-powered tone transformation. From professional to casual, fun to awesome - make your words work perfectly for any situation.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isTablet ? 18 : 15,
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(height: 24),

                // Get Started Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _navigateToSignUp(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.accentText,
                      padding: EdgeInsets.symmetric(
                        vertical: isTablet ? 18 : 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Get Started Free',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 18 : 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Feature Cards
                _buildFeatureCard(
                  context,
                  icon: Icons.auto_fix_high,
                  title: 'Smart Rewriting',
                  subtitle:
                      'AI-powered text transformation that preserves meaning while changing tone',
                  isTablet: isTablet,
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.record_voice_over,
                  title: 'Multiple Tones',
                  subtitle:
                      'Switch between professional, casual, friendly, or persuasive tones',
                  isTablet: isTablet,
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.history,
                  title: 'History Tracking',
                  subtitle:
                      'Easily revisit and reuse your past rewritten texts anytime',
                  isTablet: isTablet,
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.lock,
                  title: 'Secure and Private',
                  subtitle: 'Your content stays private and secure, always',
                  isTablet: isTablet,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isTablet,
  }) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final cardHeight = isTablet ? 220.0 : 200.0;

    return SizedBox(
      width: double.infinity,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: cardHeight),
        child: Card(
          color: colors.card,
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isTablet ? 24 : 20,
              horizontal: isTablet ? 20 : 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: isTablet ? 48 : 40, color: colors.iconColor),
                const SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.primaryText,
                    fontSize: isTablet ? 20 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: isTablet ? 16 : 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
