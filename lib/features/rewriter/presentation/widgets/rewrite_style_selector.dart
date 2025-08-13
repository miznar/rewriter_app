import 'package:flutter/material.dart';

import '../../../../core/themes/app_theme.dart';


class RewriteStyleSelector extends StatelessWidget {
  final String selectedStyle;
  final List<String> styles;
  final ValueChanged<String> onStyleChanged;

  const RewriteStyleSelector({
    super.key,
    required this.selectedStyle,
    required this.styles,
    required this.onStyleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Wrap(
      spacing: 8,
      children: styles.map((style) {
        final isSelected = style == selectedStyle;
        return ChoiceChip(
          label: Text(
            style,
            style: TextStyle(
              color: isSelected ? Colors.white : colors.primaryText,
            ),
          ),
          selected: isSelected,
          selectedColor: colors.iconColor,
          backgroundColor: colors.card,
          onSelected: (_) => onStyleChanged(style),
        );
      }).toList(),
    );
  }
}
