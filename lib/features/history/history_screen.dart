import 'package:flutter/material.dart';
import '../../core/themes/app_theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isTablet = screenWidth > 600;

    // Mock history list (replace with your actual storage)
    final List<Map<String, String>> historyItems = [
      {
        'title': 'Professional Rewrite',
        'content': 'Your meeting has been rescheduled to tomorrow at 10 AM.',
      },
      {
        'title': 'Casual Rewrite',
        'content': 'Hey, just a heads-up — meeting’s tomorrow at 10!',
      },
      {
        'title': 'Friendly Rewrite',
        'content': 'Quick update: we’ll meet tomorrow morning at 10. See you!',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(72),
            child: AppBar(
              elevation: 2, // subtle boundary shadow
              backgroundColor: colors.background,
              automaticallyImplyLeading: true,
              title: Text(
                'History',
                style: TextStyle(
                  color: colors.primaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.delete, color: colors.iconColor),
                  tooltip: "Clear History",
                  onPressed: () {
                    // TODO: implement clear history logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Clear history tapped")),
                    );
                  },
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 64 : 24,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: historyItems.isEmpty
                  ? [
                const SizedBox(height: 100),
                Icon(Icons.history, size: 64, color: colors.iconColor),
                const SizedBox(height: 16),
                Text(
                  "No history yet",
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 16,
                    color: colors.primaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
                  : historyItems
                  .map((item) => _buildHistoryCard(
                context,
                title: item['title']!,
                content: item['content']!,
                isTablet: isTablet,
              ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHistoryCard(
      BuildContext context, {
        required String title,
        required String content,
        required bool isTablet,
      }) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final cardHeight = isTablet ? 180.0 : 160.0;

    return SizedBox(
      width: double.infinity,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: cardHeight),
        child: Card(
          color: colors.card,
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isTablet ? 20 : 16,
              horizontal: isTablet ? 20 : 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: colors.primaryText,
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: isTablet ? 16 : 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
