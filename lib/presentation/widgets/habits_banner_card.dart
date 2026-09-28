import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'gauge_meter_painter.dart';

class HabitsBannerCard extends StatelessWidget {
  final VoidCallback? onViewTipsTap;

  const HabitsBannerCard({
    super.key,
    this.onViewTipsTap,
  });

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
      child: Stack(
        children: [
          // Background Sparkle / Star accents
          const Positioned(
            left: 210,
            top: 24,
            child: Text('✨', style: TextStyle(fontSize: 14, color: Color(0xFF93C5FD))),
          ),
          const Positioned(
            left: 175,
            bottom: 20,
            child: Text('✨', style: TextStyle(fontSize: 12, color: Color(0xFF93C5FD))),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                // Left Column Text
                Expanded(
                  flex: 55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Good habits today,',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Better score tomorrow!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // View Tips CTA
                      InkWell(
                        onTap: onViewTipsTap ?? () {},
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'View Tips',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryBlue,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 16,
                                color: AppColors.primaryBlue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Column Illustration (Mini gauge + Person figure)
                Expanded(
                  flex: 45,
                  child: SizedBox(
                    height: 100,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Gauge Arc Illustration
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: 100,
                            height: 70,
                            child: CustomPaint(
                              painter: MiniGaugePainter(),
                            ),
                          ),
                        ),

                        // Checkmark Badge Bubble above character
                        Positioned(
                          right: 32,
                          top: 4,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Color(0xFF7CD33B),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x337CD33B),
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
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

                        // Standing Character Illustration Widget
                        Positioned(
                          right: 4,
                          bottom: 0,
                          child: const _CharacterIllustration(),
                        ),
                      ],
                    ),
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

class _CharacterIllustration extends StatelessWidget {
  const _CharacterIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 75,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Person Body
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Head
              Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFCC99),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 14,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 9),
                    decoration: const BoxDecoration(
                      color: Color(0xFF4A3E3D),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(7)),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 2),

              // Torso / Shirt (Blue)
              Container(
                width: 22,
                height: 26,
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),

              // Legs / Pants (Dark Blue)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 28,
                    color: const Color(0xFF1E293B),
                  ),
                  const SizedBox(width: 3),
                  Container(
                    width: 7,
                    height: 28,
                    color: const Color(0xFF1E293B),
                  ),
                ],
              ),
            ],
          ),

          // Pointing Arm extended towards gauge checkmark
          Positioned(
            left: 2,
            top: 18,
            child: Transform.rotate(
              angle: -0.6,
              child: Container(
                width: 14,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
