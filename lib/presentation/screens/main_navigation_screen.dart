import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import '../../core/services/ad_manager.dart';
import '../widgets/app_header.dart';
import '../widgets/custom_bottom_nav.dart';
import 'home_screen.dart';
import 'guide_screen.dart';
import 'tools_screen.dart';
import 'profile_screen.dart';
import 'check_score/check_score_form_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  final GlobalKey<ToolsScreenState> _toolsKey = GlobalKey<ToolsScreenState>();

  @override
  void initState() {
    super.initState();
    _checkForInAppUpdate();
  }

  Future<void> _checkForInAppUpdate() async {
    try {
      final updateInfo = await InAppUpdate.checkForUpdate();
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.flexibleUpdateAllowed) {
          await InAppUpdate.startFlexibleUpdate();
          await InAppUpdate.completeFlexibleUpdate();
        } else if (updateInfo.immediateUpdateAllowed) {
          await InAppUpdate.performImmediateUpdate();
        }
      }
    } catch (e) {
      debugPrint('InAppUpdate check error: $e');
    }
  }

  void _onNavigateToTool(String title) {
    setState(() {
      _currentIndex = 3;
    });
    _toolsKey.currentState?.openDetail(title);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(
        onOpenToolDetail: _onNavigateToTool,
      ),
      GuideScreen(
        onBackTap: () {
          setState(() {
            _currentIndex = 0;
          });
        },
      ),
      const ToolsScreen(
        initialDetailScreen: 'Score Range',
      ),
      ToolsScreen(
        key: _toolsKey,
      ),
      ProfileScreen(
        onNavigateToTool: _onNavigateToTool,
      ),
    ];

    return Scaffold(
      appBar: _currentIndex == 1 ? null : const AppHeader(),
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            // Tapping center Check Score action button shows Ad Loader + Rewarded Ad
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
          } else {
            setState(() {
              _currentIndex = index;
              if (index == 3) {
                // Reset to main tools dashboard when tapping Tools tab
                _toolsKey.currentState?.closeDetail();
              }
            });
          }
        },
      ),
    );
  }
}
