import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'gauge_meter_painter.dart';

class CibilScoreCard extends StatefulWidget {
  final double targetScore;
  final String statusText;
  final VoidCallback? onCheckScorePressed;

  const CibilScoreCard({
    super.key,
    this.targetScore = 782,
    this.statusText = 'Good',
    this.onCheckScorePressed,
  });

  @override
  State<CibilScoreCard> createState() => _CibilScoreCardState();
}

class _CibilScoreCardState extends State<CibilScoreCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scoreAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scoreAnimation = Tween<double>(
      begin: 300,
      end: widget.targetScore,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0341C7),
            Color(0xFF0E5CF0),
            Color(0xFF1E6CF6),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0C56E8).withValues(alpha: 0.35),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background subtle circular glowing decorations
          Positioned(
            left: -30,
            top: -30,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
          ),
          Positioned(
            right: -20,
            bottom: -20,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),

          // Main Card Contents
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left Column: Text & CTA Button
                Expanded(
                  flex: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Your CIBIL Score',
                            style: TextStyle(
                              fontSize: 18.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Know your credit health\nand improve your score',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xD9FFFFFF),
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Check CIBIL Score CTA Button
                      ElevatedButton(
                        onPressed: widget.onCheckScorePressed ?? () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF0341C7),
                          elevation: 2,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 11,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Check CIBIL Score',
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0341C7),
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                              color: Color(0xFF0341C7),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 6),

                // Right Column: Animated Gauge Meter
                Expanded(
                  flex: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Gauge container with perfectly centered score text
                      AnimatedBuilder(
                        animation: _scoreAnimation,
                        builder: (context, child) {
                          final currentScore = _scoreAnimation.value;
                          return SizedBox(
                            width: 155,
                            height: 105,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Custom Gauge Painter
                                CustomPaint(
                                  size: const Size(155, 100),
                                  painter: ScoreGaugePainter(
                                    score: currentScore,
                                    strokeWidth: 13.0,
                                  ),
                                ),

                                // Center count-up score value & status
                                Positioned(
                                  top: 44,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        currentScore.toInt().toString(),
                                        style: const TextStyle(
                                          fontSize: 31,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          height: 1.0,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        widget.statusText,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.scoreGoodText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Range bottom numbers
                                const Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Text(
                                    '300',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xD9FFFFFF),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Text(
                                    '900',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xD9FFFFFF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
