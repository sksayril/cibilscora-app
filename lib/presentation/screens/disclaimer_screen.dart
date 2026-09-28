import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/gauge_meter_painter.dart';
import 'main_navigation_screen.dart';

class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({super.key});

  void _onAccept(BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MainNavigationScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final disclaimerPoints = [
      _DisclaimerPointData(
        title: 'Not a Real CIBIL Score',
        description:
            'This app does not provide your real CIBIL score or credit report. It is not affiliated with TransUnion CIBIL or any other credit bureau.',
        icon: Icons.track_changes_rounded,
        iconBgColor: const Color(0xFFFCE8E6),
        iconColor: const Color(0xFFE53935),
      ),
      _DisclaimerPointData(
        title: 'For Educational & Informational Purpose Only',
        description:
            'This app is designed to guide you on how CIBIL score works, what factors affect it, and how you can improve your score.',
        icon: Icons.school_rounded,
        iconBgColor: const Color(0xFFF3E8FF),
        iconColor: const Color(0xFF9333EA),
      ),
      _DisclaimerPointData(
        title: 'Guidance, Not Guarantee',
        description:
            'We provide tips, suggestions and simulated insights to help you understand and improve your credit score. Results may vary based on individual financial behavior.',
        icon: Icons.trending_up_rounded,
        iconBgColor: const Color(0xFFE0F2FE),
        iconColor: const Color(0xFF0284C7),
      ),
      _DisclaimerPointData(
        title: 'Your Financial Decisions',
        description:
            'All financial decisions you make are your responsibility. Always consult official sources or financial advisors before taking any financial action.',
        icon: Icons.verified_user_rounded,
        iconBgColor: const Color(0xFFDCFCE7),
        iconColor: const Color(0xFF16A34A),
      ),
      _DisclaimerPointData(
        title: 'No Liability',
        description:
            'We are not responsible for any loss or damage resulting from the use of this app or reliance on the information provided.',
        icon: Icons.lock_rounded,
        iconBgColor: const Color(0xFFFEF3C7),
        iconColor: const Color(0xFFD97706),
      ),
      _DisclaimerPointData(
        title: 'By Using This App',
        description:
            'By using this app, you acknowledge and agree to this disclaimer.',
        icon: Icons.balance_rounded,
        iconBgColor: const Color(0xFFE0F2FE),
        iconColor: const Color(0xFF2563EB),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    // Top Wave Background Graphic & Logo Header
                    SizedBox(
                      height: 190,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Soft Radial Glow
                          Positioned(
                            top: 10,
                            child: Container(
                              width: 200,
                              height: 170,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF0C56E8).withValues(alpha: 0.05),
                              ),
                            ),
                          ),

                          // Left Floating Blue Exclamation Shield
                          Positioned(
                            left: 20,
                            top: 55,
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryBlue.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.priority_high_rounded,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ),

                          // Right Floating Checklist Badge
                          Positioned(
                            right: 25,
                            top: 65,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2563EB),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF2563EB).withValues(alpha: 0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),

                          // Center CIBIL SCORE APP Logo Card
                          Container(
                            width: 155,
                            height: 140,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(26),
                              border: Border.all(color: const Color(0xFF0C56E8), width: 3.0),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF0C56E8).withValues(alpha: 0.12),
                                  blurRadius: 16,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CustomPaint(
                                        size: const Size(100, 44),
                                        painter: ScoreGaugePainter(score: 782, strokeWidth: 7.5),
                                      ),
                                      Positioned(
                                        top: 8,
                                        child: Column(
                                          children: [
                                            const Text(
                                              '782',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                                color: AppColors.textDark,
                                                height: 1.0,
                                              ),
                                            ),
                                            const SizedBox(height: 1),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                              decoration: BoxDecoration(
                                                color: AppColors.scoreGoodText,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: const Text(
                                                'Good',
                                                style: TextStyle(fontSize: 7.5, fontWeight: FontWeight.bold, color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'CIBIL',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF0D47A1),
                                    letterSpacing: 0.5,
                                    height: 1.0,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0D47A1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    'SCORE APP',
                                    style: TextStyle(
                                      fontSize: 8.5,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Main Section Title: — DISCLAIMER —
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 30,
                          child: Divider(color: AppColors.primaryBlue, thickness: 2.0),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'DISCLAIMER',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: AppColors.textDark,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          width: 30,
                          child: Divider(color: AppColors.primaryBlue, thickness: 2.0),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Top Info Banner Pill
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFDBEAFE), width: 1),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.info_rounded, color: AppColors.primaryBlue, size: 20),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Please read this disclaimer carefully before using the CIBIL Score App.',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // 6 Disclaimer Cards
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: disclaimerPoints.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final point = disclaimerPoints[index];
                        return Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF64748B).withValues(alpha: 0.03),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: point.iconBgColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  point.icon,
                                  color: point.iconColor,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      point.title,
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.bold,
                                        color: point.iconColor,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      point.description,
                                      style: const TextStyle(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textMuted,
                                        height: 1.38,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Bottom Sticky CTA Button ("I Understand & Accept ➔")
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => _onAccept(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          color: AppColors.primaryBlue,
                          size: 16,
                        ),
                      ),
                      const Text(
                        'I Understand & Accept',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.primaryBlue,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DisclaimerPointData {
  final String title;
  final String description;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  _DisclaimerPointData({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}
