import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color primaryText;   // Black text
  final Color accentText;    // Blue hook text
  final Color iconColor;     // Blue icons
  final Color background;    // White background
  final Color card;          // White cards

  const AppColors({
    required this.primaryText,
    required this.accentText,
    required this.iconColor,
    required this.background,
    required this.card,
  });

  @override
  AppColors copyWith({
    Color? primaryText,
    Color? accentText,
    Color? iconColor,
    Color? background,
    Color? card,
  }) {
    return AppColors(
      primaryText: primaryText ?? this.primaryText,
      accentText: accentText ?? this.accentText,
      iconColor: iconColor ?? this.iconColor,
      background: background ?? this.background,
      card: card ?? this.card,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      accentText: Color.lerp(accentText, other.accentText, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      background: Color.lerp(background, other.background, t)!,
      card: Color.lerp(card, other.card, t)!,
    );
  }

  static const light = AppColors(
    primaryText: Colors.black,
    accentText: Colors.indigoAccent,
    iconColor: Colors.indigoAccent,
    background: Colors.white,
    card: Colors.white,
  );
}
