import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class TabSwitcher extends StatelessWidget {
  const TabSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: const [
          _TabButton(label: "Workspace", selected: true),
          SizedBox(width: 12),
          _TabButton(label: "History"),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;

  const _TabButton({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? colors.iconColor.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: selected ? colors.iconColor : colors.primaryText,
        ),
      ),
    );
  }
}
