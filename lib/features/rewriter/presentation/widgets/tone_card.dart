import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class ToneCard extends StatelessWidget {
  final String tone;
  final bool selected;
  final VoidCallback onTap;
  final IconData icon;

  const ToneCard({
    super.key,
    required this.tone,
    this.selected = false,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: selected ? colors.accentText : colors.card,
          border: Border.all(
            color: selected ? colors.accentText : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 28,
              color: selected ? Colors.white : colors.primaryText,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                tone,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: selected ? Colors.white : colors.primaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
