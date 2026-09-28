import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../constants/app_colors.dart';

class AdManager {
  static final AdManager instance = AdManager._internal();
  AdManager._internal();

  static const String rewardedAdUnitId =
      'ca-app-pub-3439538968584869/1637992593';

  RewardedAd? _rewardedAd;
  bool _isAdLoading = false;

  /// Preloads the Rewarded Ad asynchronously
  void loadRewardedAd() {
    if (_isAdLoading || _rewardedAd != null) return;
    _isAdLoading = true;

    RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isAdLoading = false;
          debugPrint('AdMob Rewarded Ad loaded successfully.');
        },
        onAdFailedToLoad: (error) {
          _rewardedAd = null;
          _isAdLoading = false;
          debugPrint('AdMob Rewarded Ad failed to load: ${error.message}');
        },
      ),
    );
  }

  /// Displays a confirmation dialog ("Watch Ad" vs "No Thanks").
  /// If "No Thanks" is tapped, dialog closes and the next step is NOT triggered.
  /// If "Watch Ad" is tapped, Ad Loader opens, Rewarded Ad is displayed, and then onAdDismissed callback executes.
  Future<void> showRewardedAdWithLoader(
    BuildContext context, {
    required VoidCallback onAdDismissed,
    String title = 'Watch Ad to Continue',
    String message = 'Please watch a short video ad to proceed to the next step.',
    String confirmText = 'Watch Ad',
    String cancelText = 'No Thanks',
  }) async {
    // 1. Show Ad Confirmation Prompt Popup
    final bool? shouldWatch = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          elevation: 10,
          insetPadding: const EdgeInsets.symmetric(horizontal: 28),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Media/Ad Icon
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: AppColors.toolBlueBg,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFD6E4FF),
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.smart_display_rounded,
                      color: AppColors.primaryBlue,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // Popup Title
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),

                // Description (No coin/reward mention)
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textMuted,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 22),

                // "Watch Ad" Primary Action Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(dialogContext).pop(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.play_arrow_rounded, size: 22),
                        const SizedBox(width: 6),
                        Text(
                          confirmText,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // "No Thanks" Secondary Button
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(false),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textMuted,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      cancelText,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // If dismissed or "No Thanks" clicked, do not proceed to next step
    if (shouldWatch != true || !context.mounted) {
      return;
    }

    // 2. User confirmed "Watch Ad": Show Ad Loading Dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  width: 44,
                  height: 44,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Loading Advertisement...',
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Please wait a moment',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // 3. If ad isn't loaded yet, attempt load & wait up to 2.5 seconds
    if (_rewardedAd == null) {
      loadRewardedAd();
      int waitedMs = 0;
      while (_rewardedAd == null && waitedMs < 2500) {
        await Future.delayed(const Duration(milliseconds: 200));
        waitedMs += 200;
      }
    }

    // 4. Close the Loader Dialog safely
    if (context.mounted && Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    // 5. Show Rewarded Ad or execute fallback callback
    if (_rewardedAd != null && context.mounted) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _rewardedAd = null;
          loadRewardedAd(); // Preload next ad
          onAdDismissed();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _rewardedAd = null;
          loadRewardedAd(); // Preload next ad
          onAdDismissed();
        },
      );

      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          debugPrint('User completed ad watch: ${reward.type}');
        },
      );
    } else {
      onAdDismissed();
    }
  }
}
