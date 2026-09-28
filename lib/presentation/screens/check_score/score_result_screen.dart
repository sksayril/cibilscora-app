import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/ad_manager.dart';
import '../../widgets/gauge_meter_painter.dart';
import '../../widgets/tool_detail_header.dart';
import '../tools/improve_score_screen.dart';
import '../main_navigation_screen.dart';
import 'check_score_form_screen.dart';

class ScoreResultScreen extends StatefulWidget {
  final int score;
  final String userName;
  final String panNumber;

  const ScoreResultScreen({
    super.key,
    required this.score,
    required this.userName,
    required this.panNumber,
  });

  @override
  State<ScoreResultScreen> createState() => _ScoreResultScreenState();
}

class _ScoreResultScreenState extends State<ScoreResultScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _scoreAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _scoreAnimation = Tween<double>(
      begin: 300,
      end: widget.score.toDouble(),
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  String get _statusText {
    if (widget.score >= 750) return 'Excellent';
    if (widget.score >= 650) return 'Good';
    return 'Average';
  }

  Color get _statusColor {
    if (widget.score >= 750) return const Color(0xFF047857);
    if (widget.score >= 650) return AppColors.toolGreenIcon;
    return AppColors.gaugeOrange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolDetailHeader(
        title: 'CIBIL Score Result',
        subtitle: 'Your official score calculation.',
        onBackTap: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
            (route) => false,
          );
        },
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              // Top User Details Summary Badge Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.toolBlueBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFD6E4FF), width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: AppColors.primaryBlue,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'PAN: ${widget.panNumber} • Verified Report',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.toolGreenBg,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFC6F6D5), width: 1),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.verified_rounded,
                              size: 12, color: AppColors.toolGreenIcon),
                          SizedBox(width: 3),
                          Text(
                            'Verified',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.toolGreenIcon,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Animated Gauge Meter Container Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
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
                    // Count-up Animated Gauge Meter
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
                              CustomPaint(
                                size: const Size(250, 145),
                                painter: ScoreGaugePainter(
                                  score: currentScore,
                                  strokeWidth: 15.0,
                                ),
                              ),
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
                                        color: _statusColor,
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                            color: _statusColor.withValues(alpha: 0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        _statusText,
                                        style: const TextStyle(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Positioned(left: 2, bottom: 2, child: Text('300', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: AppColors.textMuted))),
                              const Positioned(right: 2, bottom: 2, child: Text('900', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: AppColors.textMuted))),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 18),

                    Text(
                      'Your CIBIL Score is ${widget.score}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'You have a strong credit profile. Lenders view your profile favorably for loan and card approvals.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textMuted,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Key Factors Summary Card
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Credit Profile Factors',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _factorRow('Payment History', '98% On-Time', AppColors.toolGreenIcon),
                    const Divider(height: 16, thickness: 0.8, color: Color(0xFFF1F5F9)),
                    _factorRow('Credit Utilization', '24% Used', AppColors.toolGreenIcon),
                    const Divider(height: 16, thickness: 0.8, color: Color(0xFFF1F5F9)),
                    _factorRow('Credit History Age', '4 Yrs 2 Mos', AppColors.toolOrangeIcon),
                    const Divider(height: 16, thickness: 0.8, color: Color(0xFFF1F5F9)),
                    _factorRow('Total Hard Enquiries', '2 Enquiries', AppColors.primaryBlue),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Action Buttons
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        AdManager.instance.showRewardedAdWithLoader(
                          context,
                          onAdDismissed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const ImproveScoreScreen(),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'View Tips to Improve Score',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            AdManager.instance.showRewardedAdWithLoader(
                              context,
                              onAdDismissed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => const CheckScoreFormScreen(),
                                  ),
                                );
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 13),
                          ),
                          child: const Text(
                            'Check Again',
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            AdManager.instance.showRewardedAdWithLoader(
                              context,
                              onAdDismissed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
                                  (route) => false,
                                );
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFCBD5E1), width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 13),
                          ),
                          child: const Text(
                            'Back to Home',
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _factorRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
