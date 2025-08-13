import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colors.primaryText,
            )),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(color: colors.primaryText.withOpacity(0.7)),
        ),
      ],
    );
  }
}
