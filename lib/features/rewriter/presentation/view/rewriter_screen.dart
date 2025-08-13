import 'package:flutter/material.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../shared/widgets/app_header.dart';
import '../widgets/top_nav_bar.dart';
import '../widgets/tab_switcher.dart';
import '../widgets/section_title.dart';
import '../widgets/original_text_card.dart';
import '../widgets/tone_selector.dart';
import '../widgets/rewrite_action_button.dart';
import '../widgets/rewritten_text_card.dart';

class RewriteScreen extends StatefulWidget {
  const RewriteScreen({super.key});

  @override
  State<RewriteScreen> createState() => _RewriteScreenState();
}

class _RewriteScreenState extends State<RewriteScreen> {
  String originalText = '';
  String rewrittenText = '';
  String selectedTone = 'Professional';

  void _navigateToSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signIn);
  }

  void _onRewritePressed() {
    // Here you’d call your rewrite API/service
    setState(() {
      rewrittenText = 'This is your rewritten text based on $selectedTone tone.';
    });
  }

  void _onToneSelected(String tone) {
    setState(() {
      selectedTone = tone;
    });
  }

  void _onOriginalTextChanged(String text) {
    setState(() {
      originalText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppHeader(
        title: 'Rewrite',
        onSignInTap: () => _navigateToSignIn(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabSwitcher(),
              const SizedBox(height: 16),
              const SectionTitle(
                title: "Transform Your Text",
                subtitle:
                "Paste your content and watch it transform into the perfect tone for any occasion.",
              ),
              const SizedBox(height: 16),
              // Pass a callback so OriginalTextCard can update state
              OriginalTextCard(
                onTextChanged: _onOriginalTextChanged,
              ),
              const SizedBox(height: 24),
              ToneSelector(
                selectedTone: selectedTone,
                onToneSelected: _onToneSelected,
              ),
              const SizedBox(height: 16),
              PrimaryActionButton(
                text: "Rewrite Text",
                onPressed: _onRewritePressed,
              ),
              const SizedBox(height: 24),
              RewrittenTextCard(
                rewrittenText: rewrittenText,
                selectedTone: selectedTone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
