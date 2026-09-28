import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/gauge_meter_painter.dart';
import 'onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: Curves.easeOutBack,
      ),
    );

    _animController.forward();

    // 2.6 second splash duration transition to OnboardingScreen
    _timer = Timer(const Duration(milliseconds: 2600), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const OnboardingScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Top Left Blue Gradient Curved Waves
          Positioned(
            left: 0,
            top: 0,
            child: CustomPaint(
              size: Size(size.width, 220),
              painter: _TopWavePainter(),
            ),
          ),

          // 2. Top Right Dot Matrix Pattern
          Positioned(
            right: 16,
            top: 24,
            child: SizedBox(
              width: 90,
              height: 90,
              child: CustomPaint(
                painter: _DotMatrixPainter(),
              ),
            ),
          ),

          // 3. Center Content Area (Logo + Headline + 4 Badges)
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),

                // CIBIL SCORE APP Logo Badge Frame with Entrance Scale Animation
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 210,
                      height: 190,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: const Color(0xFF0C56E8),
                          width: 4.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF0C56E8).withValues(alpha: 0.18),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 140,
                            height: 70,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomPaint(
                                  size: const Size(140, 64),
                                  painter: ScoreGaugePainter(
                                    score: 782,
                                    strokeWidth: 10.0,
                                  ),
                                ),
                                Positioned(
                                  top: 14,
                                  child: Column(
                                    children: [
                                      const Text(
                                        '782',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.textDark,
                                          height: 1.0,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 7,
                                          vertical: 1.5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.scoreGoodText,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          'Good',
                                          style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 12,
                                  child: Container(
                                    padding: const EdgeInsets.all(3.5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF10B981),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'CIBIL',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF0D47A1),
                              letterSpacing: 0.5,
                              height: 1.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2.5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D47A1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'SCORE APP',
                              style: TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Headline & Sub-Headline
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                      fontFamily: 'Roboto',
                    ),
                    children: [
                      TextSpan(text: 'Check Your '),
                      TextSpan(
                        text: 'Score.',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                      fontFamily: 'Roboto',
                    ),
                    children: [
                      TextSpan(text: 'Build Your '),
                      TextSpan(
                        text: 'Future.',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Small Divider Line with Center Dot
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 28, height: 1.5, color: const Color(0xFF93C5FD)),
                    Container(
                      width: 5,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(width: 28, height: 1.5, color: const Color(0xFF93C5FD)),
                  ],
                ),

                const Spacer(flex: 2),

                // 4 Feature Circle Badges Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _featureItem(
                        icon: Icons.speed_rounded,
                        title: 'Check\nYour Score',
                        color: AppColors.primaryBlue,
                        bgColor: const Color(0xFFEBF3FF),
                        lineColor: AppColors.primaryBlue,
                      ),
                      _featureItem(
                        icon: Icons.description_rounded,
                        title: 'Detailed\nReport',
                        color: AppColors.toolGreenIcon,
                        bgColor: const Color(0xFFE8FAEE),
                        lineColor: AppColors.toolGreenIcon,
                      ),
                      _featureItem(
                        icon: Icons.security_rounded,
                        title: '100%\nSecure',
                        color: AppColors.toolPurpleIcon,
                        bgColor: const Color(0xFFF3E8FF),
                        lineColor: AppColors.toolPurpleIcon,
                      ),
                      _featureItem(
                        icon: Icons.notifications_active_rounded,
                        title: 'Real Time\nAlerts',
                        color: AppColors.toolOrangeIcon,
                        bgColor: const Color(0xFFFFF3E0),
                        lineColor: AppColors.toolOrangeIcon,
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 3),
              ],
            ),
          ),

          // 4. Bottom Blue Gradient Wave Container & Loading Spinner
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: size.height * 0.24,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Bottom Gradient Wave Custom Painter
                CustomPaint(
                  size: Size(size.width, size.height * 0.24),
                  painter: _BottomWavePainter(),
                ),

                // Loading Spinner & Status Text
                Positioned(
                  bottom: 30,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                        width: 34,
                        height: 34,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3.2,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Please wait',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF93C5FD),
                        ),
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

  Widget _featureItem({
    required IconData icon,
    required String title,
    required Color color,
    required Color bgColor,
    required Color lineColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Circular Glow Icon Box
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: color, size: 26),
        ),

        const SizedBox(height: 8),

        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
            height: 1.25,
          ),
        ),

        const SizedBox(height: 6),

        // Bottom Color Line Pill Indicator
        Container(
          width: 20,
          height: 3,
          decoration: BoxDecoration(
            color: lineColor,
            borderRadius: BorderRadius.circular(1.5),
          ),
        ),
      ],
    );
  }
}

class _TopWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF0C56E8), Color(0xFF60A5FA)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path1 = Path();
    path1.moveTo(0, 0);
    path1.lineTo(0, size.height * 0.7);
    path1.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.95,
      size.width * 0.85,
      size.height * 0.35,
    );
    path1.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.25,
      size.width,
      size.height * 0.2,
    );
    path1.lineTo(size.width, 0);
    path1.close();

    canvas.drawPath(path1, paint1);

    // Second translucent wave layer
    final paint2 = Paint()
      ..color = const Color(0xFF93C5FD).withValues(alpha: 0.25);

    final path2 = Path();
    path2.moveTo(0, 0);
    path2.lineTo(0, size.height * 0.85);
    path2.quadraticBezierTo(
      size.width * 0.5,
      size.height * 1.05,
      size.width,
      size.height * 0.45,
    );
    path2.lineTo(size.width, 0);
    path2.close();

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF0284C7), Color(0xFF0C56E8), Color(0xFF030712)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.05,
      size.width,
      size.height * 0.35,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DotMatrixPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF60A5FA).withValues(alpha: 0.35);

    const rows = 5;
    const cols = 5;
    final dx = size.width / cols;
    final dy = size.height / rows;

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        canvas.drawCircle(Offset(i * dx + dx / 2, j * dy + dy / 2), 1.8, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
