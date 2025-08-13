import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class TabSwitcher extends StatelessWidget {
  final String selectedTab;
  final VoidCallback? onWorkspaceTap;
  final VoidCallback? onHistoryTap;

  const TabSwitcher({
    super.key,
    required this.selectedTab,
    this.onWorkspaceTap,
    this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _TabButton(
            label: "Workspace",
            selected: selectedTab == "Workspace",
            onTap: onWorkspaceTap,
          ),
          const SizedBox(width: 12),
          _TabButton(
            label: "History",
            selected: selectedTab == "History",
            onTap: onHistoryTap,
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const _TabButton({
    required this.label,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? colors.iconColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: selected ? colors.background : colors.primaryText,
          ),
        ),
      ),
    );
  }
}
