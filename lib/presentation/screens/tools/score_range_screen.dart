import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/tool_detail_header.dart';
import '../../widgets/gauge_meter_painter.dart';

class ScoreRangeScreen extends StatefulWidget {
  final VoidCallback? onBackTap;

  const ScoreRangeScreen({
    super.key,
    this.onBackTap,
  });

  @override
  State<ScoreRangeScreen> createState() => _ScoreRangeScreenState();
}

class _ScoreRangeScreenState extends State<ScoreRangeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _scoreAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scoreAnimation = Tween<double>(
      begin: 300,
      end: 782,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    ));

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolDetailHeader(
        title: 'Score Range',
        subtitle: 'Understand where your score stands.',
        onBackTap: widget.onBackTap,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                // Top Main Card Container (Glow Shadow & Rounded Corners)
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color(0xFFEDF2F7),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0C56E8).withValues(alpha: 0.06),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Animated Gauge Visualization with score 782
                      AnimatedBuilder(
                        animation: _scoreAnimation,
                        builder: (context, child) {
                          final currentScore = _scoreAnimation.value;
                          return SizedBox(
                            width: 250,
                            height: 155,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Custom Multi-Color Arc Gauge Painter
                                CustomPaint(
                                  size: const Size(250, 145),
                                  painter: ScoreGaugePainter(
                                    score: currentScore,
                                    strokeWidth: 15.0,
                                  ),
                                ),

                                // Center count-up score value & status
                                Positioned(
                                  top: 50,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        currentScore.toInt().toString(),
                                        style: const TextStyle(
                                          fontSize: 44,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.textDark,
                                          height: 1.0,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.scoreGoodText,
                                          borderRadius: BorderRadius.circular(14),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x3300C851),
                                              blurRadius: 8,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: const Text(
                                          'Good',
                                          style: TextStyle(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Arc Outer Numbers (Perfect Positioning without Overlap)
                                const Positioned(
                                  left: 2,
                                  bottom: 2,
                                  child: Text(
                                    '300',
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 36,
                                  top: 38,
                                  child: Text(
                                    '550',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.gaugeOrange,
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  top: 0,
                                  child: Text(
                                    '700',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.gaugeYellow,
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 36,
                                  top: 38,
                                  child: Text(
                                    '800',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF10B981),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 2,
                                  bottom: 2,
                                  child: Text(
                                    '900',
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      // CIBIL Score Range Header
                      const Text(
                        'CIBIL Score Range',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMuted,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '300 – 900',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textDark,
                          letterSpacing: 0.5,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 5 Category List Items
                      const Divider(height: 1, color: Color(0xFFF1F5F9)),
                      const SizedBox(height: 14),
                      _categoryRow('Poor', '300 – 549', AppColors.gaugeRed),
                      _categoryRow('Average', '550 – 649', AppColors.gaugeOrange),
                      _categoryRow('Good', '650 – 749', AppColors.gaugeYellow, isHighlight: true),
                      _categoryRow('Very Good', '750 – 799', const Color(0xFF10B981)),
                      _categoryRow('Excellent', '800 – 900', const Color(0xFF047857)),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Bottom Tip Card (Super Premium Banner)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.bannerBg,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFD6E4FF), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD6E4FF),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.access_time_rounded,
                          color: AppColors.primaryBlue,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Text(
                          'The higher your score, the better your chances of loan approval and lower interest rates.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textDark,
                            height: 1.4,
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
      ),
    );
  }

  static Widget _categoryRow(String label, String range, Color color, {bool isHighlight = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isHighlight ? color.withValues(alpha: 0.12) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: isHighlight ? FontWeight.w900 : FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              if (isHighlight) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'You are here',
                    style: TextStyle(
                      fontSize: 8.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ],
          ),
          Text(
            range,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isHighlight ? FontWeight.w900 : FontWeight.w600,
              color: isHighlight ? color : AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
