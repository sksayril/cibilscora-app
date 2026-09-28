import 'package:flutter/material.dart';
import '../widgets/profile_banner_card.dart';
import '../widgets/profile_menu_list.dart';

class ProfileScreen extends StatefulWidget {
  final Function(String title)? onNavigateToTool;

  const ProfileScreen({
    super.key,
    this.onNavigateToTool,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
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
              // Top Banner Card ("Take Control of Your Credit Health")
              const ProfileBannerCard(),

              const SizedBox(height: 18),

              // Menu Options List with Tool Navigation & External URL launching
              ProfileMenuList(
                onItemTap: (itemTitle) {
                  switch (itemTitle) {
                    case 'Credit Report':
                    case 'Score Range Guide':
                      widget.onNavigateToTool?.call('Score Range');
                      break;
                    case 'Tips to Improve Score':
                      widget.onNavigateToTool?.call('Improve Score');
                      break;
                    case 'EMI Calculator':
                      widget.onNavigateToTool?.call('EMI Calculator');
                      break;
                  }
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
