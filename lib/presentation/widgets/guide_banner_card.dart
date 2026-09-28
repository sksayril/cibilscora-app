import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'gauge_meter_painter.dart';

class GuideBannerCard extends StatelessWidget {
  const GuideBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.bannerBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD6E4FF),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Top Banner Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Row(
              children: [
                // Left Column Copy
                Expanded(
                  flex: 52,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Your Guide to\nBetter Credit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '& Better Future',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Understand what affects your CIBIL\nscore and follow the right steps\nto improve it.',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textMedium,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Column Illustration (Gauge + Clipboard + Shield)
                Expanded(
                  flex: 48,
                  child: SizedBox(
                    height: 120,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Gauge Arc & Score Text
                        Positioned(
                          left: 0,
                          top: 0,
                          child: SizedBox(
                            width: 130,
                            height: 85,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomPaint(
                                  size: const Size(130, 80),
                                  painter: ScoreGaugePainter(
                                    score: 782,
                                    strokeWidth: 10.0,
                                  ),
                                ),
                                Positioned(
                                  top: 32,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        '782',
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.textDark,
                                          height: 1.0,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.scoreGoodText,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Text(
                                          'Good',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Clipboard Graphic
                        Positioned(
                          right: 8,
                          bottom: 6,
                          child: Container(
                            width: 62,
                            height: 78,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 14,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0C56E8),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                _checkRow(),
                                const SizedBox(height: 4),
                                _checkRow(),
                                const SizedBox(height: 4),
                                _checkRow(),
                              ],
                            ),
                          ),
                        ),

                        // Blue Shield Checkmark Badge
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Color(0xFF0C56E8),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x400C56E8),
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Sub-Card: CIBIL Score Range Breakdown
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF64748B).withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Left Score Range Heading
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'CIBIL Score Range',
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMuted,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '300 – 900',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 12),
                  Container(width: 1, height: 32, color: const Color(0xFFE2E8F0)),
                  const SizedBox(width: 8),

                  // Right Score Categories Row
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: const [
                          _RangeCategoryItem(
                            label: 'Poor',
                            range: '300 - 549',
                            dotColor: AppColors.gaugeRed,
                          ),
                          SizedBox(width: 10),
                          _RangeCategoryItem(
                            label: 'Average',
                            range: '550 - 649',
                            dotColor: AppColors.gaugeOrange,
                          ),
                          SizedBox(width: 10),
                          _RangeCategoryItem(
                            label: 'Good',
                            range: '650 - 749',
                            dotColor: AppColors.gaugeYellow,
                          ),
                          SizedBox(width: 10),
                          _RangeCategoryItem(
                            label: 'Very Good',
                            range: '750 - 799',
                            dotColor: Color(0xFF10B981),
                          ),
                          SizedBox(width: 10),
                          _RangeCategoryItem(
                            label: 'Excellent',
                            range: '800 - 900',
                            dotColor: Color(0xFF047857),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _checkRow() {
    return Row(
      children: [
        const Icon(Icons.keyboard_arrow_down_rounded, size: 10, color: Color(0xFF10B981)),
        const SizedBox(width: 2),
        Container(
          width: 32,
          height: 3,
          color: const Color(0xFFE2E8F0),
        ),
      ],
    );
  }
}

class _RangeCategoryItem extends StatelessWidget {
  final String label;
  final String range;
  final Color dotColor;

  const _RangeCategoryItem({
    required this.label,
    required this.range,
    required this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          range,
          style: const TextStyle(
            fontSize: 9.0,
            fontWeight: FontWeight.w500,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
