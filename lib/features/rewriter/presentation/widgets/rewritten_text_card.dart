import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class RewrittenTextCard extends StatelessWidget {
  final String rewrittenText;
  final String selectedTone;

  const RewrittenTextCard({
    super.key,
    required this.rewrittenText,
    required this.selectedTone,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final hasText = rewrittenText.trim().isNotEmpty;
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive icon sizes
    final iconSize = screenWidth * 0.08; // edit icon size
    final starSize = iconSize * 0.5;     // star icon size
    final iconContainerSize = iconSize * 2.5; // container size for stars around edit icon

    return Card(
      color: colors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16), // Consistent padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Rewritten Text + Selected Tone
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rewritten Text",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16, // Fixed size matching OriginalTextCard
                    color: colors.primaryText,
                  ),
                ),
                Text(
                  selectedTone,
                  style: TextStyle(
                    fontSize: 14, // Slightly smaller fixed size
                    color: colors.primaryText.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12), // Fixed spacing

            // Main content or empty state centered
            if (hasText)
              Text(
                rewrittenText,
                style: TextStyle(
                  fontSize: 14, // Match input body text size
                  color: colors.primaryText,
                ),
              )
            else
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3, // Fixed height container
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit icon with stars around it
                      SizedBox(
                        width: iconContainerSize,
                        height: iconContainerSize,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              left: iconContainerSize * 0.35,
                              child: Icon(Icons.star,
                                  size: starSize,
                                  color: colors.primaryText.withOpacity(0.6)),
                            ),
                            Positioned(
                              top: iconContainerSize * 0.25,
                              right: 0,
                              child: Icon(Icons.star,
                                  size: starSize,
                                  color: colors.primaryText.withOpacity(0.6)),
                            ),
                            Positioned(
                              bottom: 0,
                              right: iconContainerSize * 0.35,
                              child: Icon(Icons.star,
                                  size: starSize,
                                  color: colors.primaryText.withOpacity(0.6)),
                            ),
                            Positioned(
                              bottom: iconContainerSize * 0.25,
                              left: 0,
                              child: Icon(Icons.star,
                                  size: starSize,
                                  color: colors.primaryText.withOpacity(0.6)),
                            ),
                            Icon(
                              Icons.edit,
                              size: iconSize,
                              color: colors.primaryText,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        "Ready to transform",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Fixed size heading
                          color: colors.primaryText,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "Add your text and select a tone to see the magic happen",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14, // Fixed smaller body text
                          color: colors.primaryText.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
