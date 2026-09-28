import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/tool_detail_header.dart';

class CreditUtilizationScreen extends StatelessWidget {
  final VoidCallback? onBackTap;

  const CreditUtilizationScreen({
    super.key,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolDetailHeader(
        title: 'Credit Utilization',
        subtitle: 'How much credit you are using.',
        actionIcon: Icons.info_outline_rounded,
        onBackTap: onBackTap,
        onActionTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Credit Utilization information...')),
          );
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            // Radial Progress Ring Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF64748B).withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          size: const Size(160, 160),
                          painter: _RadialProgressPainter(percentage: 0.28),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              '28%',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: AppColors.textDark,
                                height: 1.0,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Used',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.toolGreenIcon,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Good',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'You are using credit wisely.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textMedium,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Account Details Summary Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF64748B).withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _detailRow('Total Credit Limit', '₹ 5,00,000'),
                  const Divider(height: 24, thickness: 0.8, color: Color(0xFFF1F5F9)),
                  _detailRow('Total Used Limit', '₹ 1,40,000'),
                  const Divider(height: 24, thickness: 0.8, color: Color(0xFFF1F5F9)),
                  _detailRow('Available Credit', '₹ 3,60,000'),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Bottom Tip Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.toolGreenBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFC6F6D5), width: 1),
              ),
              child: Row(
                children: const [
                  Icon(Icons.star_rounded, color: AppColors.toolGreenIcon, size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Try to keep utilization below 30% for a better score.',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.toolGreenIcon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _detailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double percentage;

  _RadialProgressPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 20) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Track Paint
    final trackPaint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14.0;

    canvas.drawArc(rect, 0, 2 * math.pi, false, trackPaint);

    // Progress Paint (Green)
    final progressPaint = Paint()
      ..color = AppColors.toolGreenIcon
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14.0
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * percentage;
    canvas.drawArc(rect, -math.pi / 2, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant _RadialProgressPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
