import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import 'tone_card.dart';

class ToneSelector extends StatefulWidget {
  final String selectedTone;
  final void Function(String tone) onToneSelected;

  const ToneSelector({
    super.key,
    required this.selectedTone,
    required this.onToneSelected,
  });

  @override
  State<ToneSelector> createState() => _ToneSelectorState();
}

class _ToneSelectorState extends State<ToneSelector> {
  final tones = [
    {"label": "Professional", "icon": Icons.work},
    {"label": "Casual", "icon": Icons.weekend},
    {"label": "Fun", "icon": Icons.celebration},
    {"label": "Awesome", "icon": Icons.star},
    {"label": "Custom", "icon": Icons.edit},
  ];

  late String selectedTone;

  @override
  void initState() {
    super.initState();
    selectedTone = widget.selectedTone;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Card(
      color: colors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose your tone",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: colors.primaryText,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tones.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.8,
              ),
              itemBuilder: (context, index) {
                final toneData = tones[index];
                final isSelected = selectedTone == toneData["label"];

                return ToneCard(
                  tone: toneData["label"] as String,
                  icon: toneData["icon"] as IconData,
                  selected: isSelected,
                  onTap: () {
                    setState(() => selectedTone = toneData["label"] as String);
                    widget.onToneSelected(selectedTone);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
