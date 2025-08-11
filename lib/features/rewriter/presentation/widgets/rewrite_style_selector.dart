import 'package:flutter/material.dart';

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
    return Wrap(
      spacing: 8,
      children: styles.map((style) {
        final isSelected = style == selectedStyle;
        return ChoiceChip(
          label: Text(style),
          selected: isSelected,
          onSelected: (_) => onStyleChanged(style),
        );
      }).toList(),
    );
  }
}
