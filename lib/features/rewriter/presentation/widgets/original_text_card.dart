import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class OriginalTextCard extends StatelessWidget {
  final void Function(String text) onTextChanged;

  const OriginalTextCard({
    super.key,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Card(
      color: colors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Original Text",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: colors.primaryText,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 5,
              cursorColor: colors.primaryText,
              onChanged: onTextChanged, // <-- callback here
              decoration: InputDecoration(
                filled: true,
                fillColor: colors.card.withOpacity(0.05),
                hintText: "Paste or type your text here...",
                hintStyle: TextStyle(
                  color: colors.primaryText.withOpacity(0.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colors.primaryText.withOpacity(0.3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colors.primaryText.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colors.primaryText, width: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
