import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class RewriteInputBox extends StatelessWidget {
  final TextEditingController controller;

  const RewriteInputBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return TextField(
      controller: controller,
      maxLines: 5,
      style: TextStyle(color: colors.primaryText),
      decoration: InputDecoration(
        labelText: "Enter your text",
        labelStyle: TextStyle(color: colors.primaryText),
        filled: true,
        fillColor: colors.card,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.iconColor.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.iconColor, width: 1.5),
        ),
        alignLabelWithHint: true,
      ),
    );
  }
}
