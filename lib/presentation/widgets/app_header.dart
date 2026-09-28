import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hamburger Menu Icon
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu_rounded,
                size: 26,
                color: AppColors.textDark,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),

            // Logo: CIBIL SCORE GUIDE with Gauge icon
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'CIBIL',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0D47A1),
                            letterSpacing: 0.5,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Mini Logo Gauge
                        CustomPaint(
                          size: const Size(26, 18),
                          painter: _HeaderLogoGaugePainter(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'SCORE GUIDE',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                        letterSpacing: 1.5,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Notification Bell with Red Badge Dot
            Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    size: 26,
                    color: AppColors.textDark,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderLogoGaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.85);
    final radius = size.width * 0.42;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final colors = [
      AppColors.gaugeRed,
      AppColors.gaugeOrange,
      AppColors.gaugeYellow,
      AppColors.gaugeGreen,
    ];

    final gradient = SweepGradient(
      center: const Alignment(0.0, 0.7),
      startAngle: math.pi,
      endAngle: 2 * math.pi,
      colors: colors,
    );

    final arcPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(rect, math.pi, math.pi, false, arcPaint);

    // Mini Needle
    final needlePaint = Paint()
      ..color = const Color(0xFF0D47A1)
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final angle = math.pi + (0.75 * math.pi);
    final needleEnd = Offset(
      center.dx + (radius * 0.8) * math.cos(angle),
      center.dy + (radius * 0.8) * math.sin(angle),
    );

    canvas.drawLine(center, needleEnd, needlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
