import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class PrimaryActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryActionButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), // match card margins
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.accentText,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20),
            textStyle: textStyle,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
