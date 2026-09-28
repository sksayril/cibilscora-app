import 'package:flutter/material.dart';
import '../../core/services/ad_manager.dart';
import '../widgets/cibil_score_card.dart';
import '../widgets/quick_tools_section.dart';
import '../widgets/habits_banner_card.dart';
import 'check_score/check_score_form_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(String title)? onOpenToolDetail;

  const HomeScreen({
    super.key,
    this.onOpenToolDetail,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

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
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top CIBIL Score Card with Check CIBIL Score Button (Triggers Ad Loader + Rewarded Ad)
              CibilScoreCard(
                targetScore: 782,
                statusText: 'Good',
                onCheckScorePressed: () {
                  AdManager.instance.showRewardedAdWithLoader(
                    context,
                    onAdDismissed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CheckScoreFormScreen(),
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 22),

              // Quick Tools Section (Triggers Ad Loader + Rewarded Ads)
              QuickToolsSection(
                onToolTap: (toolName) => widget.onOpenToolDetail?.call(toolName),
              ),

              const SizedBox(height: 22),

              // Habits Banner Card
              HabitsBannerCard(
                onViewTipsTap: () {
                  widget.onOpenToolDetail?.call('Improve Score');
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
