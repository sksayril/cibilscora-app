import 'package:flutter/material.dart';
import '../widgets/guide_header.dart';
import '../widgets/guide_banner_card.dart';
import '../widgets/guide_topics_section.dart';

class GuideScreen extends StatefulWidget {
  final VoidCallback? onBackTap;

  const GuideScreen({
    super.key,
    this.onBackTap,
  });

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.06),
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
      appBar: GuideHeader(
        onBackTap: widget.onBackTap,
        onHelpTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Opening Help & Support...')),
          );
        },
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Banner Card ("Your Guide to Better Credit")
                const GuideBannerCard(),

                const SizedBox(height: 20),

                // Guide Topics Section (6 Topic Cards)
                GuideTopicsSection(
                  onTopicTap: (topicTitle) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Opening: $topicTitle')),
                    );
                  },
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
