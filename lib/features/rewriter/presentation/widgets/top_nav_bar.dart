import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.edit, color: colors.iconColor),
              const SizedBox(width: 8),
              Text(
                "Rewriter",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colors.primaryText,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.brightness_6, color: colors.iconColor),
                onPressed: () {},
              ),
              const CircleAvatar(child: Text("A")),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Sign Out",
                  style: TextStyle(color: colors.accentText),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
