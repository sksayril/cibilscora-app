import 'package:flutter/material.dart';
import 'gauge_meter_painter.dart';

class ProfileBannerCard extends StatelessWidget {
  const ProfileBannerCard({super.key});

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
            color: const Color(0xFF0C56E8).withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background subtle glowing circles
          Positioned(
            left: -20,
            top: -20,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            right: -10,
            bottom: -10,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Row(
              children: [
                // Left Column Copy
                Expanded(
                  flex: 55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Take Control of\nYour Credit Health',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.25,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Smart tools. Clear insights.\nBetter financial future.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xD9FFFFFF),
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Column Illustration (Clipboard + Shield + Gauge)
                Expanded(
                  flex: 45,
                  child: SizedBox(
                    height: 105,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        // Clipboard Container
                        Positioned(
                          right: 12,
                          top: 0,
                          child: Container(
                            width: 86,
                            height: 100,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Clipboard Top Binder Clip
                                Container(
                                  width: 16,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0C56E8),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                const SizedBox(height: 6),

                                // User icon + CIBIL SCORE text header
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFD6E4FF),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.person,
                                        size: 11,
                                        color: Color(0xFF0C56E8),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'CIBIL',
                                          style: TextStyle(
                                            fontSize: 8.5,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF0C56E8),
                                            height: 1.0,
                                          ),
                                        ),
                                        Text(
                                          'SCORE',
                                          style: TextStyle(
                                            fontSize: 6.5,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF475569),
                                            height: 1.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8),

                                // Dummy document lines
                                Container(
                                  width: 60,
                                  height: 3,
                                  color: const Color(0xFFE2E8F0),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  width: 44,
                                  height: 3,
                                  color: const Color(0xFFE2E8F0),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Mini Gauge Graphic at Clipboard bottom
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: 64,
                            height: 44,
                            child: CustomPaint(
                              painter: MiniGaugePainter(),
                            ),
                          ),
                        ),

                        // Green Shield Checkmark Badge Overlay
                        Positioned(
                          left: 4,
                          bottom: 12,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Color(0xFF00C851),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x4000C851),
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 18,
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
        ],
      ),
    );
  }
}
