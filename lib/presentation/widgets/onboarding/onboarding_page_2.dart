import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Image.asset(
            'assets/images/onboarding_2_full.png',
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Center(
              child: Icon(
                Icons.image_not_supported_rounded,
                size: 80,
                color: Color(0xFF94A3B8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
