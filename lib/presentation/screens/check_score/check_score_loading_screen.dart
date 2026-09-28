import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'score_result_screen.dart';

class CheckScoreLoadingScreen extends StatefulWidget {
  final String userName;
  final String panNumber;

  const CheckScoreLoadingScreen({
    super.key,
    required this.userName,
    required this.panNumber,
  });

  @override
  State<CheckScoreLoadingScreen> createState() =>
      _CheckScoreLoadingScreenState();
}

class _CheckScoreLoadingScreenState extends State<CheckScoreLoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  Timer? _timer;
  int _currentStep = 0;

  final List<String> _loadingSteps = [
    'Connecting to Credit Bureau...',
    'Verifying PAN details...',
    'Analyzing Credit History & Accounts...',
    'Generating your CIBIL Score...',
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.92, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Progress step updates every 700ms
    _timer = Timer.periodic(const Duration(milliseconds: 700), (timer) {
      if (_currentStep < _loadingSteps.length - 1) {
        setState(() {
          _currentStep++;
        });
      } else {
        timer.cancel();
        _navigateToResult();
      }
    });
  }

  void _navigateToResult() {
    // Generate random score between 660 and 790
    final randomScore = math.Random().nextInt(131) + 660; // 660 to 790 inclusive

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => ScoreResultScreen(
          score: randomScore,
          userName: widget.userName,
          panNumber: widget.panNumber,
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Animated Pulse Loading Shield/Gauge Graphic
              ScaleTransition(
                scale: _pulseAnimation,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.toolBlueBg,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withValues(alpha: 0.2),
                        blurRadius: 24,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.speed_rounded,
                      color: AppColors.primaryBlue,
                      size: 60,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 36),

              // Progress Step Text
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  _loadingSteps[_currentStep],
                  key: ValueKey<int>(_currentStep),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Please wait while we fetch your latest official score.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textMuted,
                ),
              ),

              const SizedBox(height: 28),

              // User Info Card Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.person_outline_rounded,
                        size: 18, color: AppColors.primaryBlue),
                    const SizedBox(width: 8),
                    Text(
                      widget.userName,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(width: 1, height: 12, color: const Color(0xFFCBD5E1)),
                    const SizedBox(width: 10),
                    Text(
                      widget.panNumber,
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMuted,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Linear Progress Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (_currentStep + 1) / _loadingSteps.length,
                  backgroundColor: const Color(0xFFE2E8F0),
                  color: AppColors.primaryBlue,
                  minHeight: 6,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
