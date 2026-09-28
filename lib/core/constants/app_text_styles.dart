import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle headerTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w900,
    color: Color(0xFF0344CD),
    letterSpacing: 0.5,
  );

  static const TextStyle headerSubtitle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
    letterSpacing: 1.5,
  );

  static const TextStyle sectionHeading = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle cardTitleWhite = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle cardSubtitleWhite = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color(0xE6FFFFFF),
  );

  static const TextStyle toolTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static const TextStyle toolSubtitle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static const TextStyle scoreValue = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    height: 1.0,
  );

  static const TextStyle scoreStatus = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.scoreGoodText,
  );

  static const TextStyle gaugeRange = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Color(0xD9FFFFFF),
  );
}
