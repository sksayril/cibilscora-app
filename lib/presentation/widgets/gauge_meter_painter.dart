import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ScoreGaugePainter extends CustomPainter {
  final double score;
  final double minScore;
  final double maxScore;
  final double strokeWidth;

  ScoreGaugePainter({
    required this.score,
    this.minScore = 300,
    this.maxScore = 900,
    this.strokeWidth = 13.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height - 8);
    final radius = math.min(size.width / 2, size.height) - strokeWidth;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // 1. Background Track Arc (full 180 degrees semi-circle)
    final trackPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, math.pi, math.pi, false, trackPaint);

    // 2. Multi-color Sweep Gradient (Red -> Orange -> Yellow -> Green)
    final colors = const [
      AppColors.gaugeRed,
      AppColors.gaugeOrange,
      AppColors.gaugeYellow,
      AppColors.gaugeGreen,
    ];

    final gradient = SweepGradient(
      center: Alignment.center,
      startAngle: math.pi,
      endAngle: 2 * math.pi,
      colors: colors,
      stops: const [0.0, 0.33, 0.66, 1.0],
    );

    // Current animated sweep angle fraction
    final progress = ((score - minScore) / (maxScore - minScore)).clamp(0.0, 1.0);
    final sweepAngle = progress * math.pi;

    if (sweepAngle > 0) {
      final arcPaint = Paint()
        ..shader = gradient.createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(rect, math.pi, sweepAngle, false, arcPaint);
    }

    // 3. Score Pointer Marker (white triangle at current score position)
    final angle = math.pi + sweepAngle;

    final pointerPaint = Paint()..color = Colors.white;
    final path = Path();
    final tipRadius = radius - strokeWidth / 2 - 2;
    final baseRadius = radius + strokeWidth / 2 + 3;

    final tipX = center.dx + tipRadius * math.cos(angle);
    final tipY = center.dy + tipRadius * math.sin(angle);

    final perpAngle = angle + math.pi / 2;
    final base1X = (center.dx + baseRadius * math.cos(angle)) + 5.5 * math.cos(perpAngle);
    final base1Y = (center.dy + baseRadius * math.sin(angle)) + 5.5 * math.sin(perpAngle);
    final base2X = (center.dx + baseRadius * math.cos(angle)) - 5.5 * math.cos(perpAngle);
    final base2Y = (center.dy + baseRadius * math.sin(angle)) - 5.5 * math.sin(perpAngle);

    path.moveTo(tipX, tipY);
    path.lineTo(base1X, base1Y);
    path.lineTo(base2X, base2Y);
    path.close();

    canvas.drawPath(path, pointerPaint);
  }

  @override
  bool shouldRepaint(covariant ScoreGaugePainter oldDelegate) {
    return oldDelegate.score != score || oldDelegate.strokeWidth != strokeWidth;
  }
}

class MiniGaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.85);
    final radius = size.width * 0.42;

    final rect = Rect.fromCircle(center: center, radius: radius);

    final gradient = SweepGradient(
      center: Alignment.center,
      startAngle: math.pi,
      endAngle: 2 * math.pi,
      colors: const [
        AppColors.gaugeRed,
        AppColors.gaugeOrange,
        AppColors.gaugeYellow,
        AppColors.gaugeGreen,
      ],
      stops: const [0.0, 0.33, 0.66, 1.0],
    );

    final arcPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(rect, math.pi, math.pi, false, arcPaint);

    // Needle pointing top-right
    final needleAngle = math.pi + (0.75 * math.pi);
    final needlePaint = Paint()
      ..color = const Color(0xFF1E293B)
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    final needleEndX = center.dx + (radius * 0.85) * math.cos(needleAngle);
    final needleEndY = center.dy + (radius * 0.85) * math.sin(needleAngle);

    canvas.drawLine(center, Offset(needleEndX, needleEndY), needlePaint);

    // Center pivot circle
    canvas.drawCircle(center, 6, Paint()..color = const Color(0xFF0C56E8));
    canvas.drawCircle(center, 2.5, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
